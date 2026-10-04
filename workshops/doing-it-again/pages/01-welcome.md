---
title: Welcome
requires: [quiz:recap-error-line, quiz:recap-block, quiz:recap-index, verify:notebook-created]
---

# Doing it again

Until now, Python ran each line of your code one time. In this
workshop you learn how to make Python run the same lines many times.
This is the work that a computer does best: it repeats an instruction
a thousand times, and it does not get tired or make a mistake.

You will learn:

- how to run the same lines for every item of a list

- how to repeat lines a fixed number of times

- how to add up a total, how to count, and how to find the largest
  value

- how to use two lists together

- how to repeat lines until something becomes true or false

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **When things go wrong**.

```{quiz}
:id: recap-error-line
:title: Reading an error message
question: A cell stops, and Python shows an error message that has many lines. Which line do you read first?
options:
  - { text: "The first line, because it is at the top", explanation: "The first lines show where Python was when it stopped. The line that says what went wrong is the last line." }
  - { text: "The last line, because it gives the type of the error and says what went wrong", correct: true }
  - { text: "The longest line, because it has the most information", explanation: "The length of a line does not matter. The last line gives the type of the error and says what went wrong." }
explanation: "Read the last line first. It begins with the type of the error, such as `NameError` or `IndexError`, and then says what went wrong."
```

The second question is about the workshop **Making decisions**.

```{quiz}
:id: recap-block
:title: The block of an if
question: "A line that begins with `if` ends with a colon. How does Python know which lines under it belong to the `if`?"
options:
  - { text: "The lines that belong to the `if` begin with four spaces", correct: true }
  - { text: "Every line under the `if` belongs to it, to the end of the cell", explanation: "Only the lines that begin with spaces belong to the `if`. The first line that begins without spaces is outside it, and Python always runs that line." }
  - { text: "Only the first line under the `if` belongs to it", explanation: "The `if` can have many lines. Every line under it that begins with four spaces belongs to it." }
explanation: "The lines that begin with four spaces under the `if` are its block. Python runs the block only when the comparison of the `if` is true. The spaces are called indentation. You use blocks again in this workshop."
```

The third question is about the workshop **Keeping a list**.

```{quiz}
:id: recap-index
:title: An item of a list
question: 'The name `colours` refers to the list `["red", "green", "blue"]`. What is the value of `colours[1]`?'
options:
  - { text: '`"red"`', explanation: "Python counts the items of a list from 0, so `colours[0]` is the first item, and `colours[1]` is the second item." }
  - { text: '`"green"`', correct: true }
  - { text: '`"blue"`', explanation: "The item `\"blue\"` is the third item. Python counts from 0, so it is `colours[2]`." }
explanation: "A list holds several values in order. The number in the square brackets is the index, and Python counts from 0. So `colours[1]` is the second item."
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
    # Doing it again

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
