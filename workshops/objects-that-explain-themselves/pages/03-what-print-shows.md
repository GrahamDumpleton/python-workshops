---
title: What print() shows for an object
requires: [verify:default-text-ran, verify:default-list-ran]
---

# What print() shows for an object

When you print a number, a string or a list, Python shows the value
itself. You have used this in every workshop: you print a value to
see what your program made.

What does Python show for an object of your class? You have not told
Python what to show, so Python uses a text of its own. Click the
action below. It adds a cell that prints the object `bread`.

```{attempt}
:id: default-text-not-run
:check: default-text-ran
:expect: The cell has not run yet. Click the action above
```

```{cell-insert}
:id: insert-default-text
:title: Add a cell that prints the object bread, and run it
:path: {{ notebook }}
:tags: [default-text]
:run: true
print(bread)
```

```{verify}
:id: default-text-ran
:label: The cell that prints the object bread has run
:substrate: contents
:trigger: cell-executed default-text
:message: The cell has not run yet. Click the action above to add the cell and run it.
cell-executed {{ notebook }} default-text
```

The output looks like this:

```
<__main__.Purchase object at 0x...>
```

Your notebook shows a long number that begins with `0x` in the
place where this page shows `0x...`. The number is different each time the code
runs, so your number is not the number of another learner.

Read the text part by part.

- `__main__` is the name that Python gives to the place where the
  code of your notebook runs.

- `Purchase` is the name of the class.

- `object` says that this value is an object of that class.

- The number after `at` says where the computer keeps the object in
  its memory.

So the text says: "this is an object of the class `Purchase`". It
does not say which purchase. The date, the description, the amount
and the category are all missing.

## Why this text is no help

Think of boxes in a storeroom. A box with no label tells you only
that it is a box. To know what is inside, you must open it. A box
with a label that lists what is inside tells you at once.

An object of your class is now a box with no label. The problem
grows when you have many objects. Click the action below. It adds a
cell that makes a second purchase, and prints a list of the two
purchases.

```{attempt}
:id: default-list-not-run
:check: default-list-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-default-list
:title: Add a cell that prints a list of two purchases, and run it
:path: {{ notebook }}
:tags: [default-list]
:run: true
bus_ticket = Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport")
two_purchases = [bread, bus_ticket]
print(two_purchases)
```

```{verify}
:id: default-list-ran
:label: The cell printed a list of two purchases
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed default-list
if isinstance(globals().get("two_purchases"), list) and getattr(globals().get("bus_ticket"), "description", None) == "Bus ticket":
    print("The cell ran. The list two_purchases holds two objects of the class Purchase.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("two_purchases"), list) and getattr(globals().get("bus_ticket"), "description", None) == "Bus ticket"
```

The output looks like this, with two different numbers:

```
[<__main__.Purchase object at 0x...>, <__main__.Purchase object at 0x...>]
```

The list holds bread and a bus ticket, but you cannot see which
object is which. When a program gives a wrong result, you print its
values to find the mistake. With this text, printing does not help
you.

You can print each attribute, as the last page did with
`print(bread.description)`. But then you must write one line for
each attribute, every time, for every object.

It is better to say one time, inside the class, what text describes
an object. The next page shows how.
