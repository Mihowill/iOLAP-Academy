import boto3
import pandas as pd
import json
import logging
import sys
import os
import botocore.exceptions
import psycopg2

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
OUTPUT_BUCKET = os.getenv('OUTPUT_BUCKET', 'awstronauts-academy-bucket')
OUTPUT_BUCKET_KEY = os.getenv('OUTPUT_BUCKET_KEY', 'sentiment/results/sentiment_results.json')

#env variables for Redshift:
REDSHIFT_HOST = os.getenv('REDSHIFT_HOST', 'admin-academy-redshift.c76boardkpkb.eu-central-1.redshift.amazonaws.com')
REDSHIFT_DB = os.getenv('REDSHIFT_DB', 'twitter_redshift_db')
REDSHIFT_USER = os.getenv('REDSHIFT_USER', 'admin')
REDSHIFT_PASSWORD = os.getenv('REDSHIFT_PASSWORD', 'Academy2023!')
REDSHIFT_PORT = os.getenv('REDSHIFT_PORT', '5439')

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

#function for loading data data from Redshift
def load_data_from_redshift(redshift_host, redshift_db, redshift_user, redshift_password, redshift_port, view_name):
    conn = None
    try:
        conn = psycopg2.connect(
            host=redshift_host,
            database=redshift_db,
            user=redshift_user,
            password=redshift_password,
            port=redshift_port
        )

        query = f"SELECT created_at, full_text, hashtags, {'store_name' if view_name == 'retail_outlets_table' else 'product_name'}, date"
        if view_name == 'alcohol_table':
            query += ', product_type'
        query += f" FROM twitter_redshift_db.awstronauts_academy_final_test.{view_name}"
        df = pd.read_sql_query(query, conn)

        return df

    except Exception as e:
        error_message = f"An error occurred while loading data from Redshift for view {view_name}: {str(e)}"
        logger.error(error_message)
        raise e
    finally:
        if conn is not None:
            conn.close() 
    
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
def write_sentiment_to_json(translated_tweets, OUTPUT_BUCKET, s3, OUTPUT_BUCKEY_KEY, view_name):
    try:
        for tweet in translated_tweets:
            tweet['original_text'] = tweet['original_text'].replace('\n', ' ')
            tweet['translated_text'] = tweet['translated_text'].replace('\n', ' ')

        output_data = json.dumps(translated_tweets, ensure_ascii=False, indent=2)
        output_key = f'{OUTPUT_BUCKET_KEY}_{view_name}.json'
        s3.put_object(
            Bucket=OUTPUT_BUCKET,
            Key=output_key,
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
    
def create_product_data_sentiment_table(redshift_host, redshift_db, redshift_user, redshift_password, redshift_port, df, view_name):
    conn = None
    try:
        conn = psycopg2.connect(
            host=redshift_host,
            database=redshift_db,
            user=redshift_user,
            password=redshift_password,
            port=redshift_port
        )

        drop_table_query = f"""
        DROP TABLE IF EXISTS twitter_redshift_db.awstronauts_academy_final_test.prod_{view_name};
        """
        if view_name == 'alcohol_table':
            product_column_name = 'product_name'
            create_table_query = f"""
            CREATE TABLE twitter_redshift_db.awstronauts_academy_final_test.prod_{view_name} (
                created_at TIMESTAMP,
                full_text VARCHAR(2000),
                hashtags VARCHAR(255),
                sentiment VARCHAR(255),
                {product_column_name} VARCHAR(255),
                date DATE,
                product_type VARCHAR(255)
            );
            """
        elif view_name == 'retail_outlets_table':
            product_column_name = 'store_name'
            create_table_query = f"""
            CREATE TABLE twitter_redshift_db.awstronauts_academy_final_test.prod_{view_name} (
                created_at TIMESTAMP,
                full_text VARCHAR(2000),
                hashtags VARCHAR(255),
                sentiment VARCHAR(255),
                {product_column_name} VARCHAR(255),
                date DATE
            );
            """
        else:
            product_column_name = 'product_name'
            create_table_query = f"""
            CREATE TABLE twitter_redshift_db.awstronauts_academy_final_test.prod_{view_name} (
                created_at TIMESTAMP,
                full_text VARCHAR(2000),
                hashtags VARCHAR(255),
                sentiment VARCHAR(255),
                {product_column_name} VARCHAR(255),
                date DATE
            );
            """
        insert_data_query = f"""
        INSERT INTO twitter_redshift_db.awstronauts_academy_final_test.prod_{view_name} (created_at, full_text, hashtags, sentiment, {product_column_name}, date
            {', product_type' if view_name == 'alcohol_table' else ''}
        )
        VALUES (%s, %s, %s, %s, %s, %s
            {', %s' if view_name =='alcohol_table' else ''}
        );
        """
        cursor = conn.cursor()
        cursor.execute(drop_table_query)
        cursor.execute(create_table_query)
        conn.commit()

        for _, row in df.iterrows():
            created_at = row['created_at']
            full_text = row['full_text']
            hashtags = row['hashtags']
            product_name = row[product_column_name]
            date = row['date']

            values = (
                created_at,
                full_text,
                hashtags,
                row['sentiment'],
                product_name,
                date
            )
            
            if view_name == 'alcohol_table':
                values = values + (row['product_type'],)

            cursor.execute(insert_data_query, values)
        conn.commit()

    except Exception as e:
        error_message = f"An error occurred while creating the prod_{view_name} table in Redshift: {str(e)}"
        logger.error(error_message)
        raise e
    finally:
        if conn is not None:
            conn.close()

def lambda_handler(event, context):
    try:
        view_names = ['alcohol_table', 'chocolate_table','cold_drinks_table','fast_food_table','foreign_specialties_table','coffee_table','tea_table','local_table','retail_outlets_table']
        all_results = {}
        total_service_cost = 0

        for view_name in view_names:
            total_language_detection_characters = 0
            total_translated_characters = 0
            total_sentiment_analysis_characters = 0
            total_translated_tweets = []
            total_language_detection_cost = 0
            total_translate_cost = 0
            total_sentiment_analysis_cost = 0
            
            redshift_data = load_data_from_redshift(REDSHIFT_HOST, REDSHIFT_DB, REDSHIFT_USER, REDSHIFT_PASSWORD, REDSHIFT_PORT, view_name)
            translated_tweets = [] #list to store translated and analyzed tweets

            for index, row in redshift_data.iterrows():
                created_at = row['created_at']
                full_text = row['full_text']
                hashtags = row['hashtags']
                product_name = row['store_name'] if view_name == 'retail_outlets_table' else row['product_name']
                date = row['date']

                if len(full_text) >=30: #this is the cheaper option for language detection
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

                redshift_data.at[index, 'translated_text'] = translated_text
                redshift_data.at[index, 'sentiment'] = sentiment

                translated_tweets.append({
                    'created_at': str(created_at),
                    'original_text': full_text,
                    'translated_text': translated_text,
                    'hashtags': hashtags,
                    'sentiment': sentiment,
                    'product_name': product_name,
                    'date': str(date)
                })

            total_translated_tweets.extend(translated_tweets)

            translate_cost = round((total_translated_characters / 100000) * translate_cost_per_100k_characters, 3)
            sentiment_analysis_cost = round((total_sentiment_analysis_characters / 1000000) * sentiment_analysis_cost_per_1M_characters, 3)
            
            total_translate_cost += translate_cost
            total_sentiment_analysis_cost += sentiment_analysis_cost
            
            language_detection_cost = round((total_language_detection_characters / 1000000) * language_detection_cost_per_1M_characters, 3)
            total_language_detection_cost += language_detection_cost

            logger.info('Processed {} tweets from view: {}'.format(len(translated_tweets), view_name))
            create_product_data_sentiment_table(REDSHIFT_HOST, REDSHIFT_DB, REDSHIFT_USER, REDSHIFT_PASSWORD, REDSHIFT_PORT, redshift_data, view_name)

            #storing results for this view in the dictionary
            view_results = {
                'language_detection_characters': total_language_detection_characters,
                'translated_characters': total_translated_characters,
                'sentiment_analysis_characters': total_sentiment_analysis_characters,
                'translation_cost': total_translate_cost,
                'sentiment_analysis_cost': total_sentiment_analysis_cost,
                'language_detection_cost': total_language_detection_cost,
                'total_service_cost': total_translate_cost + total_sentiment_analysis_cost + language_detection_cost,
                'processed_tweets_count': len(translated_tweets)
            }

            all_results[view_name] = view_results
            total_service_cost += view_results['total_service_cost']

            write_sentiment_to_json(total_translated_tweets, OUTPUT_BUCKET, s3, OUTPUT_BUCKET_KEY, view_name)
            logger.info('Total Service Cost for view {}: ${:.3f}'.format(view_name, view_results['total_service_cost']))

        logger.info('Total Service Cost for all views: ${:.3f}'.format(total_service_cost))

        return {
            'statusCode': 200,
            'body': 'Processed tweets for all views.',
            'results': all_results
        }
    except Exception as e:
        logger.error('An error occurred: {}'.format(str(e)))
        raise e