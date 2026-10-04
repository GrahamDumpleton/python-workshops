---
title: The data
requires: [verify:data-shown, verify:bill-ran]
---

# The data

A program that makes a report needs data. On this page you look at
Mariam's file, you read the plan of the program, and you run one cell
that reminds you how a class is written. You write no code on this
page.

## The file of purchases

Mariam's purchases are in a file named `spending.csv`. The file is
already in the folder of this workshop. Click the action below. It
shows the file under your notebook, so that you can see what your
program reads.

```{attempt}
:id: data-not-shown
:check: data-shown
:expect: The file is not open yet
```

```{layout}
:id: show-data
:title: Show the file spending.csv under the notebook
:name: data
```

```{verify}
:id: data-shown
:label: The file spending.csv is open under the notebook
:substrate: ui
:trigger: after:show-data
:message: The file is not open yet. Click the action above to show the file under the notebook.
file-open spending.csv
```

The file is a **CSV** file. A CSV file holds rows of text. Each line of
the file is one row, and commas divide a row into **fields**. The first
row is the **header**: it holds the names of the fields. Here the
fields are `date`, `description`, `amount` and `category`. Every other
row is one purchase, and the file holds 37 purchases.

This file is clean. Every row has four fields, every amount is a
number with two decimal places, and each category has one spelling.
So your program does not need to skip any row.

## The plan

You build the program in seven parts. Each part has a page of its own.

1. A class `Purchase`. One object of this class is one purchase.

2. A class `Ledger`. One object of this class holds a list of
   purchases.

3. A function that reads the file, and gives back a ledger that holds
   the 37 purchases.

4. Two methods of the ledger: the total of every purchase, and the
   total for each category.

5. Two more methods: the total for each month, and the largest
   purchase.

6. A method that finds the categories that cost more than their budget
   in one month.

7. A method that makes a report, and a few lines that write the report
   to a file.

## A class, in one cell

Before you start, here is one small class that uses every idea that
you need. It is about a bill that several people pay together. It is
not a part of Mariam's program.

A **class** is a description of a new type of value, written by you.
It says what data each value of that type holds and what it can do. An
**object** is a value made from a class. You can think of a class as an
empty form, and of each object as one form that someone has filled in.

Click the action below. It adds a cell that defines a class named
`Bill`, makes one object from it, and runs the cell.

```{attempt}
:id: bill-not-run
:check: bill-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-bill
:title: Add a cell that defines the class Bill, and run it
:path: {{ notebook }}
:tags: [bill]
:run: true
from dataclasses import dataclass
from decimal import Decimal

@dataclass
class Bill:
    name: str
    amount: Decimal

    def share(self, people):
        return self.amount / people

sample_bill = Bill("Electricity", Decimal("84.60"))
print(sample_bill)
print(sample_bill.amount)
print(sample_bill.share(3))
```

The output is:

```
Bill(name='Electricity', amount=Decimal('84.60'))
84.60
28.20
```

```{verify}
:id: bill-ran
:label: The class Bill exists, and the cell made one object from it
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed bill
if isinstance(globals().get("Bill"), type) and isinstance(globals().get("sample_bill"), Bill) and getattr(sample_bill, "name", None) == "Electricity":
    print("The cell ran. The class Bill exists, and the name sample_bill refers to one object of that class.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("Bill"), type) and isinstance(globals().get("sample_bill"), Bill) and getattr(sample_bill, "name", None) == "Electricity"
```

## What the cell does

Read the cell line by line. Every idea in it comes from an earlier
workshop.

- The first two lines use `import`. They take the name `dataclass`
  from the module `dataclasses`, and the name `Decimal` from the module
  `decimal`. These two lines run one time, and both names are then
  ready in every later cell of your notebook.

- `class Bill:` starts the class. The name of a class begins with a
  capital letter.

- The line `@dataclass` above the class is a **decorator**: a line that
  begins with `@`, written above a class or a function, that changes
  it. Here it makes Python write three **special methods** for you. A
  special method has two underscores on each side of its name, and
  Python itself calls it. The method `__init__` runs when an object is
  made, and gives the object its attributes. The method `__repr__`
  gives the text that `print()` shows for an object. The method
  `__eq__` says when two objects are equal. A class that has this line
  above it is named a **dataclass**.

- `name: str` and `amount: Decimal` say which attributes each object
  has, and in which order you give them. An **attribute** is a value
  that belongs to an object. The word after the colon is a **type
  hint**: it says what type the value should be. Python does not check
  it.

- `def share(self, people):` starts a **method**: a function that
  belongs to a value. It is written inside the class, four spaces to
  the right. Its first parameter is `self`, which is the name, inside
  a method, for the object that the method was called on. So
  `self.amount` is the amount of that object.

- `Bill("Electricity", Decimal("84.60"))` makes an object. The two
  values go to the attributes `name` and `amount`, in that order.

- `sample_bill.amount` reads an attribute: a dot and the name, with no
  parentheses. `sample_bill.share(3)` calls a method: a dot, the name,
  and parentheses. You give no value for `self`. Python gives `self`
  the object that is before the dot.

## Amounts are `Decimal` values

In this workshop, every amount is a `Decimal` value, and not a float.
A float cannot hold every decimal number exactly: `0.1 + 0.2` gives
`0.30000000000000004`. That is a problem for money. A `Decimal` value
holds a decimal number exactly, as a person writes it. You make one
from a string: `Decimal("84.60")`.

You can add `Decimal` values with `+` and compare them with `>`, in
the same way as other numbers. A `Decimal` value and an integer can be
used together, so a total that starts at `0` works, and so does
`amount > 180`. In an f-string, `{amount:.2f}` shows a `Decimal` value
with two decimal places.

On the next page you write the first class of the program yourself.
