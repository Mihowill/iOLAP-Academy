import csv
import datetime as dt
import pandas as pd
import requests
import json
# %%
header = ["Date", "Invoice Number", "Customer", "Invoiced Amount", "Invoiced Quantity"]
content = [
     [dt.date(2020, 1, 1), 73984, "John Wayne", 500.0, 2.0],
     [dt.date(2020, 1, 12), 51341, "Michael Johnson", 125.0, 3.5],
     [dt.date(2020, 1, 31), 43210, "Stuart Smith", 1200.0, 1.0],
]

list_of_dicts = []
for sublist in content:
    dict_item = {header[i]: sublist[i] for i in range(len(header))}
    list_of_dicts.append(dict_item)

with open('task_1.csv', 'w') as f:
    writer = csv.DictWriter(f, fieldnames=header, dialect='unix')
    writer.writeheader()
    for row in list_of_dicts:
        writer.writerow(row)
# %%
with open('task_1.csv', newline='') as f:
    reader = csv.reader(f)
    print("Task 2.1:")
    i = 0
    for row in reader:
        if i < 4:
            print(row)
            i += 1
        else:
            break
# %%
print("Task 2.2: ",pd.read_csv('task_1.csv', nrows=3))

toJson = pd.DataFrame.to_json(pd.read_csv('task_1.csv'), indent=2)
print("Task 2.3: ", toJson)
# %%
r = requests.get('https://ogj9fvz5cf.execute-api.eu-central-1.amazonaws.com/v1/python/day/3?task_no=3')

data = r.json()

with open('task_3.json', 'w') as f:
    json.dump(data, f, indent=2)
# %%
r2 = requests.get('https://ogj9fvz5cf.execute-api.eu-central-1.amazonaws.com/v1/python/day/3?task_no=4')

data2 = r2.json()

with open('task_4.json', 'w') as f:
    json.dump(data2, f, indent=2)
# %%
with open('task_1.csv', newline='') as f:
    csvReader = csv.reader(f, dialect='unix')
    sum = 0.0
    is_header = True
    for row in csvReader:
        if is_header:
            is_header = False
            continue
        amount = float(row[3])
        quantity = float(row[4])
        total = amount*quantity
        sum += total
   
    print("Task 5:",sum)
# %%
with open('task_1.csv', newline='') as f:
    csvReader = csv.DictReader(f, dialect='unix')
    sum = 0.0
    is_header = True
    for row in csvReader:
        amount = float(row['Invoiced Amount'])
        quantity = float(row['Invoiced Quantity'])
        total = amount * quantity
        sum += total

    print("Task 6:", sum)
# %%
with open('task_1.csv', newline='') as f, open('task_7.csv', 'w', newline='') as o:
    csvReader = csv.DictReader(f, dialect='unix')
    header = csvReader.fieldnames + ['Total Amount']
    csvWriter = csv.DictWriter(o, fieldnames=header, dialect='unix')
    csvWriter.writeheader()

    for row in csvReader:
        amount = float(row['Invoiced Amount'])
        quantity = float(row['Invoiced Quantity'])
        total = amount * quantity
        row['Total Amount'] = total
        csvWriter.writerow(row)
# %%
with open('task_4.json', 'r') as f:
    task_4 = json.load(f)
    total_sum = 0.0

    for key in task_4["Date"]:
        invoiced_amount = float(task_4["Invoiced Amount"][key])
        invoiced_quantity = float(task_4["Invoiced Quantity"][key])
        result = invoiced_amount * invoiced_quantity
        sum += result

    print("Task 8:",sum)
# %%
with open('task_4.json', 'r') as f, open('task_9.json', 'w') as o:
    task_4 = json.load(f)
    total_sum = 0.0
    invoice_total = {}
    for key in task_4["Date"]:
        invoiced_amount = float(task_4["Invoiced Amount"][key])
        invoiced_quantity = float(task_4["Invoiced Quantity"][key])
        result = invoiced_amount * invoiced_quantity
        invoice_total[key] = result
    task_4["Invoice Total"] = invoice_total
    json.dump(task_4, o, indent=2)