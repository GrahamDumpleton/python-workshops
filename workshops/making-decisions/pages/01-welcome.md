---
title: Welcome
requires: [quiz:recap-new-value, quiz:recap-index, quiz:recap-error, verify:notebook-created]
---

# Making decisions

Every program that you have written until now performs the same lines
each time it runs. In this workshop you learn how to make a program
choose: it performs some lines only when something is true.

You will learn:

- how to compare two values, and what the values `True` and `False`
  are

- how to make Python perform some lines only when a comparison is true,
  with `if`

- how to say what Python does in the other cases, with `else` and
  `elif`

- why the spaces at the start of a line matter

- how to combine two comparisons with `and`, `or` and `not`

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Naming things**.

```{quiz}
:id: recap-new-value
:title: A new value for a name
question: "A cell holds the line `steps = 4000` and then the line `steps = steps + 500`. Which value does the name `steps` refer to after the cell has run?"
options:
  - { text: "`4000`", explanation: "`4000` is the first value. The second line gives the name a new value." }
  - { text: "`4500`", correct: true }
  - { text: "`500`", explanation: "The right side is `steps + 500`, not only `500`. Python uses the old value of `steps` in the calculation." }
explanation: "The symbol `=` is an instruction called an assignment. Python calculates the right side first, with the old value 4000, and then makes the name `steps` refer to the result, 4500."
```

The second question is about the workshop **Working with text**.

```{quiz}
:id: recap-index
:title: Counting the characters of a string
question: "A string is a piece of text in quotes, such as `\"Python\"`. Each character of a string has a position, called its index. Which character of `\"Python\"` is at index `0`?"
options:
  - { text: "`P`", correct: true }
  - { text: "`y`", explanation: "`y` is the second character, but Python starts to count at 0, so `y` is at index 1." }
  - { text: "No character, because counting starts at 1", explanation: "Python starts to count at 0, so the first character is at index 0." }
explanation: "Python starts to count at 0. The first character, `P`, is at index 0, and `y` is at index 1."
```

The third question is about the workshop **When things go wrong**.

```{quiz}
:id: recap-error
:title: Reading an error message
question: When Python cannot continue, it stops and shows an error message of several lines. Which line do you read first?
options:
  - { text: "The first line", explanation: "The first lines say where Python was. The last line says what went wrong, so read the last line first." }
  - { text: "The line in the middle that has an arrow", explanation: "The arrow shows where Python stopped. That is useful, but first read the last line, which says what went wrong." }
  - { text: "The last line", correct: true }
explanation: "The last line of an error message gives the type of the error, such as `NameError` or `SyntaxError`, and then says what went wrong. Read it first."
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
    # Making decisions

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
