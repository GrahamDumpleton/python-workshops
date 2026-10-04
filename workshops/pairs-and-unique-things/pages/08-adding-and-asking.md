---
title: Adding a value and asking a question
requires: [quiz:predict-add, verify:colours-ran, verify:asked-ran, verify:drinks]
---

# Adding a value and asking a question

A set can change. This page shows the two things that you do most
often with a set: you add a value, and you ask whether the set holds a
value.

Programs use these two things together to remember what they have
seen. A program that reads many orders can keep a set of the drinks
that were ordered. For each order it adds the drink to the set. At any
moment it can ask the set whether a certain drink was ordered.

Think again of the list of members of a club. A new person joins, and
the name is added. A person who is already a member cannot join a
second time. And at the door, somebody asks: "Is this person a
member?"

## Adding a value

A **method** is a function that belongs to a value. You write the
name of the value, a full stop, and then the name of the method with
parentheses. A list has the method `append`. A set has the method
`add`. It puts one value in the set. When the set already holds the
value, the set stays as it is, and Python shows no error.

Look at this cell. Do not run it yet.

```python
colours = {"red", "blue"}
colours.add("green")
colours.add("red")
print(len(colours))
```

```{quiz}
:id: predict-add
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "3"
wrong:
  - { text: "4", explanation: "The set starts with two items, and the cell calls `add` two times. But the set already holds `\"red\"`, so the second call changes nothing." }
  - { text: "2", explanation: "The set starts with two items. The first call of `add` puts `\"green\"` in the set, which is a new value, so the set grows." }
otherwise: "The set starts with two items. Decide for each call of `add` whether the value is new for the set. Then count the items."
explanation: "The set starts with `\"red\"` and `\"blue\"`. The value `\"green\"` is new, so the set then has three items. The set already holds `\"red\"`, so the last call changes nothing. The output is `3`."
```

Run the cell, and compare the output with your prediction. The cell
has one more line, which shows the items in order.

```{attempt}
:id: colours-not-run
:check: colours-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-colours
:title: Add the cell that adds two values to a set, and run it
:path: {{ notebook }}
:tags: [colours]
:run: true
colours = {"red", "blue"}
colours.add("green")
colours.add("red")
print(len(colours))
print(sorted(colours))
```

The output is:

```
3
['blue', 'green', 'red']
```

```{verify}
:id: colours-ran
:label: The set colours holds three items
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed colours
if globals().get("colours") == {"red", "blue", "green"}:
    print("The cell ran. The set colours holds three items, because the second call of add gave a value that the set already held.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("colours") == {"red", "blue", "green"}
```

A set has no end, so it has no method `append`. The method `add` does
not say where the value goes, because a set has no positions.

## Asking a question

The operator `in` asks whether a set holds a value. You know this
operator from lists. The result is a **boolean**: `True` or `False`.

Click the action below. It adds a cell that asks two questions about
the set `colours`, and runs it.

```{attempt}
:id: asked-not-run
:check: asked-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-asked
:title: Add a cell that asks whether a set holds a value, and run it
:path: {{ notebook }}
:tags: [asked]
:run: true
has_green = "green" in colours
has_pink = "pink" in colours
print(has_green)
print(has_pink)
```

The output is:

```
True
False
```

The set holds `"green"`, so the first result is `True`. The set does
not hold `"pink"`, so the second result is `False`.

```{verify}
:id: asked-ran
:label: The operator in gave True and then False
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed asked
if globals().get("has_green") is True and globals().get("has_pink") is False:
    print("The cell ran. The set holds green, so the first result is True. The set does not hold pink, so the second result is False.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("has_green") is True and globals().get("has_pink") is False
```

## Your task

A café writes each order in a list. Find which different drinks were
ordered.

Your program must do these five things, in this order:

1. Give the name `orders` to the list
   `["tea", "coffee", "tea", "juice", "coffee", "tea"]`.

2. Give the name `drinks` to a set that is made from the list
   `orders`.

3. Add the string `"water"` to the set `drinks`, with the method
   `add`.

4. Give the name `has_juice` to the result of the question: does the
   set `drinks` hold the string `"juice"`?

5. Show the number of items of the set `drinks` with `print()`.

When the program is correct, the output under the cell is:

```
4
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-drinks
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [drinks]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: the set
The function `set()` makes a set from a list. The second line of your
program is `drinks = set(orders)`. The third line calls the method
`add` on the set: `drinks.add("water")`.
```

```{hint}
:title: Hint: the question
The question uses the operator `in`, with the value on its left side
and the set on its right side. The fourth line of your program is
`has_juice = "juice" in drinks`. The last line is
`print(len(drinks))`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: drinks-not-started
:check: drinks
:expect: The name drinks does not exist yet
```

````{attempt}
:id: drinks-still-a-list
:check: drinks
:expect: The name drinks refers to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
orders = ["tea", "coffee", "tea", "juice", "coffee", "tea"]
drinks = orders
```
````

````{attempt}
:id: drinks-add-result
:check: drinks
:expect: The name drinks refers to None

```{cell-insert}
:path: {{ notebook }}
:run: true
orders = ["tea", "coffee", "tea", "juice", "coffee", "tea"]
drinks = set(orders).add("water")
```
````

````{attempt}
:id: drinks-no-water
:check: drinks
:expect: The set drinks does not hold "water" yet

```{cell-insert}
:path: {{ notebook }}
:run: true
orders = ["tea", "coffee", "tea", "juice", "coffee", "tea"]
drinks = set(orders)
print(len(drinks))
```
````

````{attempt}
:id: drinks-wrong-items
:check: drinks
:expect: but it must hold these four

```{cell-insert}
:path: {{ notebook }}
:run: true
orders = ["tea", "coffee", "tea"]
drinks = set(orders)
drinks.add("water")
print(len(drinks))
```
````

````{attempt}
:id: drinks-no-question
:check: drinks
:expect: The name has_juice does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
orders = ["tea", "coffee", "tea", "juice", "coffee", "tea"]
drinks = set(orders)
drinks.add("water")
print(len(drinks))
```
````

````{attempt}
:id: drinks-question-not-boolean
:check: drinks
:expect: but it must refer to True

```{cell-insert}
:path: {{ notebook }}
:run: true
orders = ["tea", "coffee", "tea", "juice", "coffee", "tea"]
drinks = set(orders)
drinks.add("water")
has_juice = "juice"
print(len(drinks))
```
````

````{hint}
:title: Show me a solution
:unlock: "drinks" in failed_checks or "drinks" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-drinks-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [drinks-solution]
:run: true
orders = ["tea", "coffee", "tea", "juice", "coffee", "tea"]
drinks = set(orders)
drinks.add("water")
has_juice = "juice" in drinks
print(len(drinks))
```
````

```{verify}
:id: drinks
:label: Your set holds the four different drinks
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed drinks; cell-executed drinks-solution
if "drinks" not in globals():
    print("The name drinks does not exist yet. Write your program under the comment in the new cell. Begin with the list orders, and then make the set: drinks = set(orders). Then hold Shift and press Enter to run the cell.")
elif isinstance(drinks, list):
    print("The name drinks refers to a list, so it can still hold duplicates. Make a set from the list with the function set(): drinks = set(orders). Then run the cell again.")
elif drinks is None:
    print("The name drinks refers to None. The method add changes the set and gives back None, so do not put it in an assignment. Write two lines: drinks = set(orders) and then drinks.add(\"water\"). Then run the cell again.")
elif not isinstance(drinks, set):
    print(f"The name drinks refers to {drinks!r}, which is not a set. Make a set from the list with the function set(): drinks = set(orders). Then run the cell again.")
elif drinks == {"tea", "coffee", "juice"}:
    print("The set drinks does not hold \"water\" yet. Add a line after the line that makes the set: drinks.add(\"water\"). Then run the cell again.")
elif drinks != {"tea", "coffee", "juice", "water"}:
    print(f"The set drinks holds these items: {sorted(drinks, key=repr)}, but it must hold these four: ['coffee', 'juice', 'tea', 'water']. Check the items of the list orders and the spelling of the string that you add. Then run the cell again.")
elif "has_juice" not in globals():
    print("The set drinks is correct. The name has_juice does not exist yet. Add a line that asks the question with the operator in: has_juice = \"juice\" in drinks. Then run the cell again.")
elif has_juice is True:
    print("Correct. The set drinks holds the four different drinks, and the name has_juice refers to True.")
else:
    print(f"The name has_juice refers to {has_juice!r} but it must refer to True. Ask the question with the operator in: has_juice = \"juice\" in drinks. Then run the cell again.")
"drinks" in globals() and "has_juice" in globals() and isinstance(drinks, set) and drinks == {"tea", "coffee", "juice", "water"} and has_juice is True
```
