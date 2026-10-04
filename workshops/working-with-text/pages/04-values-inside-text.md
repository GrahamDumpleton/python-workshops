---
title: Values inside text
requires: [verify:card-ran, quiz:predict-lemons, verify:lemons-ran, verify:bread-ran, verify:label-fixed]
---

# Values inside text

Joining with `+` becomes difficult to read when a text has many
parts, and it does not work with numbers. Python has a better way to
build a text from values. It is called an **f-string**: a string that
has places in it where Python puts values. The letter `f` is short
for "formatted".

A printed form is a good comparison. The form has fixed words, and
empty places where a person writes a name or a date. An f-string has
fixed text, and places that Python fills.

An f-string has two differences from the strings that you have seen:

- The letter `f` comes directly before the first quote.

- Inside the string, each place for a value is written with braces,
  `{` and `}`, with a name between them.

When Python reaches an f-string, it replaces each pair of braces with
the value of the name between them. The result is an ordinary string.

Click the action below. It adds a cell that uses an f-string, and
runs it.

```{attempt}
:id: card-not-run
:check: card-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-card
:title: Add a cell that puts two values into a text, and run it
:path: {{ notebook }}
:tags: [card]
:run: true
guest = "Priya"
table = 7
place_card = f"{guest} sits at table {table}."
print(place_card)
```

## What happened

1. `guest = "Priya"` makes the name `guest` refer to a string.

2. `table = 7` makes the name `table` refer to a number.

3. The third line has an f-string on the right side. Python replaces
   `{guest}` with `Priya`, and `{table}` with `7`. All other
   characters stay as they are, also the spaces and the full stop.
   The result is the string `"Priya sits at table 7."`, and the name
   `place_card` refers to it.

4. `print(place_card)` shows the string.

The value of `table` is a number, and the f-string accepts it. This
is the way to put a number into text.

```{verify}
:id: card-ran
:label: Python put two values into the text
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed card
if globals().get("place_card") == "Priya sits at table 7.":
    print("The cell ran. The name place_card refers to the string Priya sits at table 7.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("place_card") == "Priya sits at table 7."
```

## Predict the output

Look at this cell. Do not run it yet.

```python
fruit = "lemon"
fruit_count = 3
print(f"I bought {fruit_count} {fruit}s.")
```

Type the output that you predict, exactly as the notebook shows it.

```{quiz}
:id: predict-lemons
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "I bought 3 lemons."
wrong:
  - { text: "I bought {fruit_count} {fruit}s.", explanation: "The letter `f` before the first quote makes this an f-string. Python replaces each pair of braces with the value of the name between them." }
  - { text: "I bought 3 lemon s.", explanation: "The letter `s` comes directly after the closing brace, with no space between. Python keeps the text exactly as it is written." }
  - { text: "I bought 3 lemons", explanation: "The words are correct. The f-string also has a full stop at its end, and Python keeps it." }
  - { text: "I bought 3 lemon.", explanation: "Look at the character that comes directly after `{fruit}` in the f-string. Python keeps it." }
  - { pattern: "f?[\"'].*[\"']", explanation: "`print()` shows a string without its quotes, and without the letter `f`. Type only the characters of the text." }
otherwise: "Python replaces `{fruit_count}` with 3 and `{fruit}` with lemon. Every other character stays as it is written. Check the spaces, the capital letter and the full stop."
explanation: "Python replaces `{fruit_count}` with 3 and `{fruit}` with lemon. The letter `s` after the brace and the full stop stay as they are."
```

```{attempt}
:id: lemons-not-run
:check: lemons-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-lemons
:title: Add the cell with the lemons, and run it
:path: {{ notebook }}
:tags: [lemons]
:run: true
fruit = "lemon"
fruit_count = 3
print(f"I bought {fruit_count} {fruit}s.")
```

```{verify}
:id: lemons-ran
:label: Python filled the two places in the f-string
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed lemons
if globals().get("fruit") == "lemon" and globals().get("fruit_count") == 3:
    print("The cell ran. It showed the text I bought 3 lemons.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("fruit") == "lemon" and globals().get("fruit_count") == 3
```

The braces can hold more than a name. They can hold any expression,
for example `{fruit_count * 2}`. Python calculates the expression,
and puts the result into the text.

## A price with two decimal places

A price is usually written with two digits after the decimal point:
`2.50`, not `2.5`. In Python, a number that has a decimal point is
called a float. Python shows a float with as few digits as it
needs, so the float `2.5` appears as `2.5`.

An f-string can change how a number is shown. Inside the braces,
after the name, write a colon and then `.2f`:

```python
{bread_price:.2f}
```

The part `.2` means "two digits after the decimal point". The letter
`f` at the end means "show the number as a float". This `f` has
nothing to do with the `f` before the first quote.

Click the action below. It adds a cell that shows the same price in
both ways, and runs it.

```{attempt}
:id: bread-not-run
:check: bread-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-bread
:title: Add a cell that shows a price in two ways, and run it
:path: {{ notebook }}
:tags: [bread]
:run: true
bread_price = 2.5
print(f"Bread costs {bread_price}.")
print(f"Bread costs {bread_price:.2f}.")
```

The first line of the output is `Bread costs 2.5.` and the second
line is `Bread costs 2.50.`. The value of `bread_price` is the same
in both lines. Only the way in which it is shown is different.

If the number has more than two digits after the decimal point,
Python rounds it: with `:.2f`, the number `2.678` is shown as `2.68`.

```{verify}
:id: bread-ran
:label: Python showed the price with two decimal places
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed bread
if globals().get("bread_price") == 2.5:
    print("The cell ran. It showed the price as 2.5 and then as 2.50.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("bread_price") == 2.5
```

## Your task

The action below adds a cell that builds a label for a price list.
The action does not run the cell.

```{cell-insert}
:id: insert-label
:title: Add a cell with a price label for me to change
:path: {{ notebook }}
:tags: [label]
:run: false
drink = "tea"
drink_price = 1.5
price_label = f"{drink}: {drink_price}"
print(price_label)
```

When this cell runs, the output is `tea: 1.5`. Change the third line
so that the price has two digits after the decimal point. Do not
change the value in the second line. Then run the cell. The output
must be:

```
tea: 1.50
```

```{hint}
:title: Hint: what do I add?
Look at the cell with the price of bread. The second `print()` in
that cell shows the price with two digits after the decimal point.
Compare the braces in its two lines.
```

```{hint}
:title: Hint: what does the line look like?
Add `:.2f` after the name `drink_price`, inside the braces:
`price_label = f"{drink}: {drink_price:.2f}"`. The first colon in
this line, after `{drink}`, is ordinary text. Keep it, and keep the
space after it.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: label-not-started
:check: label-fixed
:expect: The cell has not run yet
```

````{attempt}
:id: label-unchanged
:check: label-fixed
:expect: The price has only one digit after the decimal point

```{cell-insert}
:path: {{ notebook }}
:run: true
drink = "tea"
drink_price = 1.5
price_label = f"{drink}: {drink_price}"
print(price_label)
```
````

````{attempt}
:id: label-no-f
:check: label-fixed
:expect: The letter f before the first quote is missing

```{cell-insert}
:path: {{ notebook }}
:run: true
drink = "tea"
drink_price = 1.5
price_label = "{drink}: {drink_price:.2f}"
print(price_label)
```
````

````{attempt}
:id: label-no-space
:check: label-fixed
:expect: but it must refer to the string tea: 1.50

```{cell-insert}
:path: {{ notebook }}
:run: true
drink = "tea"
drink_price = 1.5
price_label = f"{drink}:{drink_price:.2f}"
print(price_label)
```
````

````{hint}
:title: Show me a solution
:unlock: "label-fixed" in failed_checks or "label-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-label-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [label-solution]
:run: true
drink = "tea"
drink_price = 1.5
price_label = f"{drink}: {drink_price:.2f}"
print(price_label)
```
````

```{verify}
:id: label-fixed
:label: The label shows the price with two decimal places
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed label; cell-executed label-solution
if "price_label" not in globals():
    print("The cell has not run yet. Change the third line of the new cell. Then hold Shift and press Enter to run the cell.")
elif price_label == "tea: 1.50":
    print("Correct. The name price_label refers to the string tea: 1.50, with two digits after the decimal point.")
elif price_label == "tea: 1.5":
    print("The name price_label refers to the string tea: 1.5. The price has only one digit after the decimal point. Add :.2f after the name drink_price, inside the braces. Then run the cell again.")
elif isinstance(price_label, str) and "{" in price_label:
    print("The name price_label refers to a string that still contains braces. The letter f before the first quote is missing, so Python did not fill the places. Write the letter f directly before the first quote. Then run the cell again.")
else:
    print("The name price_label refers to", f"[{price_label}]", "but it must refer to the string tea: 1.50. The square brackets show where the value begins and ends. The third line must be an f-string that holds {drink}, then a colon and a space, then {drink_price:.2f}. Then run the cell again.")
"price_label" in globals() and price_label == "tea: 1.50"
```
