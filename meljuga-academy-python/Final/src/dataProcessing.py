import os
from datetime import datetime
import logging
import glob
import pandas as pd
import awswrangler as wr

def saveDataToFile(data, tableName, landingDir):
    filename = datetime.now().strftime("%Y%m%dT%H%M%S.%f") + ".json"
    filePath = os.path.join(landingDir, tableName, filename)
    tableDir = os.path.join(landingDir, tableName)
    os.makedirs(tableDir, exist_ok=True)
    
    with open(filePath, 'w') as file:
        file.write(data)

def saveDataToDatalake(landingDir, datalakeDir, tableName):
    files = glob.glob(os.path.join(landingDir, tableName, '*.json'))
    filePath = max(files, key=os.path.getctime)
    data = pd.read_json(filePath, lines=True)

    datalakeTableDir = os.path.join(datalakeDir, tableName)
    os.makedirs(datalakeTableDir, exist_ok=True)
    
    data.to_csv(os.path.join(datalakeTableDir, datetime.now().strftime("%Y-%m-%d.csv")), index=False)
    logging.info("Saved data to datalake for table %s.", tableName)

#finally switched to snake_case :)
def landing_s3(landing_dir, s3_dir , table_name):
    files = glob.glob(os.path.join(landing_dir, table_name, '*.json'))
    file_path = max(files, key=os.path.getctime)
    df = pd.read_json(file_path, lines=True)
    path = s3_dir + f"{table_name}/"
    wr.s3.to_parquet(df=df, path=path, dataset=True, database="meljuga-academy-python-landing", table=table_name)