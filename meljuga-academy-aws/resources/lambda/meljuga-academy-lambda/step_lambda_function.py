import boto3
import requests
import json
import logging
from sns_handler import sns_error_handler

logger = logging.getLogger()
logger.setLevel(logging.INFO)

# DynamoDB
dynamodb = boto3.resource('dynamodb')
global_table = dynamodb.Table('meljuga-academy-global')
jobs_table = dynamodb.Table('meljuga-academy-jobs')

# S3
s3 = boto3.client('s3')

@sns_error_handler
def lambda_handler(event, context):
    logger.info("Received event: %s", event)
    
    min_ingestion_dttm = "?min_ingestion_dttm="
    global_config = global_table.get_item(Key={"name": "imdb-rest-api"})
    base_url = "https://ogj9fvz5cf.execute-api.eu-central-1.amazonaws.com/v1/imdb"
    
    job = {
    'table_name': event['table_name']['S'],
    'params': event['params']['S']
    }
    logger.info("This is what i get from job: %s, %s", job, type(job))
    
    table_name = job['table_name']
    logger.info("This is the table name: %s", table_name)
    
    params_dict = json.loads(job['params'])
    logger.info("Parsed params: %s", params_dict)
    
    last_ingestion = params_dict['min_ingestion_dttm']
    logger.info("This is what i get from last ingestion: %s", last_ingestion)
    
    partitions_endpoint = f"{base_url}/partitions/{table_name}/{min_ingestion_dttm}{last_ingestion}"
    partitions = requests.get(partitions_endpoint).json()
    logger.info("Fetching from endpoint: %s", partitions)
    for partition in partitions:
        logger.info("%s", partition)
        data_endpoint = f"{base_url}/dataset/{table_name}?min_ingestion_dttm={partition}"
        data = requests.get(data_endpoint).json()
        s3_key = f"imdb/landing/{table_name}/{partition}.json"
        s3.put_object(Bucket='meljuga-academy-aws', Key=s3_key, Body=json.dumps(data))
        
    if not partitions:
        logger.info("No new partitions to process.")
        return {
            "status": "success",
            "message": "No new partitions. Nothing to ingest."
        }

    last_partition = partitions[-1]
    logger.info("Updating min_ingestion_dttm with: %s", last_partition)

    current_params = {"min_ingestion_dttm": last_partition}
    current_params_str = json.dumps(current_params)

    # Update the value in DynamoDB
    jobs_table.update_item(
        Key={'table_name': table_name},
        UpdateExpression='SET params = :val',
        ExpressionAttributeValues={':val': current_params_str}
    )

    return {
        "status": "success",
        "message": "Data ingested successfully!"
    }

