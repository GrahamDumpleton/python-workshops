---
title: What JSON is
requires: [quiz:which-format-table, quiz:which-format-settings]
---

# What JSON is

A CSV file is a good format for a table: many rows, and the same
fields in every row. Some data is not a table. The budgets of Mariam
are one example. They are a dictionary: each category has one number.
Other data has a list inside a dictionary, or a dictionary inside a
list. A table of rows cannot hold data of that form well.

**JSON** is a format for such data. A JSON file is text that looks
very much like Python dictionaries and lists. You say the name like
the name "Jason". The letters mean "JavaScript Object Notation",
because the format comes from another programming language, which
has the name JavaScript. Today almost every programming language can
read and write JSON, and programs on the internet use it to send
data to each other.

JSON has a second advantage over CSV. In a CSV file, every value is
text. JSON keeps the type of each value. A number in a JSON file is a
number when the program reads it, and a string is a string.

Think of the difference between a table and a form with sections. A
table is good for many things of the same kind. A form can have a
section inside a section, and each box holds its own kind of value.

## Look at a JSON file

Mariam keeps her budget for one month, for each category, in the file
`budgets.json`. Click the action below. It shows the file under your
notebook.

```{file-open}
:id: open-budgets
:title: Show the file budgets.json
:path: budgets.json
:area: data
```

The file holds this text:

```json
{
  "rent": 650,
  "food": 180,
  "transport": 60,
  "phone": 20,
  "clothes": 50,
  "hobbies": 30
}
```

You can read it as you read a Python dictionary. It has curly
brackets around it. It has six pairs, with a comma between them. In
each pair, a colon separates the key from the value. Each key is a
string, in double quotes. Each value is a number, with no quotes.

## How JSON is different from Python

JSON is a little more strict than Python, and three words are
different:

| In Python | In JSON |
|-----------|---------|
| a string in single quotes or in double quotes: `'food'` or `"food"` | a string always in double quotes: `"food"` |
| `True` and `False` | `true` and `false`, with a small first letter |
| `None` | `null` |

You do not need to remember these differences to use JSON from
Python. The code on the next pages changes each value to the right
form for you.

Here is a second example of JSON, which no file in this workshop
holds. It shows a list inside a dictionary, and values of four types:
a string, a list, a number and a boolean.

```json
{
  "name": "Mariam",
  "months": ["2026-01", "2026-02", "2026-03"],
  "purchases": 37,
  "budget_used": true
}
```

## Which format to use

- Use CSV for a table: many rows that all have the same fields, such
  as a list of purchases. A person can also open a CSV file in a
  spreadsheet program.

- Use JSON for data that has another form, such as a dictionary of
  settings, or a list that holds dictionaries and other lists. Use it
  also when the types of the values must stay as they are.

```{quiz}
:id: which-format-table
:title: A table of readings
question: "Tomás measures the temperature outside his home every day for a year. For each day he has a date and a temperature. He wants to open the data in a spreadsheet program. Which format fits this data best?"
options:
  - { text: "JSON", explanation: "JSON can hold this data, but the data is a table: one row for each day, and the same two fields in every row. CSV is made for tables, and a spreadsheet program can open it." }
  - { text: "CSV", correct: true }
explanation: "The data is a table. Each day is one row, and every row has the same two fields. CSV is the format for a table, and a spreadsheet program can open a CSV file."
```

```{quiz}
:id: which-format-settings
:title: The settings of a program
question: "A program keeps its settings in a file: the name of the user, a list of the categories that the user chose, and a number for the size of the text. Which format fits this data best?"
options:
  - { text: "JSON", correct: true }
  - { text: "CSV", explanation: "The settings are not a table. There is only one of each setting, one of the values is a list, and one is a number. CSV has rows of the same fields, and every value in it is text." }
explanation: "The settings are a dictionary whose values have different types: a string, a list and a number. JSON holds a dictionary, keeps a list inside it, and keeps the number as a number."
```
