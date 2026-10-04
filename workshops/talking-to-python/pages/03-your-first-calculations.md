---
title: Your first calculations
requires: [verify:addition-ran, quiz:predict-multiply, verify:multiply-ran]
---

# Your first calculations

The simplest instruction that you can give Python is a calculation.
You write the calculation, and Python gives you the answer. In this
way, Python works like a calculator.

## Expressions and values

A calculation such as `2 + 3` is called an **expression**. An
expression is a piece of code that Python calculates to produce a
result. The result is called a **value**. The value of the expression
`2 + 3` is `5`.

The symbol `+` is an **operator**. An operator is a symbol that tells
Python which calculation to do.

Click the action below. It adds a cell with the expression `2 + 3` to
your notebook, and runs it.

```{attempt}
:id: addition-not-run
:check: addition-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-addition
:title: Add a cell with the expression 2 + 3, and run it
:path: {{ notebook }}
:tags: [addition]
:run: true
2 + 3
```

Python calculated the value of the expression, and the notebook shows
that value, `5`, under the cell.

```{verify}
:id: addition-ran
:label: Python calculated 2 + 3
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed addition
if 5 in Out.values():
    print("The cell ran, and the value is 5.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
5 in Out.values()
```

## More operators

Python has an operator for each of the usual calculations. Two of them
are the symbols that you already know:

- `+` adds two numbers.

- `-` subtracts the second number from the first.

The operator for multiplication is different from the one that you
write by hand. A keyboard has no `×` key, so Python uses the star
symbol:

- `*` multiplies two numbers.

Before you run the next cell, predict its result. Type your prediction
in the box, then click `Submit` or press `Enter`.

```{quiz}
:id: predict-multiply
:type: text
:title: Predict the value
question: "What is the value of the expression `6 * 5`?"
answer: "30"
wrong:
  - { text: "11", explanation: "`11` is 6 plus 5. The operator `*` multiplies." }
  - { text: "65", explanation: "Python does not join the two numbers. The operator `*` multiplies them." }
  - { text: "30.0", explanation: "The number is correct. But `6` and `5` have no decimal point, so the result has no decimal point either. The next page explains this." }
otherwise: "The operator `*` multiplies. Type the result of 6 multiplied by 5, in digits."
explanation: "The operator `*` multiplies, and 6 multiplied by 5 is 30."
```

Now run the expression, and compare the output with your prediction.

```{attempt}
:id: multiply-not-run
:check: multiply-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-multiply
:title: Add a cell with the expression 6 * 5, and run it
:path: {{ notebook }}
:tags: [multiply]
:run: true
6 * 5
```

```{verify}
:id: multiply-ran
:label: Python calculated 6 * 5
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed multiply
if 30 in Out.values():
    print("The cell ran, and the value is 30.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
30 in Out.values()
```

```{hint}
:title: Do the spaces matter?
Python ignores the spaces around an operator. The expressions `6 * 5`
and `6*5` have the same value. Programmers usually write the spaces,
because they make the code easier to read. These workshops always
write them.
```

```{hint}
:title: Try it yourself
You can try any calculation that you like. You need an empty cell to
type it in, and you add that cell yourself.

1. Click on the last cell in your notebook.

2. Click the `+` button in the row of buttons at the top of the
   notebook. A new empty cell appears below the cell that you clicked.

3. Click inside the new cell, and type an expression, for example
   `9 - 2`.

4. Hold `Shift` and press `Enter` to run the cell.
```
