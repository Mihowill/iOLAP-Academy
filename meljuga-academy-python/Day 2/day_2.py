# %%
import math #tried to use it for math.floor of "12.5" to integer 12, didn't succeed :(
import json
import logging
import zipfile
import pathlib
import glob
import os

logging.basicConfig(level=logging.INFO, format='%(message)s')
logger = logging.getLogger(__name__)

#task 2
# %%
def fileFunc():
    with open('task_1.txt', 'r') as file:
        list = file.readlines()  
        list_3 = []
        for l in list:
            list_2 = l.strip()
            list_3.append(list_2)
        logger.info("Task 2: %s", list_3)

# task 3
        result = ', '.join(list_3)
        logger.info("\nTask 3: %s", result)
fileFunc()
#%%
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

string_list = ', '.join([str(x) for x in mixed_list])
logger.info("\nTask 4: %s", string_list)
# %%
def validation_func(list):
    valid_months = set(['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'])

    for i in list:
        if i.isdigit():
            num = int(i)
            if num < 1 or num > 12:
                raise ValueError(f"Invalid number: {num}. Numbers have to be in range [1, 12].")
        else:
            if i not in valid_months:
                raise ValueError(f"Invalid month: {i}.")
#validation_func(string_list)
# %%
def month_to_number(month):
    month_mapping = {
        "January": 1,
        "February": 2,
        "March": 3,
        "April": 4,
        "May": 5,
        "June": 6,
        "July": 7,
        "August": 8,
        "September": 9,
        "October": 10,
        "November": 11,
        "December": 12,
    }
    return month_mapping.get(month, month)

def number_to_month(number):
    month_mapping = {
        1: "January",
        2: "February",
        3: "March",
        4: "April",
        5: "May",
        6: "June",
        7: "July",
        8: "August",
        9: "September",
        10: "October",
        11: "November",
        12: "December",
    }
    return month_mapping.get(number, number)

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
            "12",
        ]
converted_list = [month_to_number(item) if isinstance(item, str) and not item.isdigit() else number_to_month(int(item)) for item in mixed_list]
logger.info("\nTask 5: %s", converted_list)

# %%
months_dict_list = []
for it in mixed_list:
    months_dict = {}
    if isinstance(it, str):
        if it.isdigit():
            months_dict['name'] = number_to_month(int(it))
            months_dict['number'] = int(it)
        else:
            months_dict["name"] = it
            months_dict["number"] = month_to_number(it)
    else: 
        months_dict['name'] = number_to_month(it)
        months_dict['number'] = it
    months_dict_list.append(months_dict)
logger.info("\nTask 8: %s", months_dict_list)
# %%
first_six = months_dict_list[:6]
last_four = months_dict_list[-4:]
with open('day_2.json', 'w') as file:
    json.dump(first_six, file, indent=2)

with open('day_2.json', 'r') as file:
    jsonFile = json.load(file)

jsonFile.extend(last_four)

with open('day_2.json', 'w') as file:
    json.dump(jsonFile, file, indent=2)

with open('day_2.json', 'r') as file:
    logger.info("\nTask 9: %s\nThe list's length is: %d", jsonFile, len(jsonFile))
# %%
# not working;creating infinite zipfile
directory = pathlib.Path("C:/Users/iOLAPAcademy2023/Projects/meljuga-academy-python/Day 2")
with zipfile.ZipFile("day_2.zip", mode='w', compression=zipfile.ZIP_DEFLATED) as archive:
    for file in directory.iterdir():
        archive.write(file, arcname=file.name)
# %%
logger.info("Zip size is: %s MB",os.stat(r"C:\Users\iOLAPAcademy2023\Projects\meljuga-academy-python\Day 2\day_2.zip").st_size/(1024*1024))
logger.info("Folder size is: %s MB",os.stat(r"C:\Users\iOLAPAcademy2023\Projects\meljuga-academy-python\Day 2/").st_size/(1024*1024))

logger.info("Txt file size is: %s MB",os.stat(r"C:\Users\iOLAPAcademy2023\Projects\meljuga-academy-python\Day 2\task_1.txt").st_size/(1024*1024))
with open("task_1.txt", "r", encoding="utf-8") as f:
    text = f.read()
    logger.info("UTF-8 file is: %s MB",len(text)/(1024*1024))