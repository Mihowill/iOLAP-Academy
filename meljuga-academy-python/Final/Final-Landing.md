# Python - Final Assignment

Create a new directory named `C:\Users\<YourUser>\Projects\<user>-academy-python\Final\` and open VS Code here.

Create a Python script named `main.py`. Logging (`logger.info("Task %s: %s", arg1, arg2)`) is used to write to `stdout` and to file (`logs/%Y-%m-%d-%H-%M.log`). 

## Final Assignment - Data Ingestion

Use an **IMDb REST API** service to acquire data about movies, actors, ratings and other information:

<span style="color: red">https://</span><span style="color: yellow">ogj9fvz5cf.execute-api.eu-central-1.amazonaws.com</span><span style="color: green">/v1</span><span style="color: blue">&lt;endpoint></span></span><span style="color: gray">?param_1=&lt;>&param_2=&lt;></span>

<span style="color: red">protocol</span><span style="color: yellow">host</span><span style="color: green">prefix</span><span style="color: blue">endpoint</span></span><span style="color: gray">query+string+parameters</span> 

Query string parameters encode `" "` (space) to  `"+"` etc. (https://www.w3schools.com/tags/ref_urlencode.asp)


### IMDb REST API

Supported endpoints:

#### `GET /imdb/dataset/<table-name>?min_ingestion_dttm=<value>`

- Given there is a lot of data to consume, each endpoint serves data partitioned by `min_ingestion_dttm` (`%Y%m%dT%H%M%S.%f`)
- The partition will be useful for our program because it will enable us to skip all partitions `< min_ingestion_dttm`, so that we don't have to "*ingest*" the entire dataset every time we start our program
- Partitions are acquired using the `/imdb/partitions/<table-name>` endpoint

#### `GET /imdb/partitions/<table-name>[?min_ingestion_dttm=<value>]` 

- Responds with a list of partitions `> min_ingestion_dttm` for a given table name
- If `min_ingestion_dttm` is not provided by the Client, the Server will retrieve all available partitions for the given table


### Local Storage for Downloaded Data

#### Landing
Create a new directory named `C:\Users\<YourUser>\Projects\<user>-academy-python\Final\data\landing\`.

Table data is stored as JSON files in directories `C:\Users\<YourUser>\Projects\<user>-academy-python\Final\data\landing\<table-name>\` named `%Y%m%dT%H%M%S.%f.json`

#### Global configuration

**REST API URL**: `https://ogj9fvz5cf.execute-api.eu-central-1.amazonaws.com/v1`

**Landing directory**: `C:\Users\<YourUser>\Projects\<user>-academy-python\Final\data\landing\<table-name>\`

**Table names** ([data definitions](https://developer.imdb.com/non-commercial-datasets/)):
- *title_ratings*
- *title_crew*
- *name_basics*
- *title_basics*
- *title_principals*


#### Jobs configuration:

```json
{
    "title_ratings": {
        "uri": "/dataset/title_ratings",
        "params": {
            "min_ingestion_dttm": null
        }
    },
    "title_crew": {
        "uri": "/dataset/title_crew",
        "params": {
            "min_ingestion_dttm": null
        }
    },
    "name_basics": {
        "uri": "/dataset/name_basics",
        "params": {
            "min_ingestion_dttm": null
        }
    },
    "title_basics": {
        "uri": "/dataset/title_basics",
        "params": {
            "min_ingestion_dttm": null
        }
    },
    "title_principals": {
        "uri": "/dataset/title_principals",
        "params": {
            "min_ingestion_dttm": null
        }
    }
}
```

### Program Configuration

In `main.py`, read the *jobs configuration* and store it in a variable. Create a *global* config file (.py, .json, .toml, .yml, ...) and store it in a variable.

## Job flow

### Landing
1. Iterate over *jobs*
2. Request (https://requests.readthedocs.io/en/latest/api/#requests.get) API data using *jobs configuration*
3. Save response JSON data to `C:\Users\<YourUser>\Projects\<user>-academy-python\Final\data\landing\<table-name>\%Y%m%dT%H%M%S.%f.json`
4. Update *jobs configuration* to include the latest `min_ingestion_dttm` (this information should be stored and used by the next program invocation)
