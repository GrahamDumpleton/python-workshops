---
title: Text into numbers
requires: [verify:fields-split, quiz:predict-text-plus, verify:amount-number, verify:spending-total]
---

# Text into numbers

Everything that a program reads from a file is a string. A file holds
text, so Python gives you text. The amount `6.40` in the file is not
a number for Python. It is a string of four characters: `6`, a point,
`4` and `0`.

This matters because Python does different things with strings and
with numbers. With numbers, `+` adds. With strings, `+` joins the two
strings into one longer string. To add up the amounts of Mariam, your
code must first turn each string into a number.

Think of a price that is written on a piece of paper. You can read it,
but you cannot calculate with the paper. You must first type the
number into a calculator.

## The parts of one line

First, the code must get the amount from the line. The method
`split(",")` of a string divides the string at each comma, and gives a
list of the parts. The workshops call each part of a line a **field**.

```{attempt}
:id: fields-not-split
:check: fields-split
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-fields
:title: Add a cell that divides one line into its fields, and run it
:path: {{ notebook }}
:tags: [fields]
:run: true
one_line = "2026-01-03,Bread and milk,6.40,food"
one_fields = one_line.split(",")
amount_text = one_fields[2]

print(one_fields)
print(amount_text)
```

The output is:

```
['2026-01-03', 'Bread and milk', '6.40', 'food']
6.40
```

```{verify}
:id: fields-split
:label: The cell divided the line into four fields
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed fields
if globals().get("amount_text") == "6.40" and globals().get("one_fields") == ["2026-01-03", "Bread and milk", "6.40", "food"]:
    print("The cell ran. The name amount_text refers to the string 6.40, which is the third field of the line.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("amount_text") == "6.40" and globals().get("one_fields") == ["2026-01-03", "Bread and milk", "6.40", "food"]
```

The list has four items, and every item is a string. The quotes in the
output show that. The amount is the third field, so its index is 2,
because the first index is 0. The name `amount_text` now refers to the
string `"6.40"`.

## Predict the result

Mariam bought bread and milk two times. The next cell tries to add the
amount to itself:

```python
print(amount_text + amount_text)
```

```{quiz}
:id: predict-text-plus
:type: text
:title: Predict the output
question: "The name `amount_text` refers to the string `\"6.40\"`. What does `print(amount_text + amount_text)` show?"
answer: "6.406.40"
wrong:
  - { text: "12.8", explanation: "That is the result for two numbers. But `amount_text` refers to a string, and `+` joins two strings into one longer string." }
  - { text: "12.80", explanation: "That is the result for two numbers. But `amount_text` refers to a string, and `+` joins two strings into one longer string." }
  - { text: "12,8", explanation: "`amount_text` refers to a string, and `+` joins two strings into one longer string. Python does not add them as numbers." }
  - { text: "6.40 6.40", explanation: "Nearly. `+` joins two strings with nothing between them, so the output has no space." }
  - { text: "'6.406.40'", explanation: "The text is right. `print()` shows a string without quotes, so type it without the quotes." }
  - { text: "\"6.406.40\"", explanation: "The text is right. `print()` shows a string without quotes, so type it without the quotes." }
otherwise: "The name `amount_text` refers to a string, and not to a number. Think about what `+` does with two strings, such as `\"ab\" + \"cd\"`."
explanation: "With two strings, `+` joins them into one longer string. So the result is `6.406.40`, which is not an amount at all. Python gives no error message here, because joining strings is correct code. The result is wrong only for the person who wanted a sum."
```

## From a string to a number

Two functions turn a string into a number.

- `float()` takes a string, and gives back a float, which is a number
  with a decimal point. `float("6.40")` gives the number `6.4`.

- `int()` takes a string, and gives back an integer, which is a whole
  number. `int("37")` gives the number `37`.

Both functions give back a new value. The string itself does not
change.

```{attempt}
:id: amount-not-number
:check: amount-number
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-amount
:title: Add a cell that turns the strings into numbers, and run it
:path: {{ notebook }}
:tags: [amount]
:run: true
print(amount_text + amount_text)

amount_number = float(amount_text)
print(amount_number + amount_number)

count_text = "37"
count_number = int(count_text)
print(count_number + 1)
```

The output is:

```
6.406.40
12.8
38
```

```{verify}
:id: amount-number
:label: The cell turned the strings into numbers
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed amount
if globals().get("amount_number") == 6.4 and globals().get("count_number") == 37:
    print("The cell ran. The name amount_number refers to the float 6.4, and the name count_number refers to the integer 37.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("amount_number") == 6.4 and globals().get("count_number") == 37
```

## What happened

- The first line of output is the two strings joined, as you
  predicted.

- `float(amount_text)` made the number `6.4` from the string `"6.40"`.
  With two numbers, `+` adds, so the second line of output is `12.8`.
  Python shows a float without a zero at the end. To show an amount
  with two digits after the point, use an f-string:
  `f"{amount_number:.2f}"` gives `6.40`.

- `int(count_text)` made the number `37` from the string `"37"`, so
  the third line of output is `38`.

`float()` and `int()` work only when the string looks like a number.
`float("amount")` cannot give a number, so Python stops with an error
of the type `ValueError`. The workshop **When the data is wrong**
shows what a program can do about that.

## Your task

Now add up everything that Mariam spent.

Write a cell that does these things:

1. It reads the file `spending.csv`, one line at a time.

2. For each line that holds a purchase, it takes the amount, which is
   the third field, turns it into a float, and adds it to a total.
   The total has the name `spending_total`, and it starts at `0`.

3. After the loop, it shows the total with two digits after the
   point: `print(f"{spending_total:.2f}")`.

Be careful with the first line of the file. It holds no purchase. Its
third field is the word `amount`, and `float("amount")` stops with a
`ValueError`. Your code must not call `float()` for that line.

For example, for a file that holds only these three lines, the total
is `9.20`:

```
date,description,amount,category
2026-01-03,Bread and milk,6.40,food
2026-01-05,Bus ticket,2.80,transport
```

When your code is correct, the output under the cell is:

```
2834.79
```

The action below adds a new cell for your code.

```{cell-insert}
:id: insert-spending-total
:title: Add a cell for my code
:path: {{ notebook }}
:tags: [spending-total]
:run: false
# Write your code on the lines below this one.

```

Click on the empty line under the comment, and type your code. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: what to look at
You need three things that you already know.

- The loop over the lines of a file, from the page before:
  `with open("spending.csv") as file:` and then `for line in file:`.

- The fields of one line: `fields = line.strip().split(",")`. The
  amount is `fields[2]`.

- The pattern that adds up a total: the total starts at `0` before the
  loop, and a line inside the loop adds to it:
  `spending_total = spending_total + float(fields[2])`.
```

```{hint}
:title: Hint: the first line of the file
There are two ways to skip the first line of the file. Choose
one.

- Test the field with an `if` inside the loop. The third field of the
  first line is the string `"amount"`, so add to the total only when
  the field is different: `if fields[2] != "amount":`. The line that
  adds to the total goes under the `if`, with four more spaces.

- Or use the list `spending_lines` from the page before, which holds
  every line. The slice `spending_lines[1:]` gives all the items
  except the first one, so you can write
  `for line in spending_lines[1:]:` and you do not need to open the
  file again.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first. It names the type of
the error.

A `ValueError` means that `float()` received a string that does not
look like a number. Your code probably called `float()` for the first
line of the file. Read the hint about the first line of the file.

A `TypeError` means that your code tried to add a string to a number.
Use `float()` on the field before you add it to the total.

An `IndentationError` means that the spaces at the start of a line are
wrong. Each block starts with four more spaces than the line above
it.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: spending-total-not-started
:check: spending-total
:expect: The name spending_total does not exist yet
```

````{attempt}
:id: spending-total-string
:check: spending-total
:expect: refers to a string

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_total = ""
with open("spending.csv") as file:
    for line in file:
        fields = line.strip().split(",")
        if fields[2] != "amount":
            spending_total = spending_total + fields[2]
print(spending_total[:12])
```
````

````{attempt}
:id: spending-total-zero
:check: spending-total
:expect: is still 0

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_total = 0
with open("spending.csv") as file:
    for line in file:
        fields = line.strip().split(",")
        if fields[2] == "amount":
            spending_total = spending_total + 0
print(f"{spending_total:.2f}")
```
````

````{attempt}
:id: spending-total-last
:check: spending-total
:expect: That is the amount of the last purchase only

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_total = 0
with open("spending.csv") as file:
    for line in file:
        fields = line.strip().split(",")
        if fields[2] != "amount":
            spending_total = float(fields[2])
print(f"{spending_total:.2f}")
```
````

````{attempt}
:id: spending-total-first-missing
:check: spending-total
:expect: The difference is 650.00

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_total = 0
for line in spending_lines[2:]:
    fields = line.split(",")
    spending_total = spending_total + float(fields[2])
print(f"{spending_total:.2f}")
```
````

````{attempt}
:id: spending-total-other
:check: spending-total
:expect: but the total of the 37 purchases is 2834.79

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_total = 0
with open("spending.csv") as file:
    for line in file:
        fields = line.strip().split(",")
        if fields[3] == "food":
            spending_total = spending_total + float(fields[2])
print(f"{spending_total:.2f}")
```
````

````{attempt}
:id: spending-total-other-way
:check: spending-total
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_total = 0
for line in spending_lines[1:]:
    fields = line.split(",")
    spending_total = spending_total + float(fields[2])
print(f"{spending_total:.2f}")
```
````

````{hint}
:title: Show me a solution
:unlock: "spending-total" in failed_checks or "spending-total" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-spending-total-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [spending-total-solution]
:run: true
spending_total = 0
with open("spending.csv") as file:
    for line in file:
        fields = line.strip().split(",")
        if fields[2] != "amount":
            spending_total = spending_total + float(fields[2])

print(f"{spending_total:.2f}")
```
````

```{verify}
:id: spending-total
:label: The name spending_total refers to the total of all the purchases
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed spending-total; cell-executed spending-total-solution
def _workshop_check():
    if "spending_total" not in globals():
        print("The name spending_total does not exist yet. Write your code under the comment in the new cell. If the cell shows an error message, the hint about error messages on this page says what each type of error means. Then hold Shift and press Enter to run the cell.")
        return False
    value = globals()["spending_total"]
    if isinstance(value, str):
        print("The name spending_total refers to a string, but it must refer to a number. The total must start at 0, with no quotes, and each amount must go through float() before it is added: spending_total = spending_total + float(fields[2]). Then run the cell again.")
        return False
    try:
        number = round(float(value), 2)
    except (TypeError, ValueError):
        print(f"The name spending_total refers to a value of the type {type(value).__name__}, but it must refer to a number. Start with spending_total = 0, and add float(fields[2]) to it for each purchase. Then run the cell again.")
        return False
    if number == 2834.79:
        print("Correct. Mariam spent 2834.79 in the three months, and your code found that total by reading the file.")
        return True
    if number == 0:
        print("The name spending_total is still 0, so the loop added nothing to it. The line that adds to the total must be inside the for loop, and it must run for every line that holds a purchase. Then run the cell again.")
        return False
    if number == 49.9:
        print("The name spending_total refers to 49.90. That is the amount of the last purchase only. The line inside the loop must add the amount to the total, and not replace the total: spending_total = spending_total + float(fields[2]). Then run the cell again.")
        return False
    if number == 2184.79:
        print("The name spending_total refers to 2184.79, but the total of the 37 purchases is 2834.79. The difference is 650.00, which is the amount of the first purchase, the rent for January. Your code skips two lines, but it must skip only the first line of the file. Then run the cell again.")
        return False
    print(f"The name spending_total refers to {number:.2f}, but the total of the 37 purchases is 2834.79. The code must add the third field of every line except the first line of the file. The third field has the index 2. Then run the cell again.")
    return False
globals().pop("_workshop_check")()
```

Your code read 37 purchases from a file and added them up. If Mariam
adds a purchase to the file, the same code gives the new total. The
code does not change when the data changes. That is the reason to keep
data in a file.
