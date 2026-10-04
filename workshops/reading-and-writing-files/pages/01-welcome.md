---
title: Welcome
requires: [quiz:recap-total, quiz:recap-get, quiz:recap-split, verify:notebook-created]
---

# Reading and writing files

This is the first workshop of **Working with real data in Python**.
In the earlier workshops, all the data of a program was written in a
cell of the notebook. Real data is almost never in the code. It is in
files. In this workshop you learn how a program reads its data from a
file, and how it saves its results in a file.

These workshops follow the spending of one person, Mariam, from
January to March 2026. Each purchase is one line of a file. In this
workshop your code reads that file and adds up everything that Mariam
spent.

You will learn:

- what a file is, and why a program needs files

- how to open a file and read all of its text

- how to read a file one line at a time

- how to turn the text of a file into numbers

- how to write a new file, and how to add lines to a file

- how to test whether a file exists

In these workshops you write most of the code yourself. Each page
shows a new idea with one cell, and then you write a cell of your own.
Every task has hints, and a solution that you can open if you need it.

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Doing it again**. Read this
code:

```python
total = 0
for price in [2, 3, 5]:
    total = total + price
print(total)
```

```{quiz}
:id: recap-total
:title: Adding up a total in a loop
question: "What does this code show?"
options:
  - { text: "`5`", explanation: "`5` is the last item of the list. The line inside the loop does not replace the total with the item. It adds the item to the total." }
  - { text: "`10`", correct: true }
  - { text: "`0`", explanation: "`0` is the value of `total` before the loop starts. The loop then adds each item of the list to it." }
explanation: "A `for` loop repeats its block one time for each item of the list. The total starts at 0. The loop adds 2, then 3, then 5, so the total is 10. You use this pattern again in this workshop, to add up the amounts in a file."
```

The second question is about the workshop **Looking things up**. Read
this code:

```python
prices = {"tea": 2, "soup": 4}
print(prices.get("cake", 0))
```

```{quiz}
:id: recap-get
:title: A key that does not exist
question: "What does this code show?"
options:
  - { text: "`0`", correct: true }
  - { text: "`None`", explanation: "`get()` gives `None` for a missing key only when the call has one argument. This call has a second argument, and `get()` gives that value." }
  - { text: "An error message", explanation: "A lookup with square brackets, `prices[\"cake\"]`, stops with a `KeyError`. The method `get()` never stops with an error." }
explanation: "A dictionary holds pairs of a key and a value. The method `get()` gives the value of a key. When the dictionary does not have the key, `get()` gives its second argument. The dictionary has no key `\"cake\"`, so the code shows 0."
```

The third question is about the workshop **Working with text**. Read
this code:

```python
print("rice,2.50,food".split(","))
```

```{quiz}
:id: recap-split
:title: Dividing a string
question: "What does this code show?"
options:
  - { text: "`['rice,2.50,food']`", explanation: "This is a list of one string, which still holds the commas. `split(\",\")` divides the string at each comma, so the list has three items." }
  - { text: "`['rice', 2.5, 'food']`", explanation: "`split()` gives a list of strings. It never makes a number. The second item is the string `'2.50'`." }
  - { text: "`['rice', '2.50', 'food']`", correct: true }
explanation: "A method is a function that belongs to a value. You write it after the value, with a dot. The method `split(\",\")` divides a string at each comma, and gives a list of the parts. Every part is a string, also the part that looks like a number. You use `split(\",\")` in this workshop on the lines of a file."
```

## Create your notebook

You do the work of this workshop in a notebook. Click the action below
to create the notebook and open it. You start to use it on the page
after the next one.

```{notebook-create}
:id: create-notebook
:title: Create my notebook and open it
:path: {{ notebook }}
:open: true
- markdown: |
    # Reading and writing files

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
