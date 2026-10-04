---
title: Amounts are numbers
requires: [verify:amounts-shown, verify:transport-amounts-made, verify:float-total, verify:small-sum-shown]
---

# Amounts are numbers

Three fields of a row are text, and stay text. The amount is
different. Mariam wants to add the amounts, and Python cannot add
strings as numbers. Everything that a program reads from a file is a
string, so the amount `6.40` arrives as the string `"6.40"`.

The function `float()` turns a string into a number. The number that
it gives is a **float**, which is a number that has a decimal point.
The workshop **Reading and writing files** used `float()` in the same
way.

Click the action below. It adds a cell that adds two amounts as
strings, and then as floats, and runs it.

```{attempt}
:id: amounts-not-shown
:check: amounts-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-amounts
:title: Add a cell that turns strings into floats, and run it
:path: {{ notebook }}
:tags: [amounts]
:run: true
first_amount = "6.40"
second_amount = "11.25"
print(first_amount + second_amount)
print(float(first_amount) + float(second_amount))
print(float("650"))
print(float(" 18.00"))
```

The output is:

```
6.4011.25
17.65
650.0
18.0
```

```{verify}
:id: amounts-shown
:label: The cell turned strings into floats
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed amounts
if globals().get("first_amount") == "6.40" and globals().get("second_amount") == "11.25":
    print("The cell ran. With +, two strings are joined, and two floats are added.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("first_amount") == "6.40" and globals().get("second_amount") == "11.25"
```

## What happened

- With two strings, `+` joins the text: `6.4011.25`. That is not a
  sum.

- With two floats, `+` adds the numbers: `17.65`.

- `float()` reads the different ways in which Mariam wrote an amount.
  `"650"` and `"650.00"` both give the float `650.0`.

- `float()` ignores spaces at the start and at the end of the string,
  so `" 18.00"` gives `18.0`. Your code strips every field in any
  case, so that all fields are handled in the same way.

## Your task

Add up what Mariam paid for transport. The action below adds a cell
with the seven amounts for transport, as the strings that are in the
file.

```{attempt}
:id: transport-amounts-not-made
:check: transport-amounts-made
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-transport-amounts
:title: Add a cell with the seven amounts for transport, and run it
:path: {{ notebook }}
:tags: [transport-amounts]
:run: true
transport_amounts = ["2.80", "42.00", "12.40", "42", "42.00", "15.60", "24.50"]
print(len(transport_amounts))
```

```{verify}
:id: transport-amounts-made
:label: The list of amounts for transport exists
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed transport-amounts
if globals().get("transport_amounts") == ["2.80", "42.00", "12.40", "42", "42.00", "15.60", "24.50"]:
    print("The cell ran. The list transport_amounts holds seven amounts, and each amount is a string.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("transport_amounts") == ["2.80", "42.00", "12.40", "42", "42.00", "15.60", "24.50"]
```

Write code that adds up these seven amounts as floats:

- Make a name `float_total` that starts at `0`.

- Use a `for` loop over `transport_amounts`. For each string, turn the
  string into a float with `float()`, and add it to `float_total`.

- After the loop, the last line of the cell is `print(float_total)`.

If you add the seven amounts on paper, the total is `181.30`. The
number that your cell shows is a little different from `181.30`. This
is not a mistake in your code. The page explains it after the task.

```{cell-insert}
:id: insert-float-total
:title: Add a cell for my code
:path: {{ notebook }}
:tags: [float-total]
:run: false
# Write the code that adds up transport_amounts below this line.

```

Click on the empty line under the comment, and type your code. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: the pattern
This is the pattern for adding up a total, from the workshop **Doing
it again**: a name that starts at `0`, and a loop that adds each value
to it.

The first line is `float_total = 0`. The second line is
`for text in transport_amounts:`.
```

```{hint}
:title: Hint: the line inside the loop
Inside the loop, the name `text` refers to one string, such as
`"2.80"`. Turn it into a float, and add it to the total:

`float_total = float_total + float(text)`

This line begins with four spaces. The line `print(float_total)` comes
after the loop, and begins with no spaces.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: float-total-not-started
:check: float-total
:expect: The name float_total does not exist yet
```

````{attempt}
:id: float-total-string
:check: float-total
:expect: is a string, and not a number

```{cell-insert}
:path: {{ notebook }}
:run: true
float_total = ""
for text in transport_amounts:
    float_total = float_total + text
print(float_total)
```
````

````{attempt}
:id: float-total-zero
:check: float-total
:expect: is still 0

```{cell-insert}
:path: {{ notebook }}
:run: true
float_total = 0
for text in transport_amounts:
    float(text)
print(float_total)
```
````

````{attempt}
:id: float-total-last-only
:check: float-total
:expect: That is the last amount of the list only

```{cell-insert}
:path: {{ notebook }}
:run: true
float_total = 0
for text in transport_amounts:
    float_total = float(text)
print(float_total)
```
````

````{attempt}
:id: float-total-other
:check: float-total
:expect: but the seven amounts add up to 181.30

```{cell-insert}
:path: {{ notebook }}
:run: true
float_total = 0
for text in transport_amounts[1:]:
    float_total = float_total + float(text)
print(float_total)
```
````

````{attempt}
:id: float-total-by-index
:check: float-total
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
float_total = 0.0
for i in range(len(transport_amounts)):
    float_total += float(transport_amounts[i])
print(float_total)
```
````

````{hint}
:title: Show me a solution
:unlock: "float-total" in failed_checks or "float-total" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-float-total-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [float-total-solution]
:run: true
float_total = 0
for text in transport_amounts:
    float_total = float_total + float(text)

print(float_total)
```
````

```{verify}
:id: float-total
:label: Your code adds up the seven amounts as floats
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed float-total; cell-executed float-total-solution
def _workshop_check():
    if "float_total" not in globals():
        print("The name float_total does not exist yet. Write your code under the comment in the new cell, and check the spelling of the name. Then hold Shift and press Enter to run the cell.")
        return False
    value = globals()["float_total"]
    if isinstance(value, str):
        print(f"float_total is {value!r}. That is a string, and not a number. With strings, + joins the text. Start with float_total = 0, and turn each string into a number with float() before you add it. Then run the cell again.")
        return False
    if isinstance(value, bool):
        print(f"float_total is {value!r} but it must be a number. Start with float_total = 0, and add float(text) to it inside the loop. Then run the cell again.")
        return False
    try:
        number = round(float(value), 2)
    except Exception:
        print(f"float_total is {value!r} but it must be a number. Start with float_total = 0, and add float(text) to it inside the loop. Then run the cell again.")
        return False
    if number == 181.3:
        print(f"Correct. float_total is {value!r}, which is the sum of the seven floats. It is very close to 181.30, but it is not exactly 181.30.")
        return True
    if number == 0:
        print("float_total is still 0. The loop must change it. Inside the loop, give the name a new value each time: float_total = float_total + float(text). Then run the cell again.")
        return False
    if number == 24.5:
        print("float_total is 24.5. That is the last amount of the list only. Inside the loop, add each amount to the old total: float_total = float_total + float(text). Then run the cell again.")
        return False
    print(f"float_total is {value!r} but the seven amounts add up to 181.30. Start with float_total = 0, loop over every string of transport_amounts, and add float(text) one time for each string. Then run the cell again.")
    return False
globals().pop("_workshop_check")()
```

## A total that is not exact

Your cell shows this:

```
181.29999999999998
```

The correct total is `181.30`. Python's answer is wrong by a very
small amount.

You saw this before, in the workshop **Talking to Python**. A
computer keeps a float in a form that cannot hold most numbers with a
decimal point exactly. It keeps the nearest number that it can hold.
The number is very close, but it is not the same. When a program
adds many floats, the small differences add up, and they become
visible. The shortest example is this one:

```{attempt}
:id: small-sum-not-shown
:check: small-sum-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-small-sum
:title: Add a cell that adds 0.1 and 0.2 as floats, and run it
:path: {{ notebook }}
:tags: [small-sum]
:run: true
small_sum = 0.1 + 0.2
print(small_sum)
print(small_sum == 0.3)
```

The output is:

```
0.30000000000000004
False
```

```{verify}
:id: small-sum-shown
:label: The cell added 0.1 and 0.2 as floats
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed small-sum
if globals().get("small_sum") == 0.1 + 0.2:
    print("The cell ran. As floats, 0.1 + 0.2 is not exactly 0.3.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("small_sum") == 0.1 + 0.2
```

For many uses, a float is exact enough. A distance of
`181.29999999999998` kilometres is the same distance as `181.3`
kilometres for every traveller.

Money is different. People expect a total of money to be exact.
`0.1 + 0.2 == 0.3` is `False` with floats, so a program that compares
a total with a budget can give the wrong answer. A bank statement
that is wrong by a very small amount is still wrong.

So a program does not add money as floats. The next page shows what
it uses.
