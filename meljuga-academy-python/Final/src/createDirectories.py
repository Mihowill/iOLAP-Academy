import os

def createDirectories(baseDir, landingDir, logsDir):
    os.makedirs(baseDir, exist_ok=True)
    os.makedirs(landingDir, exist_ok=True)
    os.makedirs(logsDir, exist_ok=True)