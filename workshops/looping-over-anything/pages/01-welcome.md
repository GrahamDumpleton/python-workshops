---
title: Welcome
requires: [quiz:recap-character, quiz:recap-passes, quiz:recap-lookup, verify:notebook-created]
---

# Looping over anything

You already know the `for` loop: it runs the same lines one time for
each item of a list. In this workshop you learn that the `for` loop
works with many other values too. It works with a string, and it works
with a dictionary. You also learn two functions that make loops
shorter and clearer.

You will learn:

- how to run the same lines for every character of a string

- how to run the same lines for every key of a dictionary, for every
  value, and for every key together with its value

- how to number the passes of a loop

- how to use two lists together in one loop, without an index

You type most of the code in this workshop yourself. The workshop
takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Working with text**.

```{quiz}
:id: recap-character
:title: A character of a string
question: 'The name `word` refers to the string `"tea"`. What is the value of `word[0]`?'
options:
  - { text: '`"a"`', explanation: "The character `\"a\"` is the third character. Python counts from 0, so it is `word[2]`." }
  - { text: '`"tea"`', explanation: "`word[0]` gives one character, not the whole string. The number in the square brackets is the position of the character." }
  - { text: '`"t"`', correct: true }
explanation: "A string is a row of characters. A character is one letter, one digit, one space or one symbol. The number in the square brackets is the index, which is the position of the character. Python counts from 0, so `word[0]` is the first character."
```

The second question is about the workshop **Doing it again**.

```{quiz}
:id: recap-passes
:title: The passes of a loop
question: 'A cell has the line `for day in ["Monday", "Tuesday", "Wednesday"]:` and under it the line `print(day)`, which begins with four spaces. How many times does Python run the `print()` line?'
options:
  - { text: "One time", explanation: "A `for` loop runs the lines of its block one time for each item of the list. This list has three items." }
  - { text: "Three times", correct: true }
  - { text: "Four times", explanation: "The list has three items, so the loop runs its block three times. The four spaces only show that the line belongs to the loop." }
explanation: "A loop is a piece of code that tells Python to run the same lines many times. A `for` loop runs its block one time for each item of the list, and each run is called a pass. Before each pass, Python makes the name `day` refer to the next item."
```

The third question is about the workshop **Looking things up**.

```{quiz}
:id: recap-lookup
:title: A value in a dictionary
question: 'The name `ages` refers to the dictionary `{"Ravi": 30, "Elena": 25}`. What is the value of `ages["Elena"]`?'
options:
  - { text: "`25`", correct: true }
  - { text: "`30`", explanation: "`30` is the value that belongs to the key `\"Ravi\"`. The key in the square brackets is `\"Elena\"`." }
  - { text: '`"Elena"`', explanation: "`\"Elena\"` is the key. The expression `ages[\"Elena\"]` gives the value that belongs to that key." }
explanation: "A dictionary holds pairs. Each pair has a key and a value, with a colon between them. You write a key in square brackets to get the value that belongs to it. So `ages[\"Elena\"]` is `25`."
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
    # Looping over anything

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
