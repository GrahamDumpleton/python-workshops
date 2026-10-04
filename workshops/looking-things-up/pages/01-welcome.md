---
title: Welcome
requires: [quiz:recap-in-list, quiz:recap-count, quiz:recap-return, verify:notebook-created]
---

# Looking things up

A list keeps values in order, and you find a value by its position.
Often you do not know the position. You know a name: the name of a
person, the name of a product, or the name of a city. In this workshop
you learn how to keep values so that a program finds each value by a
name like that.

You will learn:

- how to make a dictionary, which keeps each value together with a key

- how to find a value with its key

- what Python does when a key does not exist, and how to avoid the
  error

- how to add a value and how to change a value

- how to test whether a key exists

- how to count things with a dictionary

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Keeping a list**.

```{quiz}
:id: recap-in-list
:title: Testing for an item
question: 'The name `fruit` refers to the list `["apple", "pear", "plum"]`. What is the value of `"pear" in fruit`?'
options:
  - { text: "`1`", explanation: "`1` is the index of `\"pear\"` in the list. The word `in` does not give an index. It gives `True` or `False`." }
  - { text: '`"pear"`', explanation: "The word `in` does not give the item. It tests whether the item is in the list, and gives `True` or `False`." }
  - { text: "`True`", correct: true }
explanation: "The word `in` tests whether a value is one of the items of a list. The result is `True` when it is, and `False` when it is not. You use `in` again in this workshop."
```

The second question is about the workshop **Doing it again**.

```{quiz}
:id: recap-count
:title: Counting in a loop
question: "A loop counts the items of a list that pass a test. The count has the name `count`. Which line adds one to the count?"
options:
  - { text: "`count = count + 1`", correct: true }
  - { text: "`count + 1`", explanation: "This line calculates a result, but it does not give the result a name. The name `count` still refers to the old value." }
  - { text: "`count = 1`", explanation: "This line makes `count` refer to `1` every time. It does not use the old value, so the count never becomes larger than `1`." }
explanation: "Python calculates the right side first, with the old value of `count`. Then it makes the name `count` refer to the result. So each time the line runs, the count becomes larger by one."
```

The third question is about the workshop **Your first function**.

```{quiz}
:id: recap-return
:title: Giving a result back
question: "A function calculates a result. The code that calls the function needs the result, to use it in another calculation. Which word in the function gives the result back?"
options:
  - { text: "`print`", explanation: "`print()` shows a value on the screen for a person to read. It does not give the value back to the code that called the function." }
  - { text: "`def`", explanation: "The word `def` begins the definition of a function. It does not give a result back." }
  - { text: "`return`", correct: true }
explanation: "A function is a group of lines that has a name. The line that begins with `def` defines it, and the line that begins with `return` gives a value back to the code that called the function. That value is the return value. `print()` only shows a value on the screen."
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
    # Looking things up

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
