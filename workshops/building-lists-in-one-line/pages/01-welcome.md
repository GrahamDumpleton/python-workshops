---
title: Welcome
requires: [quiz:recap-append, quiz:recap-loop, quiz:recap-dictionary, verify:notebook-created]
---

# Building lists in one line

Programs often build a new list from a list that they already have:
the prices of a shop after a discount, the names of the
guests in capital letters, or only the temperatures that are above
zero. You can do this with a loop. In this workshop you learn a
shorter way to write the same work, in one line.

You will learn:

- how a loop builds a new list from another list

- how to write the same work in one line, as a list comprehension

- how to keep only the items that pass a test

- how to build a dictionary in the same way

- when a loop is clearer than one line

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Keeping a list**.

```{quiz}
:id: recap-append
:title: Adding an item to a list
question: 'The name `queue` refers to the list `["Ana", "Bo"]`. Then the line `queue.append("Chen")` runs. What is the list now?'
options:
  - { text: '`["Chen", "Ana", "Bo"]`', explanation: "`.append()` adds the new item at the end of the list. It does not add the item at the beginning." }
  - { text: '`["Ana", "Bo"]`', explanation: "`.append()` changes the list. The list now has one more item, at the end." }
  - { text: '`["Ana", "Bo", "Chen"]`', correct: true }
explanation: "A list holds several values in order, and each value is an item. `.append()` adds one item to the end of a list. A program often starts with the empty list `[]` and adds the items one at a time. You use this in the first step of this workshop."
```

The second question is about the workshop **Doing it again**.

```{quiz}
:id: recap-loop
:title: The passes of a loop
question: "The name `guests` refers to a list of four names. A loop begins with the line `for guest in guests:`. How many times does Python run the block of the loop?"
options:
  - { text: "One time", explanation: "A `for` loop runs its block one time for each item of the list. The list has four items." }
  - { text: "Four times, one time for each item of the list", correct: true }
  - { text: "Until the cell is stopped", explanation: "A `for` loop over a list ends after the last item. This list has four items, so the block runs four times." }
explanation: "A `for` loop runs the lines of its block one time for each item of the list. Each run is called a pass. Before each pass, the loop makes the loop name, here `guest`, refer to the next item."
```

The third question is about the workshop **Looking things up**.

```{quiz}
:id: recap-dictionary
:title: A value in a dictionary
question: 'The name `stock` refers to the dictionary `{"pens": 12, "books": 5}`. What is the value of `stock["books"]`?'
options:
  - { text: "`5`", correct: true }
  - { text: "`12`", explanation: '`12` is the value that belongs to the key `"pens"`. The square brackets hold the key `"books"`.' }
  - { text: "`1`", explanation: "A dictionary does not use positions. The square brackets hold a key, and the result is the value that belongs to that key." }
explanation: 'A dictionary holds pairs. Each pair has a key and a value, with a colon between them. You write a key in square brackets to get the value that belongs to it. Here the key `"books"` has the value `5`.'
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
    # Building lists in one line

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
