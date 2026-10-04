---
title: Welcome
requires: [quiz:recap-index, quiz:recap-error, quiz:recap-equal, verify:notebook-created]
---

# Keeping a list

Until now, each name in your programs referred to one value: one
number, or one string. Real programs often work with many values of
the same kind: the prices of everything in a shop, or the names of
all the guests at a dinner. In this workshop you learn how to keep
many values together under one name, in a list.

You will learn:

- how to create a list of values

- how to get one item from a list, counting from the start or from
  the end

- how to get a part of a list

- how to change an item, and how to add an item

- how to count the items, and how to ask whether a value is in a list

- how to put a list in order

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Working with text**.

```{quiz}
:id: recap-index
:title: One character of a string
question: "The name `word` refers to the string `\"cat\"`. What is the value of `word[0]`?"
options:
  - { text: "`\"c\"`, the first character", correct: true }
  - { text: "`\"a\"`, the second character", explanation: "Python counts the positions from 0, not from 1. Position 0 is the first character, which is `\"c\"`." }
  - { text: "Nothing, because no character has the position 0", explanation: "Python counts the positions from 0. Position 0 is the first character, which is `\"c\"`." }
explanation: "A number in square brackets after a string gets one character. The number is called an index, and Python counts from 0. So `word[0]` is the first character, `\"c\"`. In this workshop you use an index in the same way with a list."
```

The second question is about the workshop **When things go wrong**.

```{quiz}
:id: recap-error
:title: Reading an error message
question: Python stops and shows a long error message under a cell. Which line of the message do you read first?
options:
  - { text: "The first line, because it is at the top", explanation: "The top of the message shows where Python was in the code. The last line is the most useful line, so read it first." }
  - { text: "The last line, because it names the type of the error and says what went wrong", correct: true }
  - { text: "Any line, because all the lines say the same thing", explanation: "The lines say different things. The last line names the type of the error and says what went wrong, so read it first." }
explanation: "Read an error message from the last line. That line names the type of the error, for example `NameError` or `IndexError`, and says what went wrong."
```

The third question is about the workshop **Making decisions**.

```{quiz}
:id: recap-equal
:title: Asking whether two values are equal
question: Which line asks Python whether the value of `age` is equal to 18?
options:
  - { text: "`age = 18`", explanation: "One symbol `=` is an assignment. It makes the name `age` refer to 18. It does not ask a question." }
  - { text: "`age == 18`", correct: true }
  - { text: "`age equals 18`", explanation: "Python has no word `equals`. The comparison uses two symbols: `age == 18`." }
explanation: "Two symbols, `==`, compare two values. The result is a boolean: `True` when the values are equal, and `False` when they are different. One symbol, `=`, is an assignment."
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
    # Keeping a list

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
