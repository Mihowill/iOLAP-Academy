from aws_cdk import (Stack, aws_s3 as s3, aws_dynamodb as ddb, aws_lambda as _lambda, aws_s3_notifications as s3_notifications)
from constructs import Construct

lambda_path = "C:/Users/iOLAPAcademy2023/Projects/meljuga-academy-aws/cdk/meljuga_s3_stack/lambda"

class StackCreation(Stack):
    def __init__(self, scope: Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        bucket = s3.Bucket(self, "meljuga-academy-s3-cdk", bucket_name="meljuga-academy-s3-cdk")

        table = ddb.Table(self, "meljuga-academy-dynamodb-cdk", 
                          partition_key=ddb.Attribute(name="id", type=ddb.AttributeType.STRING), table_name="meljuga-academy-dynamodb-cdk")
        
        lambda_function = _lambda.Function(self, "meljuga-academy-lambda-cdk",
                                           runtime=_lambda.Runtime.PYTHON_3_9,
                                           handler="lambda_function.lambda_handler",
                                           code=_lambda.Code.from_asset(lambda_path),
                                           environment={
                                               "TABLE_NAME": table.table_name
                                           },
                                           function_name="meljuga-academy-lambda-cdk"
                                           )
        
        bucket.grant_read(lambda_function)

        table.grant_write_data(lambda_function)

        bucket.add_event_notification(s3.EventType.OBJECT_CREATED, s3_notifications.LambdaDestination(lambda_function))

        