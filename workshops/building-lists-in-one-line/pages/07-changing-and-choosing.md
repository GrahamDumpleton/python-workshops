---
title: Changing and choosing together
requires: [verify:sale-ran, quiz:predict-tens, verify:tens-ran, verify:long-drinks-list]
---

# Changing and choosing together

You have seen a list comprehension that changes each item, and a list
comprehension that chooses items. One list comprehension can do both:
it chooses items with the condition at its end, and it changes the
chosen items with the expression at its start.

This is useful because the two often belong together. A shop gives a
discount, but only on the products that cost more than 10. The new
list must hold only those products, and it must hold their new
prices.

Here is the loop. It subtracts 5 from each price that is greater
than 10:

```python
shelf = [20, 8, 50, 6]
sale = []
for item in shelf:
    if item > 10:
        sale.append(item - 5)
print(sale)
```

Click the action below. It adds a cell that does the same work with a
list comprehension, and runs it.

```{attempt}
:id: sale-not-run
:check: sale-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-sale
:title: Add a cell that gives a discount on the prices above 10, and run it
:path: {{ notebook }}
:tags: [sale]
:run: true
shelf = [20, 8, 50, 6]
sale = [item - 5 for item in shelf if item > 10]
print(sale)
```

The output is:

```
[15, 45]
```

```{verify}
:id: sale-ran
:label: The list comprehension chose the prices and changed them
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed sale
if globals().get("sale") == [15, 45]:
    print("The cell ran. The name sale refers to the new list [15, 45].")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("sale") == [15, 45]
```

## What happened

Python does not do the parts of the line from the left to the right. In
each pass, it does the three parts in this order:

1. The `for` part, in the middle, gives the loop name `item` the next
   item of `shelf`.

2. The `if` part, at the end, tests the condition `item > 10` with
   that item.

3. Only when the condition is true, Python calculates the expression
   at the start, `item - 5`, and adds the result to the new list.

This is the same order as the lines of the loop: first the `for`
line, then the `if` line, then the `.append()` line.

| Pass | `item` | `item > 10` | `item - 5` | The new list after the pass |
|------|--------|-------------|------------|-----------------------------|
| 1 | `20` | `True` | `15` | `[15]` |
| 2 | `8` | `False` | not calculated | `[15]` |
| 3 | `50` | `True` | `45` | `[15, 45]` |
| 4 | `6` | `False` | not calculated | `[15, 45]` |

The condition tests the item before the change, and not the new
item. The price `20` passes the test `item > 10`, and then the new
list gets `15`.

## Predict the result

Look at this cell. Do not run it yet. The operator `%` gives the
remainder of a division, so `n % 2 == 0` is true when `n` is an even
number: 2, 4, 6 and so on.

```python
numbers = [1, 2, 3, 4, 5, 6]
tens = [n * 10 for n in numbers if n % 2 == 0]
print(tens)
```

```{quiz}
:id: predict-tens
:type: text
:title: Predict the list
question: What does the notebook show under this cell when it runs?
answer:
  - { pattern: '\[\s*20\s*,\s*40\s*,\s*60\s*\]', example: "[20, 40, 60]" }
wrong:
  - { pattern: '\[\s*10\s*,\s*20\s*,\s*30\s*,\s*40\s*,\s*50\s*,\s*60\s*\]', explanation: "That list has a new item for every number. The condition `n % 2 == 0` is true only for the even numbers, so only those numbers give a new item." }
  - { pattern: '\[\s*2\s*,\s*4\s*,\s*6\s*\]', explanation: "Those are the numbers that pass the condition. The expression at the start, `n * 10`, says what each new item is, so each of those numbers is multiplied by 10." }
  - { pattern: '\[\s*10\s*,\s*30\s*,\s*50\s*\]', explanation: "Those are the odd numbers, multiplied by 10. The condition `n % 2 == 0` is true when the remainder is 0, which is for the even numbers: 2, 4 and 6." }
  - { pattern: '20\s*,?\s*40\s*,?\s*60', explanation: "The three numbers are correct. Python shows a list with square brackets around the items, so type the brackets too." }
otherwise: "First find the numbers for which `n % 2 == 0` is true. Then multiply each of those numbers by 10."
explanation: "The condition is true for `2`, `4` and `6`. The expression `n * 10` gives `20`, `40` and `60`, so the new list is `[20, 40, 60]`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: tens-not-run
:check: tens-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-tens
:title: Add the cell that multiplies the even numbers by 10, and run it
:path: {{ notebook }}
:tags: [tens]
:run: true
numbers = [1, 2, 3, 4, 5, 6]
tens = [n * 10 for n in numbers if n % 2 == 0]
print(tens)
```

```{verify}
:id: tens-ran
:label: The list comprehension multiplied the even numbers by 10
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed tens
if globals().get("tens") == [20, 40, 60]:
    print("The cell ran. The name tens refers to the new list [20, 40, 60].")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("tens") == [20, 40, 60]
```

## Your task

A café has five drinks: tea, coffee, milk, water and juice. The sign
above the counter has space for only some of them. The owner wants
the drinks whose names have more than 4 letters, written in capital
letters.

This time there is no loop to copy. Your program must do these three
things, in this order:

1. Give the name `drinks` to the list
   `["tea", "coffee", "milk", "water", "juice"]`.

2. Give the name `long_drinks` to a list comprehension. It keeps only
   the items of `drinks` that have more than 4 characters, and each
   new item is the name of the drink in capital letters. You can
   choose the loop name. A good loop name is `drink`.

3. Show the value of `long_drinks` with `print()`.

The function `len()` gives the number of characters in a string, and
the method `.upper()` gives a string in capital letters.

When the program is correct, the output under the cell is:

```
['COFFEE', 'WATER', 'JUICE']
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-long-drinks
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [long-drinks]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Write the three parts of the list comprehension one at a time. First
write the `for` part: `for drink in drinks`. Then decide the
condition, which goes at the end. Then decide the expression, which
goes at the start.
```

```{hint}
:title: Hint: the condition and the expression
The condition is true when the name has more than 4 characters:
`if len(drink) > 4`. The expression gives the name in capital
letters: `drink.upper()`. The line has this form:
`long_drinks = [... for drink in drinks if ...]`. Replace the dots.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: long-drinks-not-started
:check: long-drinks-list
:expect: The name drinks does not exist yet
```

````{attempt}
:id: long-drinks-wrong-drinks
:check: long-drinks-list
:expect: The name drinks refers to ['tea', 'coffee']

```{cell-insert}
:path: {{ notebook }}
:run: true
drinks = ["tea", "coffee"]
```
````

````{attempt}
:id: long-drinks-drinks-only
:check: long-drinks-list
:expect: The name long_drinks does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
drinks = ["tea", "coffee", "milk", "water", "juice"]
```
````

````{attempt}
:id: long-drinks-not-a-list
:check: long-drinks-list
:expect: is not a list

```{cell-insert}
:path: {{ notebook }}
:run: true
drinks = ["tea", "coffee", "milk", "water", "juice"]
long_drinks = drinks[1].upper()
print(long_drinks)
```
````

````{attempt}
:id: long-drinks-no-upper
:check: long-drinks-list
:expect: but the names are not in capital letters

```{cell-insert}
:path: {{ notebook }}
:run: true
drinks = ["tea", "coffee", "milk", "water", "juice"]
long_drinks = [drink for drink in drinks if len(drink) > 4]
print(long_drinks)
```
````

````{attempt}
:id: long-drinks-no-condition
:check: long-drinks-list
:expect: has an item for every drink

```{cell-insert}
:path: {{ notebook }}
:run: true
drinks = ["tea", "coffee", "milk", "water", "juice"]
long_drinks = [drink.upper() for drink in drinks]
print(long_drinks)
```
````

````{attempt}
:id: long-drinks-or-equal
:check: long-drinks-list
:expect: The list long_drinks includes the drink milk

```{cell-insert}
:path: {{ notebook }}
:run: true
drinks = ["tea", "coffee", "milk", "water", "juice"]
long_drinks = [drink.upper() for drink in drinks if len(drink) >= 4]
print(long_drinks)
```
````

````{attempt}
:id: long-drinks-other-number
:check: long-drinks-list
:expect: but it must refer to ['COFFEE', 'WATER', 'JUICE']

```{cell-insert}
:path: {{ notebook }}
:run: true
drinks = ["tea", "coffee", "milk", "water", "juice"]
long_drinks = [drink.upper() for drink in drinks if len(drink) > 5]
print(long_drinks)
```
````

````{attempt}
:id: long-drinks-other-way
:check: long-drinks-list
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
drinks = ["tea", "coffee", "milk", "water", "juice"]
long_drinks = [d.upper() for d in drinks if len(d) >= 5]
print(long_drinks)
```
````

````{hint}
:title: Show me a solution
:unlock: "long-drinks-list" in failed_checks or "long-drinks-list" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-long-drinks-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [long-drinks-solution]
:run: true
drinks = ["tea", "coffee", "milk", "water", "juice"]
long_drinks = [drink.upper() for drink in drinks if len(drink) > 4]
print(long_drinks)
```
````

```{verify}
:id: long-drinks-list
:label: Your list comprehension chooses the long names and changes them
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed long-drinks; cell-executed long-drinks-solution
if "drinks" not in globals():
    print('The name drinks does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the list: drinks = ["tea", "coffee", "milk", "water", "juice"]. Then hold Shift and press Enter to run the cell.')
elif drinks != ["tea", "coffee", "milk", "water", "juice"]:
    print(f'The name drinks refers to {drinks!r} but it must refer to the list ["tea", "coffee", "milk", "water", "juice"]. Correct the first line of your program. Then run the cell again.')
elif "long_drinks" not in globals():
    print("The name long_drinks does not exist yet. Add a line that gives the name long_drinks to a list comprehension. Check the spelling. Then run the cell again.")
elif type(long_drinks) is not list:
    print(f"The name long_drinks refers to {long_drinks!r}, which is not a list. A list comprehension has square brackets around it, and the words for and in inside the brackets. Then run the cell again.")
elif long_drinks == ["COFFEE", "WATER", "JUICE"]:
    print("Correct. The name long_drinks refers to ['COFFEE', 'WATER', 'JUICE']: only the names with more than 4 letters, in capital letters.")
elif long_drinks == ["coffee", "water", "juice"]:
    print("The list long_drinks holds the correct three drinks, but the names are not in capital letters. The expression at the start says what each new item is. Write drink.upper() there. Then run the cell again.")
elif len(long_drinks) == 5:
    print("The list long_drinks has an item for every drink, so the list comprehension has no condition, or its condition is always true. Add the condition at the end, inside the square brackets: if len(drink) > 4. Then run the cell again.")
elif "MILK" in long_drinks or "milk" in long_drinks:
    print("The list long_drinks includes the drink milk. The name milk has 4 letters, and the sign shows only the names with more than 4 letters. Use the operator > in the condition, and not the operator >=. Then run the cell again.")
else:
    print(f"The name long_drinks refers to {long_drinks!r} but it must refer to ['COFFEE', 'WATER', 'JUICE']. The condition must be true for the names with more than 4 characters: if len(drink) > 4. The expression must give the name in capital letters: drink.upper(). Then run the cell again.")
"drinks" in globals() and "long_drinks" in globals() and drinks == ["tea", "coffee", "milk", "water", "juice"] and type(long_drinks) is list and long_drinks == ["COFFEE", "WATER", "JUICE"]
```
