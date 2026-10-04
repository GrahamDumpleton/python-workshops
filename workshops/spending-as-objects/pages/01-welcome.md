---
title: Welcome
requires: [quiz:recap-method, quiz:recap-equal, quiz:recap-child, verify:notebook-created]
---

# Spending as objects

This is the last workshop of **Your own types in Python**. It teaches
nothing new. Instead, you use what you already know to build one
complete program from classes of your own.

Mariam wrote down everything that she bought from January to March
2026. Each purchase is one row of a file: the date, a description, the
amount and a category, such as `food` or `rent`. She also has a second
file, which holds her budget for each category. A **budget** is the
amount of money that a person plans to spend in one month.

In the workshop **Where the money went**, a program answered Mariam's
questions with dictionaries and separate functions. In this workshop
you build the program again, around two classes:

- A `Purchase` object is one purchase. It holds the date, the
  description, the amount and the category of that purchase.

- A `Ledger` object holds many purchases. A **ledger** is a book in
  which a person writes down every amount of money that they spend.
  The methods of your `Ledger` answer the questions: the totals, the
  largest purchase, the categories that cost more than their budget,
  and a report.

This workshop is different from most of the earlier ones. The pages do
not give you the code. Each page gives you a goal and says exactly
what the result must be. You write the code. You build the program in
seven small parts, and each part has a check, hints, and a solution
that you can open if you need it.

You will use:

- a **class**: a description of a new type of value, written by you.
  It says what data each value of that type holds and what it can do.

- an **object**: a value made from a class

- **attributes** and **methods**: an attribute is a value that belongs
  to an object, and a method is a function that belongs to a value

- the line `@dataclass`, which makes Python write some of the methods
  of a class for you

- the modules `csv` and `json`, to read the two files. A **module** is
  a file of Python code that someone has already written, and `import`
  makes it ready to use.

- a dictionary, to add up a total for each category and for each month

- `open()` and `write()`, to save the report in a file

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Your first class**. Read
this code:

```python
class Purchase:
    def __init__(self, description, amount):
        self.description = description
        self.amount = amount

    def is_large(self, limit):
        return self.amount > limit

coat = Purchase("Winter coat", 75)
print(coat.is_large(50))
```

```{quiz}
:id: recap-method
:title: A method and the name self
question: "What does this code show?"
options:
  - { text: "`75`", explanation: "That is the value of the attribute `amount`. The method `is_large` does not give back the amount. It compares the amount with `limit`, and a comparison gives `True` or `False`." }
  - { text: "`True`", correct: true }
  - { text: "An error message, because the call gives one value and the method has two parameters", explanation: "The first parameter of a method is `self`. Python gives it the object that is before the dot, which here is `coat`. The call gives a value only for the other parameter, `limit`." }
explanation: "A **class** is a description of a new type of value, and an **object** is a value made from a class. `Purchase(\"Winter coat\", 75)` makes an object. Python calls the method `__init__`, which gives the object two **attributes**: `description` and `amount`. In the call `coat.is_large(50)`, the name `self` refers to the object `coat`, and `limit` is `50`. So the method compares `75 > 50`, and gives back `True`."
```

The second question is about the workshop **Objects that explain
themselves**. Read this code:

```python
from dataclasses import dataclass

@dataclass
class Stop:
    city: str
    nights: int

first = Stop("Lagos", 2)
second = Stop("Lagos", 2)
print(first == second)
```

```{quiz}
:id: recap-equal
:title: Two objects with the same values
question: "What does this code show?"
options:
  - { text: "`True`", correct: true }
  - { text: "`False`", explanation: "That is the answer for a class that is written without `@dataclass` and without the special method `__eq__`. Then `==` asks whether the two names refer to one object. Here the class has the line `@dataclass` above it, so Python wrote `__eq__` for it." }
  - { text: "An error message, because the class has no method `__init__`", explanation: "The class has a method `__init__`, although you cannot see it. The line `@dataclass` makes Python write it, from the two lines `city: str` and `nights: int`." }
explanation: "The line `@dataclass` is a **decorator**: a line that begins with `@`, written above a class or a function, that changes it. Here it makes Python write three special methods for the class: `__init__`, which gives each object the attributes `city` and `nights`, `__repr__`, which gives the text that `print()` shows, and `__eq__`, which says when two objects are equal. The `__eq__` that Python writes compares the attributes. Both objects hold `\"Lagos\"` and `2`, so `first == second` is `True`."
```

The third question is about the workshop **Building on another
class**. Read this code:

```python
class Ticket:
    def label(self):
        return "ticket"

    def price(self):
        return 10

class NightTicket(Ticket):
    def price(self):
        return 15

ticket = NightTicket()
print(ticket.label(), ticket.price())
```

```{quiz}
:id: recap-child
:title: A class that is built on another class
question: "What does this code show?"
options:
  - { text: "`ticket 10`", explanation: "The object is made from `NightTicket`, and that class has a method `price` of its own. Python uses the method of the child class when the child class has one." }
  - { text: "An error message, because `NightTicket` has no method `label`", explanation: "The line `class NightTicket(Ticket):` says that `NightTicket` is built on `Ticket`. So an object of `NightTicket` has every method of `Ticket` too, and `label` is one of them." }
  - { text: "`ticket 15`", correct: true }
explanation: "The line `class NightTicket(Ticket):` makes `NightTicket` a **child class** of `Ticket`, which is its **parent class**. An object of the child class has the methods of the parent class, so `ticket.label()` gives `ticket`. The child class replaces the method `price` with one of its own, so `ticket.price()` gives `15`."
```

## Create your notebook

You do the work of this workshop in a notebook. Click the action below
to create the notebook and open it. You start to use it on the next
page.

```{notebook-create}
:id: create-notebook
:title: Create my notebook and open it
:path: {{ notebook }}
:open: true
- markdown: |
    # Spending as objects

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
