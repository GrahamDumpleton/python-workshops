---
title: Welcome
requires: [quiz:recap-in-list, quiz:recap-return, quiz:recap-lookup, verify:notebook-created]
---

# Pairs and unique things

You already know two kinds of value that hold several values: the list
and the dictionary. In this workshop you learn two more. The first
keeps a few values together as one value. The second keeps each value
only once.

You will learn:

- how to keep values that belong together in a tuple

- how to give each value of a tuple a name of its own

- how to write a function that returns more than one value

- how to remove the repeated values of a list with a set

- how to find the values that two sets share

The workshop takes about twenty-five minutes. You write most of the
code yourself.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Keeping a list**.

```{quiz}
:id: recap-in-list
:title: A question about a list
question: 'The name `fruits` refers to the list `["apple", "mango", "pear"]`. What is the value of the expression `"mango" in fruits`?'
options:
  - { text: "`1`, because `\"mango\"` is at index 1", explanation: "The operator `in` does not give the index. It answers a question with yes or no, so its value is `True` or `False`." }
  - { text: "`\"mango\"`", explanation: "The operator `in` does not give the item back. It answers a question with yes or no, so its value is `True` or `False`." }
  - { text: "`True`", correct: true }
explanation: "A list holds several values in order, and each value is called an item. The operator `in` asks whether a value is one of the items. The answer is `True` or `False`. You use `in` again in this workshop."
```

The second question is about the workshop **Your first function**.

```{quiz}
:id: recap-return
:title: What return does
question: "A function is a piece of code with a name, which runs when you call it. What does the word `return` do inside a function?"
options:
  - { text: "It gives a value back to the code that called the function", correct: true }
  - { text: "It shows a value under the cell", explanation: "`print()` shows a value under the cell. `return` gives the value back to the code that called the function, so that the code can give it a name or use it." }
  - { text: "It starts the function again from its first line", explanation: "`return` ends the function. It gives a value back to the code that called the function." }
explanation: "`return` ends the function and gives a value back to the code that called it. That value is the return value. The code can give it a name, for example `area = rectangle_area(3, 4)`."
```

The third question is about the workshop **Looking things up**.

```{quiz}
:id: recap-lookup
:title: A value in a dictionary
question: 'The name `prices` refers to the dictionary `{"tea": 3, "coffee": 4}`. What is the value of `prices["coffee"]`?'
options:
  - { text: "`3`", explanation: "`3` is the value that belongs to the key `\"tea\"`. The value that belongs to the key `\"coffee\"` is `4`." }
  - { text: "`4`", correct: true }
  - { text: "`\"coffee\"`", explanation: "`\"coffee\"` is the key. The lookup gives the value that belongs to the key, which is `4`." }
explanation: "A dictionary holds pairs. Each pair has a key and a value. The key between the square brackets tells Python which value you want, so `prices[\"coffee\"]` is `4`. A dictionary is written between braces, `{` and `}`. You see braces again in this workshop."
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
    # Pairs and unique things

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
