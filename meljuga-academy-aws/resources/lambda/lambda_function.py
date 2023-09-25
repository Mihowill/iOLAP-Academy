import json 
import boto3

def lambda_handler(event, context):

    s3 = boto3.resource("s3")
    bucket = 'meljuga-academy-scripts'
    key_global = 'meljuga-academy-imdb-global.json'
    key_jobs = 'meljuga-academy-imdb-jobs.json'

    response_s3_global = s3.get_object(Bucket=bucket, Key=key_global)
    file_global = response_s3_global['Body'].read().decode('utf-8')
    
    response_s3_jobs = s3.get_object(Bucket=bucket, Key=key_jobs)
    file_jobs = response_s3_jobs['Body'].read().decode('utf-8')

    dynamodb = boto3.resource("dynamodb")
    table_global = dynamodb.Table("meljuga-academy-dynamodb-global")
    table_jobs = dynamodb.Table("meljuga-academy-dynamodb-jobs")
    
    data_global = json.loads(file_global)
    data_jobs = json.loads(file_jobs)

    response_global = table_global.put_item(Item=data_global)
    response_jobs = table_jobs.put_item(Item=data_jobs)

    return {
        "statusCode" : 200,
        "body" : json.dumps("Item created successfully!")
    }