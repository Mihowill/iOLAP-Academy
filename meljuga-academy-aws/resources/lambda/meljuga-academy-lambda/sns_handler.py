import boto3
import functools
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def sns_error_handler(func):
    sns_client = boto3.client('sns')
    
    
    SNS_TOPIC_ARN = 'arn:aws:sns:eu-central-1:456582705970:meljuga-academy-sns-lambda'
    
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        try:
            response = func(*args, **kwargs) 
            sns_client.publish(
                TopicArn=SNS_TOPIC_ARN,
                Message= "Great Success!",
                Subject='Lambda Executed Successfully'
            )
            return response 
        except Exception as e:
            logger.error(f"Lambda encountered an error: {str(e)}")
            sns_client.publish(
                TopicArn=SNS_TOPIC_ARN,
                Message=f"Lambda encountered an error: {str(e)}",
                Subject='Lambda Error'
            )
            return {
                'statusCode': 500,
                'body': "An error occurred."
            }
    return wrapper
