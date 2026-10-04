---
title: Welcome
requires: [quiz:recap-float, quiz:recap-new-value, verify:notebook-created]
---

# Working with text

In the earlier workshops, every value was a number. Programs also
work with words and sentences: the name of a person, the title of a
book, a message on the screen. In this workshop you learn how Python
works with text.

You will learn:

- how to write text in Python, and why text is different from a number

- how to join pieces of text, and how to put a value into text

- how to count the characters of a text, and how to select some of
  them

- how to use methods, which make a new text from an old one

- how to build a line of text of your own from parts

The workshop takes about twenty-five minutes.

## Two questions before you start

The first question is about the workshop **Talking to Python**, and
the second question is about the workshop **Naming things**. If you
have not done those workshops, you can still answer the questions.
The explanations tell you what you need to know.

```{quiz}
:id: recap-float
:title: Two kinds of number
question: "Python has two kinds of number. An integer is a whole number, and a float is a number that has a decimal point. Which of these values is a float?"
options:
  - { text: "`12`", explanation: "`12` has no decimal point, so it is an integer." }
  - { text: "`2.5`", correct: true }
  - { text: "`250`", explanation: "`250` has no decimal point, so it is an integer." }
explanation: "`2.5` has a decimal point, so it is a float. In this workshop you learn how to show a float such as a price with two digits after the decimal point."
```

```{quiz}
:id: recap-new-value
:title: A name and its value
question: "A cell holds two lines. The first line is `steps = 4000`. The second line is `steps = steps + 500`. Which value does the name `steps` refer to after the cell runs?"
options:
  - { text: "`4000`", explanation: "`4000` is the first value. The second line gives the name a new value." }
  - { text: "`500`", explanation: "The right side of the second line is `steps + 500`, not only `500`. Python uses the old value of `steps` in the calculation." }
  - { text: "`4500`", correct: true }
explanation: "A line such as `steps = 4000` is an assignment. It makes the name on the left refer to the value on the right. Python calculates the right side first. In the second line, `steps + 500` is 4500, and then the name `steps` refers to 4500."
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
    # Working with text

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
