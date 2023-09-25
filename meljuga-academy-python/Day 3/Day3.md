# Python - Day 3.1

Open VS Code in `C:\Users\<YourUser>\Projects\<user>-academy-python\`.

## Task submissions

Create a new folder named `Day 3`. Create a Python script named `day_3.py` and print solutions to all tasks using this script. The outputs should be formatted as: `print(f"Task {n}: ")`. If task output is a file, it should be formatted as `task_<n>.<extension>`.

**Note**: Separate your tasks with a special VSC line: `# %%` and run `Shift + Enter` <strong style="color: #ba372a">*</strong> to run the tasks individually.

<strong style="color: #ba372a">*</strong> [*Day 1 / Installation*](Day1.md#Installation) > *"Jupyter: Send Selection To Interactive Window"*


## Assignments - CSV, JSON I/O

1. Use the `csv` library to write the following content to a file.  
Hint: on Windows, `csv` appends newline between each row unless a certain parameter is specified

    ```python
    header = ["Date", "Invoice Number", "Customer", "Invoiced Amount", "Invoiced Quantity"]
    content = [
         [dt.date(2020, 1, 1), 73984, "John Wayne", 500.0, 2.0],
         [dt.date(2020, 1, 12), 51341, "Michael Johnson", 125.0, 3.5],
         [dt.date(2020, 1, 31), 43210, "Stuart Smith", 1200.0, 1.0],
    ]
    ```

2. Read `task_1.csv`:
   - [using](https://docs.python.org/3/library/csv.html#csv.reader) the `csv` library
     - [print first](https://www.geeksforgeeks.org/how-to-get-first-n-items-from-a-list-in-python/) 3 rows
   - [using](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.read_csv.html) the `pandas` library (may require install using `pip`)
     - [print sample](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.html) 3 rows
     - [print as JSON](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.to_json.html) (indent the JSON by 2)

3. Use the `requests` library (may require install using `pip`) to GET the following endpoint: https://ogj9fvz5cf.execute-api.eu-central-1.amazonaws.com/v1/python/day/3?task_no=3
   
    Response:

    ```python
    [
        {
            "Date": dt.date(2020, 1, 1),
            "Invoice Number": 73984, 
            "Customer": "John Wayne", 
            "Invoiced Amount": 500.0, 
            "Invoiced Quantity": 2.0
        },
        {
            "Date": dt.date(2020, 1, 12),
            "Invoice Number": 51341, 
            "Customer": "Michael Johnson", 
            "Invoiced Amount": 125.0, 
            "Invoiced Quantity": 3.5
        },
        {
            "Date": dt.date(2020, 1, 31),
            "Invoice Number": 43210, 
            "Customer": "Stuart Smith", 
            "Invoiced Amount": 1200.0, 
            "Invoiced Quantity": 1.0
        }
    ]
    ```

    - use the `json` library to write the *response* to `task_3.json`

4. GET: https://ogj9fvz5cf.execute-api.eu-central-1.amazonaws.com/v1/python/day/3?task_no=4
   
    Response:

    ```python
    {
        "Date": {
            0: date(2020, 1, 1), 
            1: date(2020, 1, 12), 
            2: date(2020, 1, 31)
        },
        "Invoice Number": {
            0: 73984,
            1: 51341,
            2: 43210
        }, 
        "Customer": {
            0: "John Wayne",
            1: "Michael Johnson",
            2: "Stuart Smith"
        }, 
        "Invoiced Amount": {
            0: 500.0, 
            1: 125.0, 
            2: 1200.0
        },
        "Invoiced Quantity": {
            0: 2.0, 
            1: 3.5, 
            2: 1.0
        }
    }
    ```

   - use the `json` library to write the *response* to `task_4.json`

5. Use the `csv` library to read `task_1.csv`. Read the content using the basic `reader`. Calculate the sum of all invoice amounts (`Amount * Quantity`)
6. Use the `csv` library to read `task_1.csv`. Read the content using `DictReader`. Calculate the sum of all invoice amounts (`Amount * Quantity`)
7. Add a new column `Invoice Total` that contains the (per-row) invoice amount (`Amount * Quantity`). Write the content to `task_7.csv`
8. Use the `json` library to read `task_4.json`. Calculate the sum of all invoice amounts (`Amount * Quantity`)
9. Add a new column `Invoice Total` that contains the (per-row) invoice amount (`Amount * Quantity`). Write the content to `task_9.json`
