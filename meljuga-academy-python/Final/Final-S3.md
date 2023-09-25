# Python - Final Assignment

## Final Assignment - Data Upload

Use **AWS S3** service to store landing IMDb data.

1. Create an S3 bucket ([documentation](https://docs.aws.amazon.com/AmazonS3/latest/userguide/creating-bucket.html)) 
   - name: `<username>-academy-python`
   - region: `eu-central-1`
   - tag: `owner = <username>-academy`
   - other options can be left unchanged
2. Create a database in Glue Data Catalog (`eu-central-1`) ([documentation](https://docs.aws.amazon.com/glue/latest/dg/start-data-catalog.html) - **only follow Step 1**)
   - name `<username>-academy-python-landing`
   - location: `s3://<username>-academy-python/imdb/landing`
   - description: `iOLAP Academy 2023 - <username> Python Landing`

## Job flow

### Landing - S3

1. Iterate over *jobs*
2. Request table partitions using the source API 
3. Request table data using *jobs configuration* and the collected partitions
4. Save response JSON data to `s3://<username>-academy-python/imdb/landing/<table-name>/` using [awswrangler.s3.to_parquet](https://aws-sdk-pandas.readthedocs.io/en/stable/stubs/awswrangler.s3.to_parquet.html) (make sure to define the `database`, `table` and other related arguments)
5. Update *jobs configuration* to include the latest `min_ingestion_dttm` (this information should be stored and used by the next program invocation)
6. Navigate to AWS Athena
   - locate your database
   - query to inspect the ingested data
