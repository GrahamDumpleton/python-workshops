---
title: Text is a string
requires: [verify:city-ran, quiz:which-is-a-string, verify:town-changed]
---

# Text is a string

A piece of text in a program is called a **string**. A string is a
value, in the same way that a number is a value. The word comes from
the idea of beads on a thread: a string is a row of characters, one
after another. A **character** is one letter, one digit, one space or
one symbol.

Programs need strings all the time. A receipt shows the name of each
item. A message greets a person by name. A calculation with numbers
alone cannot do these things.

## Quotes show where a string begins and ends

To write a string, put the text between two quotes:

```python
"Nairobi"
```

The quotes are important. Without them, Python reads a word as a
name, and it looks for the value that the name refers to. With the
quotes, Python knows that the characters are text, and it keeps them
exactly as you wrote them.

A label on a jar is a good comparison. The word "sugar" on the label
is only a word. It is not the sugar. In the same way, `"Nairobi"` in
your code is only text. Python does not try to understand it.

A **name** is a word that you choose, which refers to a value. A name
can refer to a string, in the same way that it can refer to a number.
A line such as `city = "Nairobi"` is an **assignment**: it makes the
name on the left refer to the value on the right.

`print()` is a **function**: a piece of code that someone has already
written and given a name. It shows the value between its parentheses
under the cell.

Click the action below. It adds a cell with two lines, and runs it.

```{attempt}
:id: city-not-run
:check: city-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-city
:title: Add a cell that gives the name city to a string, and run it
:path: {{ notebook }}
:tags: [city]
:run: true
city = "Nairobi"
print(city)
```

## What happened

1. `city = "Nairobi"` makes the name `city` refer to the string
   `"Nairobi"`.

2. `print(city)` shows the string. The output is `Nairobi`, without
   the quotes. The quotes are not part of the string. They only show
   Python where the string begins and where it ends.

```{verify}
:id: city-ran
:label: The name city refers to a string
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed city
if globals().get("city") == "Nairobi":
    print("The cell ran. The name city refers to the string Nairobi.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("city") == "Nairobi"
```

## Two kinds of quotes

Python accepts two kinds of quotes: the double quote `"` and the
single quote `'`. The strings `"Nairobi"` and `'Nairobi'` are the
same string. The quote at the end must be the same kind as the quote
at the beginning.

Two kinds exist for a reason. Sometimes the text itself contains a
quote. The text `Aroha's bag` contains a single quote, so you write
it between double quotes: `"Aroha's bag"`. These workshops use double
quotes.

## Text is different from a number

To a person, `42` and `"42"` look almost the same. To Python, they
are two different kinds of value.

- `42` is a number. Python can calculate with it.

- `"42"` is a string that holds two characters, the digit `4` and
  the digit `2`. To Python, it is text, like `"Nairobi"`. Python does
  not calculate with it.

This difference is useful. A telephone number and the number of a
house are made of digits, but nobody adds them or multiplies them.
A program keeps such values as strings.

```{quiz}
:id: which-is-a-string
:title: Which value is a string?
question: "Which of these values is a string?"
options:
  - { text: "`25`", explanation: "`25` has no quotes. It is a number." }
  - { text: "`\"25\"`", correct: true }
  - { text: "`2.5`", explanation: "`2.5` has no quotes. It is a number." }
  - { text: "`twenty_five`", explanation: "`twenty_five` has no quotes, so Python reads it as a name." }
explanation: "A value between quotes is a string, even when all its characters are digits."
```

## Your task

The action below adds a cell with the name of a town. The action does
not run the cell.

```{cell-insert}
:id: insert-town
:title: Add a cell with the name of a town for me to change
:path: {{ notebook }}
:tags: [town]
:run: false
home_town = "Nairobi"
print(home_town)
```

Change the text between the quotes to the name of the town or city
where you live. Keep the two quotes. Then run the cell: click inside
it, hold `Shift` and press `Enter`. The output must be the name that
you typed.

```{hint}
:title: Hint: what do I change?
Change only the letters between the two quotes in the first line. For
example, a person who lives in Kyoto changes the line to
`home_town = "Kyoto"`. Do not remove the quotes.
```

```{hint}
:title: Hint: I see an error message
The most likely reason is a missing quote. The text must have a
double quote `"` before its first letter and a double quote `"` after
its last letter. Add the missing quote, and run the cell again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: town-not-started
:check: town-changed
:expect: The cell has not run yet
```

````{attempt}
:id: town-unchanged
:check: town-changed
:expect: The name home_town still refers to the string Nairobi

```{cell-insert}
:path: {{ notebook }}
:run: true
home_town = "Nairobi"
print(home_town)
```
````

````{attempt}
:id: town-number
:check: town-changed
:expect: but that value is not a string

```{cell-insert}
:path: {{ notebook }}
:run: true
home_town = 42
print(home_town)
```
````

````{attempt}
:id: town-empty
:check: town-changed
:expect: a string that has no characters

```{cell-insert}
:path: {{ notebook }}
:run: true
home_town = ""
print(home_town)
```
````

````{hint}
:title: Show me a solution
:unlock: "town-changed" in failed_checks or "town-changed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-town-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [town-solution]
:run: true
home_town = "Kyoto"
print(home_town)
```
````

```{verify}
:id: town-changed
:label: The name home_town refers to a string that you wrote
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed town; cell-executed town-solution
if "home_town" not in globals():
    print("The cell has not run yet. Change the text between the quotes in the new cell. Then hold Shift and press Enter to run the cell.")
elif not isinstance(home_town, str):
    print(f"The name home_town refers to {home_town} but that value is not a string. Write the name of your town between two double quotes. Then run the cell again.")
elif home_town == "Nairobi":
    print("The name home_town still refers to the string Nairobi. Change the letters between the quotes to the name of your own town. If you live in Nairobi, write the name of another town that you know. Then run the cell again.")
elif home_town.strip() == "":
    print("The name home_town refers to a string that has no characters, or only spaces. Write the name of your town between the two quotes. Then run the cell again.")
else:
    print(f"Correct. The name home_town now refers to the string {home_town}.")
"home_town" in globals() and isinstance(home_town, str) and home_town != "Nairobi" and home_town.strip() != ""
```
