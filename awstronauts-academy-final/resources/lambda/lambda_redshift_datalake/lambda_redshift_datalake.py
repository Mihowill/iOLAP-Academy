import psycopg2
import boto3
from botocore.exceptions import ClientError
import json

def get_secret():

    secret_name = "awstronauts-academy-final-redshift-key"
    region_name = "eu-central-1"

    # Create a Secrets Manager client
    session = boto3.session.Session()
    client = session.client(
        service_name='secretsmanager',
        region_name=region_name
    )

    try:
        get_secret_value_response = client.get_secret_value(
            SecretId=secret_name
        )
    except ClientError as e:
        # For a list of exceptions thrown, see
        # https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_GetSecretValue.html
        raise e

    # Decrypts secret using the associated KMS key.
    secret = get_secret_value_response['SecretString']
    return secret
    # Your code goes here.
secret=json.loads(json.loads(json.dumps(get_secret())))

def lambda_handler(event, context):
    redshift_cluster_identifier = 'admin-academy-redshift'
    redshift_database = 'twitter_redshift_db'
    
    conn = psycopg2.connect(
        host=f'{redshift_cluster_identifier}.c76boardkpkb.eu-central-1.redshift.amazonaws.com',
        dbname=redshift_database,
        user=secret['user'],
        password=secret['password'],
        port=5439
    )
    
    with conn.cursor() as cur:
        copy_command = f"""
            CREATE EXTERNAL SCHEMA awstronauts_academy_final_data
            FROM DATA CATALOG DATABASE 'awstronauts-academy-twitter'
            IAM_ROLE 'arn:aws:iam::456582705970:role/RedshiftRole';
        """
        cur.execute(copy_command)

    conn.commit()
    conn.close()

    return "Data loaded into Redshift successfully!"