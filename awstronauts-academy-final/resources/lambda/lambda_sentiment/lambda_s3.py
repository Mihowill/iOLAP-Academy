import boto3
import pandas as pd
import json
import io
import logging
import sys
import os
import botocore.exceptions

#logging configuration
logging.basicConfig(
    format='%(asctime)s.%(msecs)03d %(levelname)s %(module)s - %(funcName)s: %(message)s',
    stream=sys.stdout,
    level=logging.INFO)
logger = logging.getLogger("awstronauts-lambda")
logger.setLevel(logging.INFO)

#initialization of AWS clients for S3, Translate and Comprehend
s3 = boto3.client('s3', region_name='eu-central-1')
translate = boto3.client('translate', region_name='eu-central-1')
comprehend = boto3.client('comprehend', region_name='eu-central-1')

#env variables for S3:
INPUT_BUCKET = os.getenv('INPUT_BUCKET', 'awstronauts-academy-bucket')
INPUT_BUCKET_KEY = os.getenv('INPUT_BUCKET_KEY', 'sentiment/products/')
OUTPUT_BUCKET = os.getenv('OUTPUT_BUCKET', 'awstronauts-academy-bucket')
OUTPUT_BUCKET_KEY = os.getenv('OUTPUT_BUCKET_KEY', 'sentiment/results/sentiment_results.json')

parquet_files = [] #list to store parquet data
supported_languages = [
'af', 'sq', 'am', 'ar', 'hy', 'az', 'bn', 'bs', 'bg', 'ca',
'zh', 'zh-TW', 'hr', 'cs', 'da', 'fa-AF', 'nl', 'en', 'et',
'fa', 'tl', 'fi', 'fr', 'fr-CA', 'ka', 'de', 'el', 'gu', 'ht',
'ha', 'he', 'hi', 'hu', 'is', 'id', 'ga', 'it', 'ja', 'kn',
'kk', 'ko', 'lv', 'lt', 'mk', 'ms', 'ml', 'mt', 'mr', 'mn',
'no', 'ps', 'pl', 'pt', 'pt-PT', 'pa', 'ro', 'ru', 'sr', 'si',
'sk', 'sl', 'so', 'es', 'es-MX', 'sw', 'sv', 'ta', 'te', 'th',
'tr', 'uk', 'ur', 'uz', 'vi', 'cy'] #list of supported languages for translation and sentiment analysis
translate_cost_per_100k_characters = 1.5
sentiment_analysis_cost_per_1M_characters = 1.0
language_detection_cost_per_1M_characters = 1.0

#function for downloading Parquet data from S3 bucket
def download_parquet_files(INPUT_BUCKET, INPUT_BUCKET_KEY, s3):
    try:
        response = s3.list_objects_v2(Bucket=INPUT_BUCKET, Prefix=INPUT_BUCKET_KEY)
        input_bucket_objects = response.get('Contents', [])

        for obj in input_bucket_objects:
            obj_key = obj['Key']
            response = s3.get_object(Bucket=INPUT_BUCKET, Key=obj_key)
            parquet_data = response['Body'].read()
            parquet_files.append((obj_key, parquet_data))
        return parquet_files
    
    except botocore.exceptions.ClientError as e:
        error_message = f"Error while downloading Parquet files from S3: {str(e)}"
        logger.error(error_message)
        raise e
    except Exception as e:
        error_message = f"An unexpected error occurred while downloading Parquet files: {str(e)}"
        logger.error(error_message)
        raise e

#function for processing Parquet data and converting it to text
def process_parquet(parquet_data):
    try:
        df = pd.read_parquet(io.BytesIO(parquet_data), columns=['full_text', 'user_id'])
        text_data = df['full_text'].astype(str)
        return text_data
    
    except pd.errors.PandasError as e:
        error_message = f"Error while processing Parquet data: {str(e)}"
        logger.error(error_message)
        raise e
    
#function for detecting the language of the text using Comprehend
def detect_language(text_data, comprehend):
    try:
        language_response = comprehend.detect_dominant_language(Text=text_data)
        detected_language = language_response['Languages'][0]['LanguageCode']
        return detected_language
    
    except botocore.exceptions.ClientError as e:
        error_message = f"Error while detecting language with Comprehend: {str(e)}"
        logger.error(error_message)
        raise e

#function for translating text with Amazon Translate
def translate_text(text_data, translate):
    try:
        response = translate.translate_text(
            Text=text_data,
            SourceLanguageCode='auto',
            TargetLanguageCode='en'
        )
        translated_text = response['TranslatedText']
        return translated_text
    
    except botocore.exceptions.ClientError as e:
        error_message = f"Error while translating text with Amazon Translate: {str(e)}"
        logger.error(error_message)
        raise e

#function for analysis sentiment of translated text with Comprehend
def analyze_sentiment(translated_text, comprehend):
    try:
        sentiment_response = comprehend.detect_sentiment(
            Text=translated_text,
            LanguageCode='en'
        )
        sentiment = sentiment_response['Sentiment']
        return sentiment
    
    except botocore.exceptions.ClientError as e:
        error_message = f"Error while analyzing sentiment with Comprehend: {str(e)}"
        logger.error(error_message)
        raise e

#function for saving sentiment results to S3 bucket
def write_sentiment_to_s3(translated_tweets, OUTPUT_BUCKET, s3):
    try:
        for tweet in translated_tweets:
            tweet['OriginalText'] = tweet['OriginalText'].replace('\n', ' ')
            tweet['TranslatedText'] = tweet['TranslatedText'].replace('\n', ' ')

        output_data = json.dumps(translated_tweets, ensure_ascii=False, indent=2)
        s3.put_object(
            Bucket=OUTPUT_BUCKET,
            Key=OUTPUT_BUCKET_KEY,
            Body=output_data,
            ContentType='application/json'
        )

    except botocore.exceptions.ClientError as e:
        error_message = f"Error writing sentiment to S3: {str(e)}"
        logger.error(error_message)
        raise e
    except Exception as e:
        error_message = f"An unexpected error occurred while writing sentiment to S3: {str(e)}"
        logger.error(error_message)
        raise e

def lambda_handler(event, context):
    try:
        parquet_files = download_parquet_files(INPUT_BUCKET, INPUT_BUCKET_KEY, s3)
        translated_tweets = [] #list to store translated and analyzed tweets
        total_translated_characters = 0 
        total_language_detection_characters = 0
        total_sentiment_analysis_characters = 0

        for obj_key, parquet_data in parquet_files:
            text_data = process_parquet(parquet_data)
            product_name = obj_key.split('/')[-1].split('.')[0]

            for _, row in text_data.iterrows():
                full_text = row['full_text']
                user_id = row['user_id']

                if len(full_text) >= 30: #this is the cheaper option for language detection
                    detected_language = detect_language(full_text[:30], comprehend)
                    total_language_detection_characters += 30
                else:
                    detected_language = detect_language(full_text, comprehend)
                    total_language_detection_characters += len(full_text)

                supported_languages_set = set(supported_languages) #convert supported_languages list to a set for faster lookup
                if detected_language != 'en' and detected_language in supported_languages_set:
                    translated_text = translate_text(full_text, translate)
                    translated_characters = len(translated_text)

                    total_translated_characters += translated_characters
                    total_sentiment_analysis_characters += len(translated_text)
                else:
                    translated_text = full_text
                    translated_characters = 0

                sentiment = analyze_sentiment(translated_text, comprehend)

                translated_tweets.append({
                    'Product': product_name,
                    'user_id': user_id,
                    'OriginalText': full_text,
                    'TranslatedText': translated_text,
                    'Sentiment': sentiment
                })
                
        logger.info('Total language detection characters: {}'.format(total_language_detection_characters))
        logger.info('Total translated characters: {}'.format(total_translated_characters))
        logger.info('Total sentiment analysis characters: {}'.format(total_sentiment_analysis_characters))

        #calculate the cost based on the number of translated characters for Translate and Comprehend
        translate_cost = round((total_translated_characters / 100000) * translate_cost_per_100k_characters, 3)
        sentiment_analysis_cost = round((total_sentiment_analysis_characters / 1000000) * sentiment_analysis_cost_per_1M_characters, 3)
        language_detection_cost = round((total_language_detection_characters / 1000000) * language_detection_cost_per_1M_characters, 3)
        total_cost = round(translate_cost + sentiment_analysis_cost + language_detection_cost, 3)
        logger.info('Translation cost: ${:.3f}, Comprehend cost: ${:.3f}, Total cost: ${:.3f}'.format(translate_cost, sentiment_analysis_cost+language_detection_cost, total_cost))

        write_sentiment_to_s3(translated_tweets, OUTPUT_BUCKET, s3)
        logger.info('Processed {} tweets.'.format(len(translated_tweets)))
        return {
            'statusCode': 200,
            'body': 'Processed {} tweets.'.format(len(translated_tweets))
        }
    except Exception as e:
        logger.error(f"An error occurred: {str(e)}")
        raise e