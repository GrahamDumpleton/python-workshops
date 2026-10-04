---
title: Values that belong together
requires: [verify:birthday-ran, quiz:predict-index, verify:index-ran, verify:reading]
---

# Values that belong together

Some values belong together. A date is a year, a month and a day. A
measurement is a place and a temperature. Each part alone says little.
The parts are useful only as a group.

A **tuple** is a value that holds a fixed group of values in order.
You make the tuple once, with all of its values, and after that the
group stays as it is. Each value in a tuple is called an **item**, the
same word as for a list.

A list is for values of the same kind, where the number of values can
grow: all the prices, all the guests. A tuple is for a small group
where each position has its own meaning: the first item is the year,
the second item is the month, the third item is the day.

Think of a date that is printed on a ticket. The date has three
parts, and nobody adds a fourth part or removes one. The three parts
together are one piece of information.

## Creating a tuple

To create a tuple, write the items with a comma between them, and put
parentheses, `(` and `)`, around the group. A list uses square
brackets. A tuple uses parentheses.

Click the action below. It adds a cell that creates a tuple of three
integers and runs it. The tuple is the date 1998-07-23.

```{attempt}
:id: birthday-not-run
:check: birthday-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-birthday
:title: Add a cell that creates a tuple of three items, and run it
:path: {{ notebook }}
:tags: [birthday]
:run: true
birthday = (1998, 7, 23)
print(birthday)
print(len(birthday))
```

The output is:

```
(1998, 7, 23)
3
```

```{verify}
:id: birthday-ran
:label: The name birthday refers to a tuple of three items
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed birthday
if globals().get("birthday") == (1998, 7, 23):
    print("The cell ran. The name birthday refers to a tuple of three items.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("birthday") == (1998, 7, 23)
```

## What happened

1. `birthday = (1998, 7, 23)` is an assignment. The value on the right
   side is a tuple of three items. The name `birthday` refers to the
   whole tuple.

2. `print(birthday)` shows the tuple. Python shows a tuple in the same
   way as you write it, with parentheses and commas.

3. `print(len(birthday))` shows `3`. The function `len()` counts the
   items of a tuple, in the same way as it counts the items of a list.

## One item of a tuple

You read one item of a tuple in the same way as one item of a list.
Write the name, and then the **index** in square brackets. The index
is the position of the item, and Python counts from `0`. So the first
item has the index `0`.

Look at this cell. Do not run it yet.

```python
print(birthday[1])
```

```{quiz}
:id: predict-index
:type: text
:title: Predict the output
question: "The name `birthday` refers to the tuple `(1998, 7, 23)`. What does `print(birthday[1])` show?"
answer: "7"
wrong:
  - { text: "1998", explanation: "`1998` is the first item, and the first item has the index `0`. Python counts from `0`, so the index `1` is the second item." }
  - { text: "23", explanation: "`23` is the third item, which has the index `2`. Python counts from `0`, so the index `1` is the second item." }
  - { text: "(7)", explanation: "The index gives one item, not a tuple. The item is the integer `7`, so the output has no parentheses." }
otherwise: "Count the items of the tuple from `0`: the item at index `0` is `1998`. Which item is at index `1`?"
explanation: "Python counts from `0`. The item at index `0` is `1998`, and the item at index `1` is `7`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: index-not-run
:check: index-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-index
:title: Add a cell that reads one item of the tuple, and run it
:path: {{ notebook }}
:tags: [index]
:run: true
birth_month = birthday[1]
print(birth_month)
```

The output is `7`. The cell also gives the item a name, `birth_month`,
so that the next lines of a program can use it.

```{verify}
:id: index-ran
:label: The name birth_month refers to the second item of the tuple
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed index
if globals().get("birth_month") == 7:
    print("The cell ran. The name birth_month refers to 7, which is the item at index 1.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("birth_month") == 7
```

The items of a tuple can be values of different types. A tuple often
holds a string and a number that belong together.

## Your task

A weather station in the city of Osaka measures 14 degrees Celsius.
Keep the city and the temperature together in a tuple.

Your program must do these three things, in this order:

1. Give the name `reading` to a tuple of two items. The first item is
   the string `"Osaka"`. The second item is the integer `14`.

2. Give the name `reading_city` to the first item of the tuple. Use
   the name `reading` and an index.

3. Show the value of `reading_city` with `print()`.

When the program is correct, the output under the cell is:

```
Osaka
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-reading
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [reading]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Look at the cell that creates the tuple `birthday`. Your first line
has the same form. The name is `reading`, and the tuple has two items
between the parentheses, with a comma between them. The string needs
quotation marks.
```

```{hint}
:title: Hint: the first item
The first item of a tuple has the index `0`. The second line of your
program is `reading_city = reading[0]`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: reading-not-started
:check: reading
:expect: The name reading does not exist yet
```

````{attempt}
:id: reading-a-list
:check: reading
:expect: The name reading refers to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
reading = ["Osaka", 14]
```
````

````{attempt}
:id: reading-one-value
:check: reading
:expect: is not a tuple

```{cell-insert}
:path: {{ notebook }}
:run: true
reading = "Osaka"
```
````

````{attempt}
:id: reading-wrong-items
:check: reading
:expect: but it must refer to the tuple ('Osaka', 14)

```{cell-insert}
:path: {{ notebook }}
:run: true
reading = (14, "Osaka")
```
````

````{attempt}
:id: reading-no-city
:check: reading
:expect: The name reading_city does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
reading = ("Osaka", 14)
```
````

````{attempt}
:id: reading-wrong-index
:check: reading
:expect: That is the second item of the tuple

```{cell-insert}
:path: {{ notebook }}
:run: true
reading = ("Osaka", 14)
reading_city = reading[1]
print(reading_city)
```
````

````{attempt}
:id: reading-whole-tuple
:check: reading
:expect: but it must refer to the string 'Osaka'

```{cell-insert}
:path: {{ notebook }}
:run: true
reading = ("Osaka", 14)
reading_city = reading
print(reading_city)
```
````

````{hint}
:title: Show me a solution
:unlock: "reading" in failed_checks or "reading" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-reading-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [reading-solution]
:run: true
reading = ("Osaka", 14)
reading_city = reading[0]
print(reading_city)
```
````

```{verify}
:id: reading
:label: Your tuple holds the city and the temperature
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed reading; cell-executed reading-solution
if "reading" not in globals():
    print("The name reading does not exist yet. Write your program under the comment in the new cell, and begin with the line that creates the tuple. Check the spelling of the name. Then hold Shift and press Enter to run the cell.")
elif isinstance(reading, list):
    print("The name reading refers to a list, because the items are between square brackets. A tuple uses parentheses. Change the square brackets to ( and ). Then run the cell again.")
elif not isinstance(reading, tuple):
    print(f"The name reading refers to {reading!r}, which is not a tuple. A tuple has the items between parentheses, with a comma between them. Write two items: the string \"Osaka\" and the integer 14. Then run the cell again.")
elif reading != ("Osaka", 14):
    print(f"The name reading refers to {reading!r} but it must refer to the tuple ('Osaka', 14). The first item is the string \"Osaka\", with a capital O and quotation marks. The second item is the integer 14, without quotation marks. Then run the cell again.")
elif "reading_city" not in globals():
    print("The tuple is correct. The name reading_city does not exist yet. Add a line that gives this name to the first item of the tuple. Check the spelling. Then run the cell again.")
elif reading_city == "Osaka":
    print("Correct. The name reading refers to the tuple ('Osaka', 14), and the name reading_city refers to its first item.")
elif reading_city == 14:
    print("The name reading_city refers to 14. That is the second item of the tuple, at index 1. Python counts from 0, so the first item is reading[0]. Then run the cell again.")
else:
    print(f"The name reading_city refers to {reading_city!r} but it must refer to the string 'Osaka'. Use the name of the tuple and the index of the first item: reading_city = reading[0]. Then run the cell again.")
"reading" in globals() and "reading_city" in globals() and isinstance(reading, tuple) and reading == ("Osaka", 14) and reading_city == "Osaka"
```
