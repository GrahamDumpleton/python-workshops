---
title: Choosing with if
requires: [verify:rain-ran, quiz:predict-sun, verify:sun-ran, verify:discount-fixed]
---

# Choosing with if

You can now ask Python a question. The next step is to make Python do
something only when the answer is `True`. The word for this in Python
is `if`.

Instructions for people use the same idea. A recipe says: "If the
sauce is too thick, add some water." The cook checks the sauce. Water
is added only when the sauce is too thick. In every case, the cook
then continues with the next step of the recipe.

## The code

Look at this cell.

```python
rain_chance = 80
if rain_chance > 50:
    print("Take an umbrella.")
    print("Wear a coat.")
print("Have a good day.")
```

The second line has three parts:

1. the word `if`

2. a comparison, `rain_chance > 50`. A comparison that is used to make
   a decision is called a **condition**.

3. the symbol `:` at the end of the line. It says that the lines that
   depend on the condition come next.

The third and fourth lines begin with four spaces. Spaces at the start
of a line are called **indentation**, and a line that begins with
spaces is "indented". The indented lines under the `if` line belong to
it. Together they are called a **block**. Python performs the block
only when the condition is `True`.

The last line has no indentation. It is not in the block, so it does
not depend on the condition. Python always performs it.

```{attempt}
:id: rain-not-run
:check: rain-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-rain
:title: Add a cell that gives advice when the chance of rain is high, and run it
:path: {{ notebook }}
:tags: [rain]
:run: true
rain_chance = 80
if rain_chance > 50:
    print("Take an umbrella.")
    print("Wear a coat.")
print("Have a good day.")
```

```{verify}
:id: rain-ran
:label: Python performed the block, because the condition was True
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed rain
if globals().get("rain_chance") == 80:
    print("The cell ran. The condition was True, so Python performed the two lines of the block.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("rain_chance") == 80
```

The condition `rain_chance > 50` is `True`, because 80 is greater than
50. Python performed the two lines of the block, and then the last
line. The output has three lines.

## When the condition is False

The next cell has the same form, with other names and other text. This
time the first value is `20`. Do not run the cell yet.

```python
sun_chance = 20
if sun_chance > 50:
    print("Take a hat.")
    print("Take some water.")
print("Enjoy your walk.")
```

```{quiz}
:id: predict-sun
:type: text
:title: Predict the output
question: This cell shows only one line when it runs. Type that line.
answer: ["Enjoy your walk.", "Enjoy your walk"]
wrong:
  - { text: "Take a hat.", explanation: "This line is in the block. The condition `sun_chance > 50` is `False`, because 20 is not greater than 50, so Python does not perform the block." }
  - { text: "Take some water.", explanation: "This line is in the block. The condition `sun_chance > 50` is `False`, because 20 is not greater than 50, so Python does not perform the block." }
  - { text: "False", explanation: "The condition is `False`, but the cell does not print the condition. Which `print()` line does Python still perform?" }
otherwise: "The condition `sun_chance > 50` is `False`. Python does not perform the indented lines. Which line has no indentation?"
explanation: "20 is not greater than 50, so the condition is `False` and Python does not perform the block. The last line is not in the block, so Python performs it."
```

```{attempt}
:id: sun-not-run
:check: sun-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-sun
:title: Add a cell where the condition is False, and run it
:path: {{ notebook }}
:tags: [sun]
:run: true
sun_chance = 20
if sun_chance > 50:
    print("Take a hat.")
    print("Take some water.")
print("Enjoy your walk.")
```

```{verify}
:id: sun-ran
:label: Python did not perform the block, because the condition was False
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed sun
if globals().get("sun_chance") == 20:
    print("The cell ran. The condition was False, so Python performed only the last line.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("sun_chance") == 20
```

## Indentation has a meaning

In most writing, spaces at the start of a line only change how the
text looks. In Python, indentation is part of the program. It is the
only thing that tells Python which lines are in the block.

- These workshops always use four spaces for a block. Every line of a
  block must have the same indentation.

- You do not have to type the spaces. When a line ends with `:` and
  you press `Enter`, the notebook adds the four spaces to the new line
  for you.

- To end the block, remove the four spaces from the start of the new
  line, with the `Backspace` key.

- A line that is indented where no block begins is a mistake. Python
  stops with the message `IndentationError: unexpected indent`. You
  met that error in the workshop **When things go wrong**. An **error
  message** is the text that Python shows when it cannot continue.

## Your task

A shop gives a discount of `15` to a customer whose basket costs `100`
or more. Every other customer gets no discount, so the discount is
`0`. The action below adds a cell for this rule. The cell has a
mistake, and the action does not run it.

```{cell-insert}
:id: insert-discount
:title: Add a cell that has a mistake in its indentation, without running it
:path: {{ notebook }}
:tags: [discount]
:run: false
basket = 30
discount = 0
if basket >= 100:
    print("You get a discount.")
discount = 15
print(discount)
```

First run the cell: click inside it, hold `Shift` and press `Enter`.
The basket costs only `30`, but the output is `15`. The customer got a
discount that the rule does not allow.

Correct the cell, so that the name `discount` gets the value `15` only
when the condition is `True`. Do not change the value of `basket`.
Then run the cell again. The output must be `0`.

```{hint}
:title: Hint: where is the mistake?
Look at the start of each line. Which lines are in the block of the
`if` line? The line `discount = 15` has no indentation, so it is not
in the block, and Python always performs it.
```

```{hint}
:title: Hint: how to correct it
Click at the very start of the line `discount = 15`, and type four
spaces. The line is then in the block, under the first `print()` line,
and Python performs it only when `basket >= 100` is `True`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: discount-not-started
:check: discount-fixed
:expect: The cell has not run yet
```

````{attempt}
:id: discount-unchanged
:check: discount-fixed
:expect: is not in the block

```{cell-insert}
:path: {{ notebook }}
:run: true
basket = 30
discount = 0
if basket >= 100:
    print("You get a discount.")
discount = 15
print(discount)
```
````

````{attempt}
:id: discount-basket-changed
:check: discount-fixed
:expect: Change the first line back to basket = 30

```{cell-insert}
:path: {{ notebook }}
:run: true
basket = 100
discount = 0
if basket >= 100:
    print("You get a discount.")
discount = 15
print(discount)
```
````

````{attempt}
:id: discount-other-value
:check: discount-fixed
:expect: but it must refer to 0

```{cell-insert}
:path: {{ notebook }}
:run: true
basket = 30
discount = 5
if basket >= 100:
    print("You get a discount.")
    discount = 15
print(discount)
```
````

````{hint}
:title: Show me a solution
:unlock: "discount-fixed" in failed_checks or "discount-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-discount-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [discount-solution]
:run: true
basket = 30
discount = 0
if basket >= 100:
    print("You get a discount.")
    discount = 15
print(discount)
```
````

```{verify}
:id: discount-fixed
:label: A basket that costs 30 gets no discount
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed discount; cell-executed discount-solution
if "basket" not in globals() or "discount" not in globals():
    print("The cell has not run yet. Run the new cell first, and read its output. Then correct the indentation and run the cell again.")
elif basket != 30:
    print(f"The name basket refers to {basket}. This check needs a basket that gets no discount. Change the first line back to basket = 30. Then run the cell again.")
elif discount == 0:
    print("Correct. The line discount = 15 is now in the block, so Python performs it only when the basket costs 100 or more.")
elif discount == 15:
    print("The name discount refers to 15, but the basket costs only 30. The line discount = 15 is not in the block, so Python always performs it. Type four spaces at the start of that line. Then run the cell again.")
else:
    print(f"The name discount refers to {discount} but it must refer to 0 for a basket that costs 30. The second line must be discount = 0, and the line discount = 15 must be in the block. Then run the cell again.")
"basket" in globals() and "discount" in globals() and basket == 30 and discount == 0
```

After the check passes, change the first line to `basket = 150` and
run the cell again. The condition is now `True`, so the output has two
lines: `You get a discount.` and `15`.
