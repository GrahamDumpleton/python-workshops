---
title: Welcome
requires: [quiz:recap-return, quiz:recap-counting, quiz:recap-sets, verify:notebook-created]
---

# Counting words

This is the last workshop of **Python functions and data**. It teaches
almost nothing new. Instead, you use what you already know to build
one complete program.

A **fable** is a very short story that teaches a lesson. The people in
a fable are often animals. The fables of Aesop are more than two
thousand years old, and people in many countries know them.

Your program reads the text of five fables, and it answers three
questions about them:

- Which words are the most common?

- Which fable is the longest?

- Which words are in every one of the five fables?

The text of the fables comes from the book *Three Hundred Aesop's
Fables*, translated into English by George Fyler Townsend. The book is
in the public domain, which means that everyone may copy it and use
it. This workshop took the text from
[Project Gutenberg](https://www.gutenberg.org/ebooks/21), a website
that keeps books that are in the public domain.

This workshop is different from most of the earlier ones. The pages do
not give you the code. Each page gives you a goal and says exactly
what the result must be. You write the code. You build the program in
six small parts, and each part has a check, two hints, and a solution
that you can open if you need it.

You will use:

- functions that return a value. A **function** is a group of lines
  that has a name. You define it one time with `def`, and you can then
  call it many times.

- the methods `lower()`, `replace()` and `split()` of a string, to
  make clean words from a text. A **method** is a function that
  belongs to a value. You write it after the value, with a dot.

- a dictionary, to count the words

- a `for` loop over a list and over a dictionary

- sets and the operator `&`, to find the words that the fables share

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Your first function**. Read
this code:

```python
def double(number):
    print(number * 2)

result = double(4)
```

```{quiz}
:id: recap-return
:title: The value that a function gives back
question: "Which value does the name `result` refer to after this code has run?"
options:
  - { text: "`8`", explanation: "The function shows 8 with `print()`, but it does not give 8 back. A function gives a value back only with a `return` line." }
  - { text: "`None`", correct: true }
  - { text: "`4`", explanation: "4 is the argument: the value that the call gives to the function. The name `result` refers to the value that the function gives back." }
explanation: "A function gives a value back to the code that called it with a `return` line. This function has no `return` line. It only shows the number with `print()`. A function without a `return` line gives back the value `None`, so `result` refers to `None`. To give the number back, the body must be `return number * 2`."
```

The second question is about the workshop **Looking things up**. Read
this code:

```python
counts = {"fox": 2}
counts["hen"] = counts.get("hen", 0) + 1
counts["fox"] = counts.get("fox", 0) + 1
print(counts)
```

```{quiz}
:id: recap-counting
:title: Counting with a dictionary
question: "What does this code show?"
options:
  - { text: "`{'fox': 3}`", explanation: "The second line adds the key `\"hen\"` to the dictionary. An assignment to a key that does not exist yet adds that key." }
  - { text: "`{'fox': 2, 'hen': 0}`", explanation: "0 is only the value that `get` gives when the key is missing. Each line then adds 1 to the value that `get` gave." }
  - { text: "`{'fox': 3, 'hen': 1}`", correct: true }
explanation: "A dictionary holds pairs of a key and a value. `counts.get(\"hen\", 0)` gives the value for the key `\"hen\"`, or 0 when the dictionary does not have that key. The key `\"hen\"` is missing, so the second line gives it the value 0 + 1, which is 1. The key `\"fox\"` has the value 2, so the third line gives it the value 2 + 1, which is 3."
```

The third question is about the workshop **Pairs and unique things**.
Read this code:

```python
first = {"sun", "rain", "wind"}
second = {"rain", "snow", "wind"}
print(sorted(first & second))
```

```{quiz}
:id: recap-sets
:title: The values in both sets
question: "What does this code show?"
options:
  - { text: "`['rain', 'wind']`", correct: true }
  - { text: "`['rain', 'snow', 'sun', 'wind']`", explanation: "These are the values that are in one set or in the other set. The operator `|` gives them. The operator `&` gives only the values that are in both sets." }
  - { text: "`['sun']`", explanation: "`\"sun\"` is in the first set only. The operator `&` gives the values that are in both sets." }
explanation: "A set holds values with no duplicates and in no order. The operator `&` makes a new set from the values that are in both sets: here `\"rain\"` and `\"wind\"`. Because a set has no order, the code uses `sorted()`, which gives a list of the values in alphabetical order."
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
    # Counting words

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
