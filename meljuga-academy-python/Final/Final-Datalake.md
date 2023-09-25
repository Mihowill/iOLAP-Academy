# Python - Final Assignment

## Final Assignment - Data Ingestion

### Local Storage for Downloaded Data

#### Datalake
Create a new directory named `C:\Users\<YourUser>\Projects\<user>-academy-python\Final\data\datalake\`.

Table data is stored as CSV files in directories `C:\Users\<YourUser>\Projects\<user>-academy-python\Final\data\datalake\<table-name>\` named `%Y-%m-%d.csv`

## Job flow

### Datalake
1. Iterate over *jobs* to get the table name
2. Read table landing data into a `pandas.DataFrame`
3. Save CSV data to `C:\Users\<YourUser>\Projects\<user>-academy-python\Final\data\datalake\<table-name>\%Y-%m-%d.csv`

**Extra**: how can we make sure we don't load the same data to the Datalake if our program is executed more than once? -->


## Job Orchestration

1. Download and install [Z-Cron](https://z-download.de/?smd_process_download=1&download_id=69)
2. Create a Windows .bat script that calls `main.py`
3. Create a Z-Cron schedule that runs the .bat script every day @ 10.00AM (CEDT)
