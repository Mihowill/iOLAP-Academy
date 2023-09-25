import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.dynamicframe import DynamicFrame
from awsglue.job import Job
from pyspark.sql.functions import current_timestamp, current_date

args = getResolvedOptions(sys.argv, ["JOB_NAME"])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args["JOB_NAME"], args)

datasets = ["name_basics", "title_basics", "title_crew", "title_episode", "title_principals", "title_ratings"]

for dataset in datasets:
    # Promjena S3 bucket name-a
    input_path = f"s3://meljuga-academy-data/imdb/landing/{dataset}/"  
    output_path = f"s3://meljuga-academy-data/datalake/{dataset}/"  
    
    data = glueContext.create_dynamic_frame.from_options(
        format_options={"multiline": False},
        connection_type="s3",
        format="json",
        connection_options={
            "paths": [input_path],
            "recurse": True,
        },
        transformation_ctx="data",
    )

    # Convert the dynamic frame to a DataFrame for manipulation
    df = data.toDF()

    # Add the timestamp and date columns
    df = df.withColumn("datalake_timestamp", current_timestamp()) \
           .withColumn("datalake_date", current_date())

    # Convert the DataFrame back to a DynamicFrame
    updated_frame = DynamicFrame.fromDF(df, glueContext, "updated_frame")

    # Write the updated dynamic frame to the respective S3 path
    glueContext.write_dynamic_frame.from_options(
        frame=updated_frame,
        connection_type="s3",
        format="glueparquet",
        connection_options={
            "path": output_path,
            "partitionKeys": ["datalake_date"],
        },
        format_options={"compression": "snappy"},
        transformation_ctx="output_data",
    )

job.commit()