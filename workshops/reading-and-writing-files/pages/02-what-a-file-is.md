---
title: What a file is
requires: [verify:data-shown, quiz:coat-amount]
---

# What a file is

A **file** is a place where a computer keeps data under a name. The
data stays in the file when the program ends, and also when the
computer has no power. A photograph is a file. A song is a file. A
letter that you wrote last year is a file.

## Why a program needs files

Until now, every value in your programs was held by a name in the
notebook, such as `total` or `prices`. Those values exist only while
the program runs. When the notebook is closed, Python forgets all of
them.

That is a problem for real data. Mariam records each purchase that
she makes. She has done this for three months. She cannot type every
purchase into a cell again each time she wants to know a total. The
purchases must be kept in a place that lasts longer than the program.
That place is a file.

A program uses a file in two ways:

- It **reads** the file: it takes the data from the file, so that the
  code can use it.

- It **writes** the file: it puts data into the file, so that the data
  is kept.

## An everyday comparison

Think of the difference between what you remember and what you write
on paper. A telephone number that you only remember is gone when you
forget it. A telephone number that you write in a paper notebook is
still there next week, and another person can read it too. The names
in a program are like what you remember. A file is like the paper
notebook.

## Look at the file

This workshop includes a file that has the name `spending.csv`. It
holds the purchases of Mariam. Before any code reads the file, look at
it yourself.

Click the action below. Until now, your notebook filled all of the
space at the left of these instructions. The action divides that space
into two parts. Your notebook stays in the top part. A new part
appears under the notebook, and it shows the text of the file
`spending.csv`. This part is an editor: a tool that shows the text of
a file. You can scroll in it to see the whole file.

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

Do not type in the editor. In this workshop, only your code changes
files.

## What the file holds

The file holds text, and nothing else. It has 38 lines.

The first line is different from the others:

```
date,description,amount,category
```

It holds no purchase. It gives a name to each part of the lines that
follow.

Each of the other 37 lines is one purchase. For example:

```
2026-01-03,Bread and milk,6.40,food
```

The line has four parts, and a comma separates each part from the
next:

- the date of the purchase, `2026-01-03`

- a description, `Bread and milk`

- the amount that Mariam paid, `6.40`

- the category of the purchase, `food`

The name of the file ends with `.csv`. The workshop **CSV and JSON**
explains this kind of file. For now, you need to know only that it is
a file of text.

Find the line for the winter coat in the editor, and answer the
question.

```{quiz}
:id: coat-amount
:type: text
:title: Read the file yourself
question: "Which amount did Mariam pay for the winter coat? Type the amount exactly as the file shows it."
answer: "74.90"
wrong:
  - { text: "74.9", explanation: "The number is right, but the file shows two digits after the point. Type the amount exactly as the file shows it." }
  - { text: "74,90", explanation: "The file writes the amount with a point, and not with a comma. In this file a comma separates the parts of a line." }
  - { text: "2026-01-17", explanation: "That is the date of the purchase. The amount is the third part of the line." }
  - { text: "clothes", explanation: "That is the category of the purchase. The amount is the third part of the line." }
otherwise: "Look for the line that holds the description `Winter coat`. It is line 10 of the file. The amount is the third part of the line, after the second comma."
explanation: "The line is `2026-01-17,Winter coat,74.90,clothes`. The third part is the amount, `74.90`. You found it by reading the file. On the next pages, your code reads the file."
```
