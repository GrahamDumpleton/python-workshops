---
title: A script shows only what it prints
requires: [quiz:predict-price]
---

# A script shows only what it prints

You have now run Python code in three places: in a notebook, at the
`>>>` prompt, and as a script. The three places do not show the same
things, and this page explains the difference.

- In a notebook, a cell shows the value of its last line, when that
  line is an expression. The workshop **Talking to Python** said that
  this is a rule of the notebook, and not a rule of Python.

- At the `>>>` prompt, Python shows the value of every expression that
  you type, at once.

- A script shows a value only when the code calls `print()`.

## Why a script is different

The notebook and the `>>>` prompt are made for a person who tries
things. That person wants to see every value. A script is made to do
work, often with no person in front of it. If a script showed the
value of every expression, a program of a thousand lines would fill
the screen with values that nobody asked for. So a script shows what
the code says it must show, and nothing more.

You can compare the two with a calculator and a cash register in a
shop. A calculator shows the result of every step, because you are
working with it. A cash register does many sums, and prints only the
lines of the receipt.

## A small script

Click the action below. It makes a new file with three lines, and
opens it in the editor.

```{file-write}
:id: write-price
:title: Make the file price.py and open it
:path: price.py
:open: true
price = 4
price * 3
print(price + 1)
```

Read the three lines:

- The first line makes the name `price` refer to the value `4`.

- The second line is an expression. Its value is `12`.

- The third line calls `print()` with the value of `price + 1`.

```{quiz}
:id: predict-price
:title: What does the script show?
:type: text
question: "You run the command `python price.py`. What does the terminal show under the command? Type exactly what you expect."
answer: "5"
wrong:
  - { text: "12", explanation: "`12` is the value of the expression on the second line. A script does not show the value of an expression. It shows only what the code gives to `print()`." }
  - { pattern: "12\\s*,?\\s*5", explanation: "The `>>>` prompt shows both values, because it shows the value of every expression. A script shows only what the code gives to `print()`, and the second line does not call `print()`." }
  - { text: "4", explanation: "`4` is the value that `price` refers to. The third line gives the value of `price + 1` to `print()`." }
otherwise: "Find the line that calls `print()`. A script shows only what the code gives to `print()`."
explanation: "The script shows `5`. Python calculated the value `12` on the second line, and then did nothing with it. Only the third line calls `print()`."
```

Now click the action below to run the script.

```{execute}
:id: run-price
:title: Run the script price.py
:wait: prompt
python price.py
```

The terminal shows one line of output:

```
5
```

## What this means for your program

The script `spending.py` showed nothing because no line of it calls
`print()`. To make the program show a report, the code must read the
file of purchases, and it must print each line of the report. You
write that code on the next pages.
