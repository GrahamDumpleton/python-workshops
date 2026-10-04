---
title: Welcome
requires: [quiz:recap-strings, quiz:recap-except, quiz:recap-spellings, verify:notebook-created]
---

# Where the money went

This is the last workshop of **Working with real data in Python**. It
teaches almost nothing new. Instead, you use what you already know to
build one complete program.

Mariam wrote down everything that she bought from January to March
2026. She typed each purchase into a file: the date, a description, the
amount and a category, such as `food` or `rent`. She typed quickly, so
the file is untidy. She also has a second file, which holds her budget
for each category. A **budget** is the amount of money that a person
plans to spend in one month.

Mariam wants to know where her money went. Your program reads her two
files, and it writes a report that answers four questions:

- How much did she spend in each category?

- How much did she spend in each month?

- Which purchase was the largest?

- In each month, in which categories did she spend more than her
  budget?

This workshop is different from most of the earlier ones. The pages do
not give you the code. Each page gives you a goal and says exactly
what the result must be. You write the code. You build the program in
six small parts, and each part has a check, hints, and a solution that
you can open if you need it.

You will use:

- functions that return a value. A **function** is a group of lines
  that has a name. You define it one time with `def`, and you can then
  call it many times.

- the module `csv`, to read the rows of a file, and the module `json`,
  to read the budgets. A **module** is a file of Python code that
  someone has already written, and `import` makes it ready to use.

- `try` and `except`, to skip the rows of the file that cannot be read

- a dictionary, to add up a total for each category and for each month

- a `for` loop with an `if`, to find the largest purchase

- `open()` and `write()`, to save the report in a file

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Reading and writing
files**. A program read two amounts from a file, and gave them the
names `first` and `second`. Read this code:

```python
first = "6.40"
second = "2.80"
print(first + second)
```

```{quiz}
:id: recap-strings
:title: Values that come from a file
question: "What does this code show?"
options:
  - { text: "`9.20`", explanation: "That is the sum of the two numbers. But these two values are strings, because they are written inside quotes. The operator `+` joins two strings." }
  - { text: "`6.402.80`", correct: true }
  - { text: "An error message", explanation: "The operator `+` works with two strings. It joins them into one longer string, so there is no error." }
explanation: "Everything that a program reads from a file is a string, also when it looks like a number. The operator `+` joins two strings, so the result is the string `6.402.80`. To add the amounts, the program must first turn each string into a number, for example with `float(first)`."
```

The second question is about the workshop **When the data is wrong**.
Read this code:

```python
try:
    amount = float("unknown")
    print("a number")
except ValueError:
    print("not a number")
```

```{quiz}
:id: recap-except
:title: An error that the program handles
question: "What does this code show?"
options:
  - { text: "`a number`", explanation: "`float(\"unknown\")` cannot make a number, so it raises a `ValueError`. Python then leaves the block under `try` at once, and the line with `print(\"a number\")` never runs." }
  - { text: "A red error message, and the program stops", explanation: "That happens when the code has no `try`. Here the line is inside a `try` block, and the `except` line names the type of the error, so the program handles the error and continues." }
  - { text: "`not a number`", correct: true }
explanation: "An **exception** is what Python calls an error that stops a program while it runs. Python tries the lines of the block under `try`. `float(\"unknown\")` raises an exception of the type `ValueError`, because the text is not a number. Python leaves the `try` block and runs the block under `except ValueError:`, so the code shows `not a number`. The program does not stop."
```

The third question is about the workshop **Cleaning messy text**. Read
this code:

```python
other_spellings = {"groceries": "food"}
word = " Groceries ".strip().lower()
print(other_spellings.get(word, word))
```

```{quiz}
:id: recap-spellings
:title: One spelling for each category
question: "What does this code show?"
options:
  - { text: "`food`", correct: true }
  - { text: "`groceries`", explanation: "That is the value of `word` after `strip()` and `lower()`. The last line then looks for that word in the dictionary, and the dictionary has the key `\"groceries\"`, so `get` gives its value." }
  - { text: "`Groceries`", explanation: "`strip()` removes the spaces, and `lower()` then makes every letter small, so the word is `groceries`. The last line then looks for that word in the dictionary." }
explanation: "The method `strip()` gives a copy of a string without the spaces at its start and its end. The method `lower()` gives a copy with every letter small. So `word` is `\"groceries\"`. `other_spellings.get(word, word)` looks for the key `word` in the dictionary. When the key exists, `get` gives its value, which here is `\"food\"`. When the key does not exist, `get` gives the second argument, which is the word itself."
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
    # Where the money went

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
