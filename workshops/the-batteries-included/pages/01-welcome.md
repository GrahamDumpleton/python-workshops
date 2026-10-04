---
title: Welcome
requires: [quiz:recap-get-default, quiz:recap-tuple, quiz:recap-float, verify:notebook-created]
---

# The batteries included

Until now, you wrote almost every line of your programs yourself.
Python also comes with a large amount of code that other people have
written and tested. In this workshop you learn how to use that code in
your own programs.

The title needs one explanation. Some products are sold together with
their batteries, so you can use them at once and you do not need to
buy anything more. Python programmers say that Python comes with
"batteries included". They mean that Python comes with a large set of
code that is ready to use, and that you do not need to install
anything more to use it.

You will learn:

- what a module is, and what the standard library is

- how to make a module ready to use with `import`

- how to use four modules: `math` for calculations, `random` for
  choices by chance, `datetime` for dates, and `collections` for
  counting

- how to read the Python documentation, to find code that nobody has
  shown you

Many of the examples use the spending of Mariam, the person that these
workshops follow. She wrote down every purchase from January to March
2026.

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Looking things up**.

```{quiz}
:id: recap-get-default
:title: A key that does not exist
question: 'The name `counts` refers to the dictionary `{"rent": 1, "transport": 3}`. What is the value of `counts.get("food", 0)`?'
options:
  - { text: "`None`", explanation: "`get()` gives `None` for a key that does not exist only when it has no second argument. Here the second argument is `0`." }
  - { text: "`0`", correct: true }
  - { text: "`3`", explanation: "`3` is the value of the key `\"transport\"`. The question asks for the key `\"food\"`, which is not in the dictionary." }
explanation: "A dictionary keeps each value together with a key. The method `get()` looks up a key. When the key does not exist, `get()` gives its second argument, which is `0` here. A program that counts things uses this: the count of a thing that it has not seen yet is `0`."
```

The second question is about the workshop **Pairs and unique things**.

```{quiz}
:id: recap-tuple
:title: The first value of a tuple
question: 'The name `pair` refers to the tuple `("food", 6)`. What is the value of `pair[0]`?'
options:
  - { text: '`"food"`', correct: true }
  - { text: "`6`", explanation: "`6` is the second value of the tuple, and its index is `1`. Python counts positions from `0`." }
  - { text: '`("food", 6)`', explanation: "That is the complete tuple. Square brackets with an index give one of its values." }
explanation: 'A tuple is a group of values that belong together and that cannot be changed. It is written with parentheses. You read one of its values with an index, as you do with a list, and the first index is `0`. So `pair[0]` is `"food"` and `pair[1]` is `6`.'
```

The third question is about the workshop **Reading and writing
files**.

```{quiz}
:id: recap-float
:title: A number that is text
question: 'A program reads the amount of a purchase from a file. The amount arrives as the string `"6.40"`. Which expression gives a number that the program can add to a total?'
options:
  - { text: '`"6.40" + 0`', explanation: "Python cannot add a string and a number. This expression stops with a `TypeError`." }
  - { text: '`"6.40".strip()`', explanation: "The method `strip()` removes spaces from the two ends of a string. The result is still a string." }
  - { text: '`float("6.40")`', correct: true }
explanation: 'Everything that a program reads from a file is a string. The function `float()` takes a string that is written like a number and gives the float, so `float("6.40")` gives `6.4`. You use strings from a file again in this workshop, when you make dates from them.'
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
    # The batteries included

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
