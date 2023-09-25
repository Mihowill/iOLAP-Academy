import sys
import boto3
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
s3_client = boto3.client('s3')
# Initialize the GlueContext and SparkContext
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)

   

source_bucket = 'admin-academy-data'
destination_bucket = 'awstronauts-academy-bucket'
objects = s3_client.list_objects_v2(Bucket=source_bucket)
for obj in objects.get('Contents', []):
    source_key = obj['Key']
    destination_key = source_key  
    s3_client.copy_object(CopySource={'Bucket': source_bucket, 'Key': source_key},
                   Bucket=destination_bucket, Key=destination_key)
job.commit()