---
title: Choosing by chance
requires: [verify:rolls-ran, quiz:predict-seed, verify:choice-ran, verify:shuffle-ran, verify:pick-one]
---

# Choosing by chance

The module `random` makes choices by chance. It can give a number
that nobody can predict, choose one item of a list, or put the items
of a list in a new order.

## Why a program needs chance

Some programs must do something different each time. A game throws a
dice. A program for a teacher chooses which student answers next. A
person who checks a long list of purchases cannot check every one, so
a program chooses a few of them by chance.

## The seed

A computer cannot throw a dice. The module `random` calculates its
numbers. It begins from one number, and from that number it calculates
a long series of numbers that look as if chance made them. The number
that it begins from is called the **seed**.

The same seed always gives the same series of numbers. That is useful
when you learn and when you test a program, because you know what the
result must be. The function `random.seed()` sets the seed.

When a program does not set a seed, Python chooses one that is
different each time, and so the results are different each time. In
this workshop, every cell that uses `random` sets a seed first. So
your notebook shows the same results as this page.

## A whole number by chance

`random.randint(1, 6)` gives a whole number from `1` to `6`. Both `1`
and `6` are possible, as they are on a dice.

Click the action below. It adds a cell that sets the seed `7` and then
asks for three numbers, and runs the cell.

```{attempt}
:id: rolls-not-run
:check: rolls-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-rolls
:title: Add a cell that sets a seed and gives three numbers by chance, and run it
:path: {{ notebook }}
:tags: [rolls]
:run: true
import random

random.seed(7)
first_roll = random.randint(1, 6)
second_roll = random.randint(1, 6)
third_roll = random.randint(1, 6)
print(first_roll)
print(second_roll)
print(third_roll)
```

The output is:

```
3
2
4
```

```{verify}
:id: rolls-ran
:label: The cell set a seed and gave three numbers
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed rolls
if [globals().get("first_roll"), globals().get("second_roll"), globals().get("third_roll")] == [3, 2, 4]:
    print("The cell ran. With the seed 7, the three numbers are 3, 2 and 4.")
else:
    print("The cell has not run yet, or it was changed. Click the action above to add the cell and run it.")
[globals().get("first_roll"), globals().get("second_roll"), globals().get("third_roll")] == [3, 2, 4]
```

Each call of `random.randint(1, 6)` gave the next number of the
series, so the three numbers are different from each other.

```{quiz}
:id: predict-seed
:type: text
:title: Predict the first number
question: "You run the same cell a second time. It sets the seed `7` again, and then it asks for three numbers. What is the first number that it shows?"
answer: "3"
wrong:
  - { text: "2", explanation: "`2` was the second number. The line `random.seed(7)` starts the series from its beginning again, so the first number is the same as before." }
  - { text: "4", explanation: "`4` was the third number. The line `random.seed(7)` starts the series from its beginning again, so the first number is the same as before." }
  - { text: "7", explanation: "`7` is the seed. The seed is the number that the series begins from. It is not one of the numbers of the series, and `random.randint(1, 6)` never gives a number larger than `6`." }
otherwise: "The same seed always gives the same series of numbers. Look at the output of the cell."
explanation: "The same seed always gives the same series, so the cell shows `3`, `2` and `4` again. To see this, click on the cell in your notebook, hold `Shift` and press `Enter`."
```

## One item of a list

`random.choice()` takes a list and gives one of its items. Mariam
wants to compare one of her purchases with the receipt from the shop,
and she lets the program choose which one.

```{attempt}
:id: choice-not-run
:check: choice-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-choice
:title: Add a cell that chooses one item of a list, and run it
:path: {{ notebook }}
:tags: [choice]
:run: true
random.seed(9)
purchases = ["Bread and milk", "Bus ticket", "Phone bill", "Vegetables", "Cinema ticket"]
to_compare = random.choice(purchases)
print(to_compare)
```

The output is:

```
Vegetables
```

```{verify}
:id: choice-ran
:label: The cell chose one item of a list
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed choice
if globals().get("to_compare") == "Vegetables":
    print("The cell ran. With the seed 9, random.choice() gave the item Vegetables.")
else:
    print("The cell has not run yet, or it was changed. Click the action above to add the cell and run it.")
globals().get("to_compare") == "Vegetables"
```

`random.choice()` does not change the list. It returns one item, and
the list still holds five items.

## A new order

`random.shuffle()` puts the items of a list in a new order that is
chosen by chance.

```{attempt}
:id: shuffle-not-run
:check: shuffle-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-shuffle
:title: Add a cell that puts a list in a new order, and run it
:path: {{ notebook }}
:tags: [shuffle]
:run: true
random.seed(4)
receipts = ["Bread and milk", "Bus ticket", "Phone bill", "Vegetables", "Cinema ticket"]
random.shuffle(receipts)
print(receipts)
```

The output is:

```
['Vegetables', 'Cinema ticket', 'Bread and milk', 'Phone bill', 'Bus ticket']
```

```{verify}
:id: shuffle-ran
:label: The cell put a list in a new order
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed shuffle
if globals().get("receipts") == ["Vegetables", "Cinema ticket", "Bread and milk", "Phone bill", "Bus ticket"]:
    print("The cell ran. With the seed 4, random.shuffle() put the five items of the list in a new order.")
else:
    print("The cell has not run yet, or it was changed. Click the action above to add the cell and run it.")
globals().get("receipts") == ["Vegetables", "Cinema ticket", "Bread and milk", "Phone bill", "Bus ticket"]
```

`random.shuffle()` changes the list itself. It does not return a new
list: it returns `None`, the value that means "no value". So the line
is `random.shuffle(receipts)` alone, with no name and no `=` sign
before it. The method `sort()` of a list works in the same way.

## Your task

Write a function that chooses one item of a list by chance.

A reminder about functions: the line that begins with `def` gives the
name of the function and its **parameters**, which are the names for
the values that the function is given. The lines of the function begin
with four spaces. The line that begins with `return` gives the result
back to the code that called the function.

Your function must be like this:

- Its name is `pick_one`.

- It has one parameter, `items`, which is a list.

- It returns one item of the list `items`, chosen by `random.choice()`.

- It does not call `random.seed()`. The code that calls the function
  sets the seed.

An example. The result depends on the seed, so it can be any of the
four items:

| Call | Return value |
|------|--------------|
| `pick_one(["rent", "food", "transport", "phone"])` | one of the four strings, for example `"food"` |

The function must work with any list.

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-pick-one
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [pick-one]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`. The cell shows no
output, because it only defines the function.

To try your function, add these two lines under it. They begin
without spaces, so they are not part of the function:

```python
random.seed(4)
print(pick_one(["rent", "food", "transport", "phone"]))
```

With the seed `4`, the output is `food`. The check calls your function
many times, with two different lists.

```{hint}
:title: Hint: how to begin
The first line of your function is `def pick_one(items):`. The
function needs only one more line, which begins with four spaces and
with the word `return`.
```

```{hint}
:title: Hint: the line that returns
Inside the function, the list has the name `items`. The line is
`return random.choice(items)`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: pick-one-not-started
:check: pick-one
:expect: The function pick_one does not exist yet
```

````{attempt}
:id: pick-one-not-a-function
:check: pick-one
:expect: is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
random.seed(4)
pick_one = random.choice(["rent", "food", "transport", "phone"])
```
````

````{attempt}
:id: pick-one-no-parameter
:check: pick-one
:expect: but it has 0

```{cell-insert}
:path: {{ notebook }}
:run: true
def pick_one():
    return random.choice(["rent", "food", "transport", "phone"])
```
````

````{attempt}
:id: pick-one-error
:check: pick-one
:expect: stopped with a TypeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def pick_one(items):
    return random.choice()
```
````

````{attempt}
:id: pick-one-prints
:check: pick-one
:expect: shows the item with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def pick_one(items):
    print(random.choice(items))
```
````

````{attempt}
:id: pick-one-no-return
:check: pick-one
:expect: A function with no return line gives None

```{cell-insert}
:path: {{ notebook }}
:run: true
def pick_one(items):
    chosen = random.choice(items)
```
````

````{attempt}
:id: pick-one-shuffles
:check: pick-one
:expect: but it must give one item of the list

```{cell-insert}
:path: {{ notebook }}
:run: true
def pick_one(items):
    random.shuffle(items)
    return items
```
````

````{attempt}
:id: pick-one-first-item
:check: pick-one
:expect: every call gave 'rent'

```{cell-insert}
:path: {{ notebook }}
:run: true
def pick_one(items):
    return items[0]
```
````

````{attempt}
:id: pick-one-seed-inside
:check: pick-one
:expect: every call gave

```{cell-insert}
:path: {{ notebook }}
:run: true
def pick_one(items):
    random.seed(4)
    return random.choice(items)
```
````

````{attempt}
:id: pick-one-with-randint
:check: pick-one
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def pick_one(items):
    position = random.randint(0, len(items) - 1)
    return items[position]
```
````

````{hint}
:title: Show me a solution
:unlock: "pick-one" in failed_checks or "pick-one" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-pick-one-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [pick-one-solution]
:run: true
def pick_one(items):
    return random.choice(items)

random.seed(4)
print(pick_one(["rent", "food", "transport", "phone"]))
```
````

```{verify}
:id: pick-one
:label: Your function gives one item of a list, chosen by chance
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed pick-one; cell-executed pick-one-solution
def _workshop_check():
    import contextlib, inspect, io, random
    if "pick_one" not in globals():
        print("The function pick_one does not exist yet. Write it under the comment in the new cell. Then hold Shift and press Enter to run the cell.")
        return False
    pick_one = globals()["pick_one"]
    if not callable(pick_one):
        print("The name pick_one exists, but its value is not a function. Begin your cell with the line def pick_one(items): and write the line that returns under it. Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(pick_one).parameters)
    except (TypeError, ValueError):
        count = 1
    if count != 1:
        print(f"The function pick_one must have one parameter, the list, but it has {count}. Make the first line def pick_one(items): and use the name items inside the function. Then run the cell again.")
        return False
    words = ["rent", "food", "transport", "phone"]
    numbers = [10, 20, 30]
    results = []
    other = []
    shown = io.StringIO()
    state = random.getstate()
    try:
        random.seed(20)
        with contextlib.redirect_stdout(shown):
            for index in range(40):
                results.append(pick_one(list(words)))
            for index in range(10):
                other.append(pick_one(list(numbers)))
    except Exception as error:
        kind = type(error).__name__
        kind = ("an " if kind[0] in "AEIOU" else "a ") + kind
        print(f"The function pick_one stopped with {kind} when the check called pick_one({words!r}). Give random.choice() the list items as its argument. You can also run the same call in a cell of your own, and read the error message from the last line. Then correct the function and run the cell again.")
        return False
    finally:
        random.setstate(state)
    printed = shown.getvalue().split()
    if results[0] is None and printed and printed[0] in words:
        print("The function pick_one shows the item with print(), but it does not return it. The code that calls the function gets None. Replace print() with a line that begins with return. Then run the cell again.")
        return False
    if results[0] is None:
        print(f"pick_one({words!r}) gives None but it must give one item of the list. A function with no return line gives None. Add a line that begins with return and gives the result of random.choice(items). Then run the cell again.")
        return False
    for result in results:
        if type(result) is not str or result not in words:
            print(f"pick_one({words!r}) gives {result!r} but it must give one item of the list, such as 'food'. Return the result of random.choice(items). Then run the cell again.")
            return False
    for result in other:
        if type(result) is not int or result not in numbers:
            print(f"pick_one({numbers!r}) gives {result!r} but it must give one item of the list, such as 20. Choose from the parameter items, and not from a list that is written inside the function. Then run the cell again.")
            return False
    if len(set(results)) == 1:
        print(f"The check called pick_one({words!r}) 40 times, and every call gave {results[0]!r}. A choice by chance gives different items. If the function calls random.seed(), remove that line, because a seed that is set before every choice gives the same choice every time. If the function uses an index such as items[0], use random.choice(items) in its place. Then run the cell again.")
        return False
    print("Correct. Your function gives one item of the list, and the item changes from one call to the next.")
    return True
globals().pop("_workshop_check")()
```
