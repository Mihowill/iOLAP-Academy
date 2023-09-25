# Python - Day 2

Open VS Code in `C:\Users\<YourUser>\Projects\<user>-academy-python\`.

## Task submissions

Create a new folder named `Day 2`. Create a Python script named `day_2.py` and print solutions to all tasks using this script. The outputs should be formatted as: `print("Task <n>: ", output)`. If task output is a file, it should be formatted as `task_<n>.<extension>`.

**Note**: Separate your tasks with a special VSC line: `# %%` and run `Shift + Enter` <strong style="color: #ba372a">*</strong> to run the tasks individually.

<strong style="color: #ba372a">*</strong> [*Day 1 / Installation*](Day1.md#Installation) > *"Jupyter: Send Selection To Interactive Window"*


## Tasks - Data Structures

1. Create a new txt file (`task_1.txt`) with the following content:

    ```
        January
        February
        March
        April
        May
        June
        July
        August
        September
        October
        November
        December
    ```

2. [Read the file](https://stackoverflow.com/questions/34429519/python-difference-between-open-and-with-open) content into a Python list. The result should output:

    ```python
        [
            "January",
            "February",
            "March",
            "April",
            "May",
            "June",
            "July",
            "August",
            "September",
            "October",
            "November",
            "December",
        ]
    ```

3. Concatenate the created list items into a new string variable. Use a comma (,) to delimit the values. The result should output: 

    ```
        January, February, March, April, May, June, July, August, September, October, November, December
    ```

4. Modify code from the previous step and wrap it in [a function](https://www.w3schools.com/python/python_functions.asp). Call the created function and print the outputs.

5. Define the following *list of various data types* input in your task block (`# %%`). Concatenate the list items and delimit them by a comma (`,`). 
    ```python
        mixed_list = [
            1,
            "February",
            "March",
            4.0,
            "May",
            "June",
            "July",
            "8",
            "September",
            "October",
            "November",
            "12.5",
        ]
    ```
    The result should output:  1, February, March, 4.0, May, June, July, 8, September, October, November, 12.5

    **Hint**: make sure data types support concatenation

6. Add a validation function that raises an Exception if not:
    - All numeric items are in the range `[1, 12]` (note: 9.5 and 12.5 are not in the range [1, 12] while 9 and 12 are in range)
    - All alphabetic items are one of `[January, February, March, April, May, June, July, August, September, October, November, December]`
    - Your validation raises a `ValueError` if an invalid value is found

    **Note**: your program may break when your validation is raised - that is the desired outcome. Please comment the validation function call as we will be catching it later

7. Create two "switch-like" structures (function or other implementations) that return:
    1. The month name for a given number (e.g. `input: 1; output January`)
    2. The number for a given month name (e.g. `input: January; output 1`)

8. Implement the "switch-like" structure to create a new list of dictionaries. Iterate over the `mixed_list` variable - if the element is numeric, use the 1st switch structure, otherwise use the 2nd switch statement and generate:

    ```python
        months_dict_list = [
            {
                "name": "January",
                "number": 1
            },
            ...
            {
                "name": "December",
                "number": 12
            }
        ]
    ```

    **Note**: if you catch the `ValueError` that you introduced earlier, fix it by **manually** updating the `mixed_list` variable definition in the previous task so that it contains valid values for each of the 12 months (e.g. change 12.5 to 12, ...).

9. JSON I/O:
    -  Write the first six month names from `months_dict_list` [to a JSON file](https://www.geeksforgeeks.org/python-difference-between-json-dump-and-json-dumps/) (`day_2.json`)
    -  Append the last four month names from `months_dict_list` [to the same JSON file](https://www.geeksforgeeks.org/python-difference-between-json-load-and-json-loads/) (`day_2.json`)
    - Read the created JSON file and:
      - print the list
      - print the list's length

10. Define a logger at the top of your script, point it to `stdout`, and replace all `print` calls with `logger.info` calls.

## Extra tasks

1. Zip the contents of your `Day 2` directory using [zipfile](https://docs.python.org/3/library/zipfile.html)
   - print memory size of `day_2.zip` file in MB
   - print memory size of `Day 2/` folder in MB
2. Read the contents of your `task_1.txt` file into a string. Encode the string to bytes (`utf-8`) and write the encoded content to `task_1` (no file extension)
   - print memory size of `task_1.txt` in KB
   - print memory size of `task_1` in KB
