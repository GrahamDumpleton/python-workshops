---
title: "Part 2: a line for each item"
requires: [verify:item-lines]
---

# Part 2: a line for each item

You have the four lists `items`, `quantities`, `prices` and `costs`.
In this part you build the first six lines of the receipt: one line of
text for each item.

## The goal

Make a list named `item_lines`. It must hold one string for each item.
Each string is one line of the receipt, with its values in columns.

Your code does not print the receipt yet. It keeps the lines in a
list, so that the last part of the program can print the complete
receipt.

## What your code must do

- It reads the lists `items`, `quantities` and `costs`.

- For each item, it builds one string with an f-string. The string has
  three values, with no spaces written between them:

  1. the name of the item, in a width of 10

  2. the quantity, in a width of 3

  3. the cost, in a width of 8, with two decimal places

- It makes a list named `item_lines` that holds these strings, in the
  same order as the items.

- After the list is complete, it prints each line of `item_lines`.

For example, the line for the bread must be exactly this, with 7
spaces after `Bread` and 4 spaces before `4.80`:

```
Bread       2    4.80
```

Every line has exactly 21 characters, because 10 + 3 + 8 is 21.

When your code is correct, the output under the cell is:

```
Bread       2    4.80
Milk        3    3.45
Apples      6    3.30
Rice        1    3.80
Coffee      1    7.25
Soap        4    5.40
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-lines
:title: Add a cell for part 2
:path: {{ notebook }}
:tags: [lines]
:run: false
# Part 2: a line for each item. Write your code below this line.

```

Write your code under the comment, and run the cell. The check
compares each of your lines with the line that it expects, character
by character. When a line is different, the check shows you both
lines.

## If you need help

```{hint}
:title: Hint: what to look at
This part has the same shape as part 1: an empty list, a loop over
the index, and `append` inside the loop. Only the value that you
append is different. Here it is an f-string.

Look at the page **Text in columns** for how to write a width. The
last cell on that page builds a line from a name with a width of 10
and a price with a width of 8.

To print the lines after the list is complete, use a second loop. A
`for` loop over a list gives a name to each value of the list in turn:
`for line in item_lines:`.
```

```{hint}
:title: Hint: the shape of the code
1. Make an empty list: `item_lines = []`.

2. Start the loop: `for i in range(len(items)):`.

3. Inside the loop, append an f-string to `item_lines`. The f-string
   has three pairs of curly brackets, with nothing between them. The
   first pair is `{items[i]:10}`. The second pair shows
   `quantities[i]` with the width `3`. The third pair shows `costs[i]`
   with `8.2f` after the colon.

4. After that loop, write a second loop that starts at the left side
   of the cell: `for line in item_lines:`. Its block has one line,
   `print(line)`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: lines-not-started
:check: item-lines
:expect: The name item_lines does not exist yet
```

````{attempt}
:id: lines-no-costs
:check: item-lines
:expect: are not ready

```{cell-insert}
:path: {{ notebook }}
:run: true
costs = []
```
````

````{attempt}
:id: lines-not-a-list
:check: item-lines
:expect: must refer to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
costs = []
for i in range(len(items)):
    costs.append(quantities[i] * prices[i])
item_lines = f"{items[0]:10}{quantities[0]:3}{costs[0]:8.2f}"
```
````

````{attempt}
:id: lines-empty
:check: item-lines
:expect: The list item_lines is empty

```{cell-insert}
:path: {{ notebook }}
:run: true
item_lines = []
```
````

````{attempt}
:id: lines-append-outside
:check: item-lines
:expect: The number of lines in the list item_lines is 1

```{cell-insert}
:path: {{ notebook }}
:run: true
item_lines = []
for i in range(len(items)):
    line = f"{items[i]:10}{quantities[i]:3}{costs[i]:8.2f}"
item_lines.append(line)
```
````

````{attempt}
:id: lines-numbers
:check: item-lines
:expect: holds a value that is not a string

```{cell-insert}
:path: {{ notebook }}
:run: true
item_lines = []
for i in range(len(items)):
    item_lines.append(costs[i])
```
````

````{attempt}
:id: lines-no-widths
:check: item-lines
:expect: has the correct values, but the spaces are different

```{cell-insert}
:path: {{ notebook }}
:run: true
item_lines = []
for i in range(len(items)):
    item_lines.append(f"{items[i]} {quantities[i]} {costs[i]:.2f}")
for line in item_lines:
    print(line)
```
````

````{attempt}
:id: lines-no-decimals
:check: item-lines
:expect: is different from the line that the check expects

```{cell-insert}
:path: {{ notebook }}
:run: true
item_lines = []
for i in range(len(items)):
    item_lines.append(f"{items[i]:10}{quantities[i]:3}{costs[i]:8}")
for line in item_lines:
    print(line)
```
````

````{attempt}
:id: lines-other-way
:check: item-lines
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
item_lines = []
for i in range(len(costs)):
    name = items[i]
    quantity = quantities[i]
    cost = costs[i]
    line = f"{name:10}{quantity:3}{cost:8.2f}"
    item_lines.append(line)
for i in range(len(item_lines)):
    print(item_lines[i])
```
````

````{hint}
:title: Show me a solution
:unlock: "item-lines" in failed_checks or "item-lines" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-lines-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [lines-solution]
:run: true
item_lines = []
for i in range(len(items)):
    item_lines.append(f"{items[i]:10}{quantities[i]:3}{costs[i]:8.2f}")
for line in item_lines:
    print(line)
```
````

```{verify}
:id: item-lines
:label: The list item_lines holds one line for each item
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed lines; cell-executed lines-solution
if not (all(isinstance(globals().get(name), list) for name in ("items", "quantities", "costs")) and len(items) == len(quantities) == len(costs) > 0 and all(isinstance(text, str) for text in items) and all(isinstance(number, (int, float)) for number in quantities + costs)):
    print("The lists items, quantities and costs are not ready. The three lists must exist, and each must hold one value for each item. Return to the page Part 1: the cost of each item, and make its check pass. You can use the solution on that page. Then return to this page and run your cell again.")
elif "item_lines" not in globals():
    print("The name item_lines does not exist yet. Write your code under the comment in the new cell, and begin with a line that makes an empty list named item_lines. Check the spelling. Then hold Shift and press Enter to run the cell.")
elif not isinstance(item_lines, list):
    print(f"The name item_lines must refer to a list, but it refers to the value {item_lines!r}. Make an empty list before the loop, with the line item_lines = [] and add each line to it inside the loop with append. Then run the cell again.")
elif len(item_lines) == 0:
    print("The list item_lines is empty. Add each line to the list inside the loop, with item_lines.append and the f-string between the parentheses. Then run the cell again.")
elif len(item_lines) != len(items):
    print(f"The number of lines in the list item_lines is {len(item_lines)}, but the number of items is {len(items)}. When the list is too short, check that the line with append is inside the loop: it must start with four spaces. When the list is too long, check that the line item_lines = [] is in the same cell as the loop, above it. Then run the cell again.")
elif not all(isinstance(text, str) for text in item_lines):
    print("The list item_lines holds a value that is not a string. Each value that you append must be an f-string that holds the name, the quantity and the cost of one item. Then run the cell again.")
elif item_lines == [f"{items[i]:10}{quantities[i]:3}{costs[i]:8.2f}" for i in range(len(items))]:
    print(f"Correct. The list item_lines holds {len(items)} lines, and each line has its values in columns.")
else:
    print([(f"Line {i + 1} of item_lines has the correct values, but the spaces are different. Give each value a width and write nothing between the curly brackets: a width of 10 for the name, a width of 3 for the quantity, and 8.2f for the cost." if item_lines[i].split() == f"{items[i]:10}{quantities[i]:3}{costs[i]:8.2f}".split() else f"Line {i + 1} of item_lines is different from the line that the check expects. The line must hold the name in a width of 10, then the quantity in a width of 3, then the cost with 8.2f after the colon.") + " Change your f-string, and run the cell again. The quotes below show where each line starts and ends.\nYour line:     \"" + item_lines[i] + "\"\nExpected line: \"" + f"{items[i]:10}{quantities[i]:3}{costs[i]:8.2f}" + "\"" for i in range(len(items)) if item_lines[i] != f"{items[i]:10}{quantities[i]:3}{costs[i]:8.2f}"][0])
all(isinstance(globals().get(name), list) for name in ("items", "quantities", "costs")) and len(items) == len(quantities) == len(costs) > 0 and all(isinstance(text, str) for text in items) and all(isinstance(number, (int, float)) for number in quantities + costs) and isinstance(globals().get("item_lines"), list) and item_lines == [f"{items[i]:10}{quantities[i]:3}{costs[i]:8.2f}" for i in range(len(items))]
```

## What you have now

The list `item_lines` holds the first six lines of the receipt. The
next three parts calculate the three numbers at the bottom of the
receipt.
