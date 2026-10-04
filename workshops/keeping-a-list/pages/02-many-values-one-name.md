---
title: Many values under one name
requires: [verify:temperatures-ran, verify:cities-ran, quiz:which-is-a-list]
---

# Many values under one name

Imagine a program that works with the temperature at midday on each
day of one week. With what you know now, the program needs seven
names: `temperature_1`, `temperature_2`, and so on to
`temperature_7`. For a whole year it needs 365 names. Nobody can
write a program in that way.

Python has a kind of value that solves this problem. A **list** is
one value that holds many values, in a fixed order. Each value in a
list is called an **item**. You give the whole list one name, and the
list remembers every item and the order of the items.

A shopping list on paper is a good comparison. It is one piece of
paper, it holds many things, and the things are written in an order,
one after another.

## Creating a list

To create a list, write the items between square brackets, `[` and
`]`, with a comma between the items:

```python
temperatures = [18, 21, 19, 23, 20]
```

This line is an assignment, like every assignment that you have
written before. The value on the right side is a list of five items.
The name `temperatures` refers to the whole list.

Click the action below. It adds a cell that creates this list and
shows it with `print()`.

```{attempt}
:id: temperatures-not-run
:check: temperatures-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-temperatures
:title: Add a cell that creates a list of five temperatures, and run it
:path: {{ notebook }}
:tags: [temperatures]
:run: true
temperatures = [18, 21, 19, 23, 20]
print(temperatures)
```

The output is `[18, 21, 19, 23, 20]`. Python shows a list in the same
way as you write it: with square brackets and commas. The items are
in the same order as in your code. A list never changes the order of
its items by itself.

```{verify}
:id: temperatures-ran
:label: The name temperatures refers to a list of five items
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed temperatures
if globals().get("temperatures") == [18, 21, 19, 23, 20]:
    print("The cell ran. The name temperatures refers to a list of five items.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("temperatures") == [18, 21, 19, 23, 20]
```

## A list of strings

The items of a list can be any values. This list holds three strings.
A string is a piece of text between quotes.

```{attempt}
:id: cities-not-run
:check: cities-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-cities
:title: Add a cell that creates a list of three strings, and run it
:path: {{ notebook }}
:tags: [cities]
:run: true
cities = ["Lagos", "Osaka", "Lima"]
print(cities)
```

The output is `['Lagos', 'Osaka', 'Lima']`. When Python shows a list,
it shows each string with quotes, so that you can see where each item
starts and ends. Python uses the single quote `'` here. The single
quote and the double quote `"` mean the same thing, so the items are
the same strings that you wrote.

```{verify}
:id: cities-ran
:label: The name cities refers to a list of three strings
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed cities
if globals().get("cities") == ["Lagos", "Osaka", "Lima"]:
    print("The cell ran. The name cities refers to a list of three strings.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("cities") == ["Lagos", "Osaka", "Lima"]
```

```{quiz}
:id: which-is-a-list
:title: Writing a list
question: Which line creates a list of three items?
options:
  - { text: "`sizes = 36, 38, 40`", explanation: "A list needs square brackets round the items: `[36, 38, 40]`." }
  - { text: "`sizes = (36 38 40)`", explanation: "A list needs square brackets, not parentheses, and a comma between the items: `[36, 38, 40]`." }
  - { text: "`sizes = [36, 38, 40]`", correct: true }
explanation: "A list is written with square brackets round the items, and a comma between the items."
```
