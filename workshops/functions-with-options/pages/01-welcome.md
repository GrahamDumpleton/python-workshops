---
title: Welcome
requires: [quiz:recap-f-string, quiz:recap-type-error, quiz:recap-argument, verify:notebook-created]
---

# Functions with options

In the last workshop, you wrote your first functions. Each call of
those functions had to give a value for every parameter. In this
workshop you learn how to write a function that has options: values
that a call can give, but does not have to give.

You will learn:

- how to give a parameter a value that Python uses when the call
  gives none

- how to name an argument in a call, so that the call is clear to
  read

- how to change one option of a function and leave the others as they
  are

- how to describe a function, so that other people know how to use it

- how to write a function that calls another function

In this workshop you type most of the code yourself. Each task tells
you exactly what to write, and each task has hints and a solution.

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Working with text**.

```{quiz}
:id: recap-f-string
:title: A value inside a text
question: 'The name `city` refers to the string `"Lima"`. What is the value of `f"Welcome to {city}!"`?'
options:
  - { text: '`"Welcome to {city}!"`', explanation: "The letter `f` before the first quote makes this an f-string. Python replaces the braces and the name between them with the value of the name." }
  - { text: '`"Welcome to Lima!"`', correct: true }
  - { text: '`"Welcome to city!"`', explanation: "Python does not put the name in the text. It puts the value that the name refers to, which is the string `\"Lima\"`." }
explanation: "A string that has the letter `f` before its first quote is an f-string. Python replaces each pair of braces with the value of the name between them. Many functions in this workshop build a text with an f-string."
```

The second question is about the workshop **When things go wrong**.

```{quiz}
:id: recap-type-error
:title: The type of an error
question: "A cell stops, and the last line of the error message begins with `TypeError`. What does a `TypeError` mean?"
options:
  - { text: "A name is used before it has a value", explanation: "That is a `NameError`. A `TypeError` is about a value that has the wrong type." }
  - { text: "Python cannot read the code, for example because a parenthesis is missing", explanation: "That is a `SyntaxError`. A `TypeError` is about a value that has the wrong type." }
  - { text: "A value has the wrong type for what the code tries to do with it", correct: true }
explanation: "A `TypeError` means that a value has the wrong type for what the code tries to do with it, such as a string plus a number. In this workshop you see that Python also shows a `TypeError` when a call does not fit the function, for example when the call gives too few values."
```

The third question is about the workshop **Your first function**.

```{quiz}
:id: recap-argument
:title: The value in a call
question: "A function is defined with the line `def double(number):`. A cell calls it with `double(21)`. What is `21`?"
options:
  - { text: "An argument: the value that the call gives to the function", correct: true }
  - { text: "A parameter: the name in the `def` line", explanation: "The parameter is the name `number`, in the `def` line. The value `21`, which the call gives, is an argument." }
  - { text: "The return value: the value that the function gives back", explanation: "The return value is what the function gives back after it has run. The value `21` goes into the function, so it is an argument." }
explanation: "A parameter is a name in the `def` line. An argument is a value that a call gives. When the call runs, the parameter `number` refers to the argument `21`. The next page repeats these words."
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
    # Functions with options

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
