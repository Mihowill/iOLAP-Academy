import json
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info("EVENT: %s", event)
    for record in event['Records']:
        #logger.info("%s", record) for debugging purpose only
        payload = record["body"]
        logger.info("%s" ,str(payload))
    return {'body': json.dumps('This lambda was triggered by SQS service.')}