import json

def readConfigurations(configFilePath):
    with open(configFilePath, "r") as configFile:
        config = json.load(configFile)
        return config
    
def updateMinIngestionDttm(configFilePath, jobName, minIngestionDttm):
    with open(configFilePath, "r+") as configFile:
        config = json.load(configFile)
        if "JOBS_CONFIG" in config and jobName in config["JOBS_CONFIG"]:
            config["JOBS_CONFIG"][jobName]["params"]["min_ingestion_dttm"] = minIngestionDttm
            configFile.seek(0)
            json.dump(config, configFile, indent=4)