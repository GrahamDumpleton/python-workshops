---
title: Welcome
requires: [quiz:recap-last-line, quiz:recap-total, quiz:recap-none, verify:notebook-created]
---

# When the data is wrong

A program often works with data that a person typed. People make
mistakes when they type. A number is missing, or a word is in the
place of a number. A program that stops at the first mistake in its
data is not useful.

In this workshop you learn how a program can find a mistake in its
data, do something sensible about it, and continue.

You will learn:

- what Python calls an error that stops a program while it runs

- how to tell Python what to do when such an error happens

- why you always say which type of error you expect

- why a mistake in the data is different from a mistake in your code

- how to make your own code stop with an error message that you wrote

- how to read a file that has rows which cannot be read

You write most of the code yourself. Each task says exactly what to
write. Each task also has hints, and a solution that you can open if
you need it.

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **When things go wrong**.

```{quiz}
:id: recap-last-line
:title: Where to start reading
question: "Python stops and shows an error message that has many lines. Which line do you read first?"
options:
  - { text: "The first line, at the top", explanation: "The first line shows the word `Traceback`, which is the name of this kind of message. The most useful line is at the other end of the message." }
  - { text: "The last line, at the bottom", correct: true }
  - { text: "The line that has the arrow `---->`", explanation: "The arrow marks the line of your cell where Python stopped. You read it second. One other line says what kind of problem Python found, and you read that line first." }
explanation: "You read the last line first. It holds the type of the error, such as `NameError`, then a colon, then a short message that gives the details. After that you look for the arrow `---->`, which marks the line where Python stopped. You read many error messages in this workshop."
```

The second question is about the workshop **Doing it again**.

```{quiz}
:id: recap-total
:title: Adding up a total
question: "A cell holds the line `total = 0`. Then it holds a loop that begins with `for price in [2, 3, 5]:`. The block of the loop is the line `total = total + price`. What does `total` refer to after the loop?"
options:
  - { text: "`5`", explanation: "`5` is the last item of the list. The line in the block does not replace the total with the item. It adds the item to the total." }
  - { text: "`10`", correct: true }
  - { text: "`0`", explanation: "`0` is the value before the loop. The block runs one time for each item of the list, and each time it adds the item to the total." }
explanation: "The loop runs its block one time for each item of the list. Each time, the block adds the item to the total. The total starts from `0`, and then becomes `2`, then `5`, then `10`. You add up a total in this way several times in this workshop."
```

The third question is about the workshop **Your first function**.

```{quiz}
:id: recap-none
:title: A function that gives nothing back
question: "A function runs to the end of its body, and no line with `return` runs. What does the call of the function give back?"
options:
  - { text: "`None`", correct: true }
  - { text: "`0`", explanation: "`0` is a number, and Python does not choose a number for you. It gives back a special value which means that there is no value." }
  - { text: "The value of the last line of the body", explanation: "Python gives back only the value of a line that begins with `return`. Without such a line, it gives back a special value which means that there is no value." }
explanation: "A line that begins with `return` gives a value back to the code that called the function. When no such line runs, the call gives back `None`, the value that means \"there is no value here\". One of your functions in this workshop returns `None` on purpose."
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
    # When the data is wrong

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
