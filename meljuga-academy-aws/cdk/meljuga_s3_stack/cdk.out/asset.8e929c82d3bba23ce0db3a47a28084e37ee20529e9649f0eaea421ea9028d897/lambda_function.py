import boto3
import json
import os

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['TABLE_NAME'])

def lambda_handler(event, context):
    
    s3_object = event['Records'][0]['s3']
    bucket = s3_object['bucket']['name']
    key = s3_object['object']['key']

    s3 = boto3.client('s3')
    response = s3.get_object(Bucket=bucket, Key=key)
    file = response['Body'].read().decode('utf-8')
    data = json.loads(file)

    table.put_item(Item={
        'id': data['id'],
        'value': data['value']
    })

    return {
        'statusCode': 200,
        'body': json.dumps('Data saved to DynamoDB')
    }