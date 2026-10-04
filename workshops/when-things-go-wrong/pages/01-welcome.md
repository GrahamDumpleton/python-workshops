---
title: Welcome
requires: [quiz:recap-new-value, quiz:recap-first-index, quiz:recap-number-in-text, verify:notebook-created]
---

# When things go wrong

Sometimes Python cannot do what your code says. When that happens,
Python stops and shows an error message. This happens to every
programmer, every day. It does not mean that you are bad at
programming, and it does not damage anything.

In this workshop you make errors on purpose. Every cell that you get
has a mistake in it. You run the cell, you read what Python says, and
you correct the mistake.

You will learn:

- why an error message is help, and not a punishment

- how to read an error message by its three parts

- what the five most common types of error mean

- how to correct a cell that has more than one mistake

The workshop takes about twenty-five minutes.

## Three questions before you start

The first question is about the workshop **Naming things**. The other
two are about the workshop **Working with text**. If you have not done
those workshops, you can still answer the questions. The explanations
tell you what you need to know.

Look at this cell for the first question.

```python
price = 10
price = price + 5
print(price)
```

```{quiz}
:id: recap-new-value
:title: A new value for a name
question: "Which value does this cell show when it runs?"
options:
  - { text: "`10`", explanation: "`10` is the first value. The second line gives the name `price` a new value." }
  - { text: "`15`", correct: true }
  - { text: "`5`", explanation: "The right side of the second line is `price + 5`, not only `5`. Python uses the old value of `price` in the calculation." }
explanation: "A line with the symbol `=` is an assignment. Python calculates the right side first. `price + 5` is 15, and then the name `price` refers to 15."
```

Text in Python is called a **string**. A string is written between
quotes. The next question is about this string:

```python
word = "Python"
```

```{quiz}
:id: recap-first-index
:title: The first character
question: "Which expression gives the first character of the string, `P`?"
options:
  - { text: "`word[1]`", explanation: "Python starts to count at 0, not at 1. `word[1]` is the second character, `y`." }
  - { text: "`word[0]`", correct: true }
  - { text: "`word(0)`", explanation: "The number goes between square brackets, not between parentheses." }
explanation: "The position of a character in a string is called its index. Python starts to count at 0, so the first character has the index 0."
```

The last question is about a number inside a string. The name `total`
refers to the number `36`.

```{quiz}
:id: recap-number-in-text
:title: A number inside a string
question: "Which expression gives the string `Total: 36`?"
options:
  - { text: '`"Total: {total}"`', explanation: "Without the letter `f` before the first quote, Python does not replace the part in braces. The result is the text `Total: {total}`." }
  - { text: '`f"Total: {total}"`', correct: true }
  - { text: '`"Total: " + total`', explanation: "The operator `+` joins two strings, but `total` is a number. Python cannot do this, and shows an error. You see that error later in this workshop." }
explanation: "A string with the letter `f` before the first quote is called an f-string. Python replaces each name in braces with its value."
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
    # When things go wrong

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
