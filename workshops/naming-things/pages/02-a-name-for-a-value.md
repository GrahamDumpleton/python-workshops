---
title: A name for a value
requires: [verify:price-named, quiz:what-assignment-does]
---

# A name for a value

A calculator forgets each result when you start the next calculation.
If you need the result again, you must type the number again.

A program cannot work in that way. A program that prints a receipt
needs the price of each item many times: to show it, to add it to the
total, and to calculate a discount. The program must remember each
value, and it must have a way to ask for the value again.

Python does this with names. You choose a **name**, and you tell
Python which value the name refers to. From then on, Python remembers
the value. When you write the name, Python uses the value.

A contact in a telephone is a good comparison. You save a telephone
number once, under the name of a person. After that, you use the name,
and the telephone finds the number for you.

Programmers call a name that refers to a value a **variable**. You
will see that word in books and on websites. These workshops usually
say "name", because it is the shorter word.

## Giving a value a name

This line of code gives the name `ticket_price` to the value `12`:

```python
ticket_price = 12
```

The line is called an **assignment**. An assignment always has three
parts:

1. on the left, the name

2. in the middle, the symbol `=`

3. on the right, the value

Click the action below. It adds a cell with two lines, and runs it.
The first line is the assignment. The second line is only the name.

```{attempt}
:id: price-not-run
:check: price-named
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-price
:title: Add a cell that gives the name ticket_price to the value 12, and run it
:path: {{ notebook }}
:tags: [price]
:run: true
ticket_price = 12
ticket_price
```

## What happened

Python performed the two lines in order.

1. `ticket_price = 12` is the assignment. Python now remembers that
   the name `ticket_price` refers to the value `12`. An assignment
   shows nothing in the notebook.

2. `ticket_price` is an expression that contains only the name. Python
   found the value that the name refers to. That value is `12`. It is
   the value of the last line of the cell, so the notebook shows it.

```{verify}
:id: price-named
:label: The name ticket_price refers to the value 12
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed price
if globals().get("ticket_price") == 12:
    print("The cell ran. The name ticket_price refers to the value 12.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("ticket_price") == 12
```

## The symbol `=` is an instruction

In mathematics, the symbol `=` says that two things are equal. In
Python, the symbol `=` means something different. It is an
instruction: "make the name on the left refer to the value on the
right".

For this reason, the name is always on the left. The line `12 =
ticket_price` is not correct Python.

```{quiz}
:id: what-assignment-does
:title: An assignment
question: "What does the line `width = 30` do?"
options:
  - { text: "It asks Python whether `width` is equal to 30", explanation: "The symbol `=` does not ask a question. It is an instruction that gives a name to a value." }
  - { text: "It makes the name `width` refer to the value 30", correct: true }
  - { text: "It shows the number 30 under the cell", explanation: "An assignment shows nothing. It only makes Python remember the value under the name." }
explanation: "An assignment makes the name on the left refer to the value on the right. After this line, Python uses the value 30 wherever you write `width`."
```
