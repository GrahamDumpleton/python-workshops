---
title: Welcome
requires: [quiz:recap-label, quiz:recap-sort, quiz:recap-parameter, verify:notebook-created]
---

# Two names, one list

Sometimes a program changes one list, and the change also appears in
a place where you did not expect it. No error message appears. The
program runs, and it gives a wrong answer. Many people who learn
Python meet this problem by accident, and it is difficult to find
when you do not know its reason.

In this workshop you meet the problem on purpose. On each page you
first predict what a cell shows. Then you run the cell, read why
Python did what it did, and correct the code yourself.

You will learn:

- why two names can refer to one list, and how to test for that

- how to make a real copy of a list

- which values can change, and which values can never change

- how a function can change a list that it is given, and how to stop
  that

- why a copy of a list that holds other lists is not a complete copy

- which names exist only inside a function

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Naming things**.

```{quiz}
:id: recap-label
:title: A name is a label
question: "A cell holds three lines: `old_price = 40`, then `new_price = old_price`, then `old_price = 50`. Which value does `new_price` refer to after the cell runs?"
options:
  - { text: "`50`, because the two names are connected", explanation: "An assignment does not connect two names. The second line ties the label `new_price` to the value `40`. The third line moves only the label `old_price`." }
  - { text: "`40`, because the third line moves only the label `old_price`", correct: true }
  - { text: "`90`, because Python adds the two values", explanation: "Nothing in these lines adds values. Each line is an assignment, which ties a name to a value." }
explanation: "A name is a label that is tied to a value. The line `new_price = old_price` ties a second label to the value `40`. The line `old_price = 50` moves the label `old_price` to another value, and the label `new_price` stays where it is. This workshop uses the same picture for lists."
```

The second question is about the workshop **Keeping a list**.

```{quiz}
:id: recap-sort
:title: Two ways to sort
question: "The name `ages` refers to the list `[31, 8, 19]`. Which line changes the list `ages` itself?"
options:
  - { text: "`ages.sort()`", correct: true }
  - { text: "`in_order = sorted(ages)`", explanation: "`sorted(ages)` makes a new list that is in order. It leaves the list `ages` as it was." }
  - { text: "`print(ages)`", explanation: "`print()` shows a value. It does not change the value." }
explanation: "`ages.sort()` changes the list: after this line, the list `ages` is in order. `sorted(ages)` gives back a new list, and the list `ages` stays as it was. Some code changes a list, and some code makes a new list. That difference is important in this workshop."
```

The third question is about the workshop **Your first function**.

```{quiz}
:id: recap-parameter
:title: Parameter and argument
question: "A function begins with the line `def double(number):`. A later line calls it with `double(4)`. What is `number`?"
options:
  - { text: "An argument: the value that the call gives to the function", explanation: "The argument is the value in the call, which is `4` here. The name in the `def` line is the parameter." }
  - { text: "A parameter: the name in the `def` line, which refers to the value that the call gives", correct: true }
  - { text: "The return value of the function", explanation: "The return value is the value that the function gives back with `return`. The name in the `def` line is a parameter." }
explanation: "A parameter is a name in the `def` line of a function. An argument is the value that a call gives to the function. When the call `double(4)` runs, the parameter `number` refers to the argument `4`."
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
    # Two names, one list

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
