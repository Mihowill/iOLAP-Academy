import logging
from datetime import datetime
import os
import sys
import createDirectories, configuration, apiRequests, dataProcessing


def setupLogging():
    logging.basicConfig(
        level=logging.INFO,
        handlers=[
            logging.StreamHandler(sys.stdout),
            logging.FileHandler(logsDir + datetime.now().strftime("%Y-%m-%d-%H-%M.log")),
        ]
    )

if __name__ == "__main__":
    baseDir = "C:\\Users\\iOLAPAcademy2023\\Projects\\meljuga-academy-python\\Final\\"
    landingDir = os.path.join(baseDir, "data", "landing")
    datalakeDir = os.path.join(baseDir, "data", "datalake")
    os.makedirs(datalakeDir, exist_ok=True)
    configFilePath = os.path.join(baseDir, "src", "config.json")
    logsDir = baseDir + "logs\\"
    

    createDirectories.createDirectories(baseDir, landingDir, logsDir)
    
    setupLogging()

    config = configuration.readConfigurations(configFilePath)

    for jobName in config["JOBS_CONFIG"].keys():
        partitionEndpoint = config["REST_API_URL"] + f"/imdb/partitions/{jobName}"
        partitionsResponse = apiRequests.makeApiRequest(partitionEndpoint)
        params = {"min_ingestion_dttm": partitionsResponse}
        latestPartition = max(partitionsResponse)
        minIngestionDttmConfig = config["JOBS_CONFIG"][jobName]["params"]["min_ingestion_dttm"]
        minIngestionDttmConfig = datetime.strptime(minIngestionDttmConfig, "%Y%m%dT%H%M%S.%f") if minIngestionDttmConfig else datetime.min
        s3Dir = f"s3://meljuga-academy-python/imdb/landing/{jobName}/"
        if datetime.strptime(latestPartition, "%Y%m%dT%H%M%S.%f") > minIngestionDttmConfig:
            for partition in partitionsResponse:
                datasetEndpoint = config["REST_API_URL"] + f"/imdb/dataset/{jobName}"
                datasetParams = {"min_ingestion_dttm": partition}
                dataResponse = apiRequests.makeApiRequest(datasetEndpoint, datasetParams)
                configuration.updateMinIngestionDttm(configFilePath, jobName, partition)
                dataProcessing.saveDataToFile(dataResponse, jobName, landingDir)
                logging.info("Task %s completed successfully.", jobName)  
                dataProcessing.saveDataToDatalake(landingDir, datalakeDir, jobName)
                dataProcessing.landing_s3(landingDir, s3Dir, jobName)
        else:
            logging.info("No new partitions")