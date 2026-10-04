---
title: "Part 6: the finished receipt"
requires: [verify:receipt-lines]
---

# Part 6: the finished receipt

You have all the pieces. In this last part you join them into one
list that holds every line of the receipt, and you print it.

## The goal

Make a list named `receipt` that holds every line of the receipt, from
the top to the bottom. Then print each line.

## What your code must do

- It reads the list `item_lines` and the names `subtotal`, `discount`
  and `total`.

- It makes a list named `receipt`. The list starts empty.

- It appends every line of `item_lines` to `receipt`, in the same
  order.

- It then appends three more lines, in this order: one for the
  subtotal, one for the discount and one for the total. Each of these
  lines is a string with two values, with no spaces written between
  them:

  1. a word, in a width of 13. The three words are `Subtotal`,
     `Discount` and `Total`.

  2. the number, in a width of 8, with two decimal places

- After the list is complete, it prints each line of `receipt`.

The width of 13 is the width of the name and the width of the
quantity together, because 10 + 3 is 13. The numbers then stand under
the costs of the items.

For example, the line for the subtotal must be exactly this, with 8
spaces between `Subtotal` and `28.00`:

```
Subtotal        28.00
```

When your code is correct, the output under the cell is the complete
receipt:

```
Bread       2    4.80
Milk        3    3.45
Apples      6    3.30
Rice        1    3.80
Coffee      1    7.25
Soap        4    5.40
Subtotal        28.00
Discount         2.80
Total           25.20
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-receipt
:title: Add a cell for part 6
:path: {{ notebook }}
:tags: [receipt]
:run: false
# Part 6: the finished receipt. Write your code below this line.

```

Write your code under the comment, and run the cell. The check reads
the list `receipt`. It cannot see what your cell prints, so compare
the output under your cell with the receipt above yourself.

## If you need help

```{hint}
:title: Hint: what to look at
To copy the lines of one list into another list, loop over the first
list and append each value to the second list.

On the page **Text in columns**, every value with a width had a name:
`{fruit:12}`. You can do the same for the three words. Give the word a
name first, for example `label = "Subtotal"`, and then use the name in
the f-string with the width `13`.

To print the lines, use a loop over `receipt`, as you did for
`item_lines` in part 2.
```

```{hint}
:title: Hint: the shape of the code
1. Make an empty list: `receipt = []`.

2. Write a loop, `for line in item_lines:`, with one line in its
   block: `receipt.append(line)`.

3. After the loop, at the left side of the cell, write two lines for
   the subtotal. The first is `label = "Subtotal"`. The second appends
   an f-string to `receipt`. The f-string has two pairs of curly
   brackets with nothing between them: `{label:13}` and then the name
   `subtotal` with `8.2f` after the colon.

4. Write the same two lines for the discount, with the word `Discount`
   and the name `discount`.

5. Write the same two lines for the total, with the word `Total` and
   the name `total`.

6. Write a last loop, `for line in receipt:`, with one line in its
   block: `print(line)`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: receipt-not-started
:check: receipt-lines
:expect: The name receipt does not exist yet
```

````{attempt}
:id: receipt-no-lines
:check: receipt-lines
:expect: are not ready

```{cell-insert}
:path: {{ notebook }}
:run: true
item_lines = 5
```
````

````{attempt}
:id: receipt-not-a-list
:check: receipt-lines
:expect: must refer to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
item_lines = []
for i in range(len(items)):
    item_lines.append(f"{items[i]:10}{quantities[i]:3}{costs[i]:8.2f}")
receipt = f"{total:8.2f}"
```
````

````{attempt}
:id: receipt-numbers
:check: receipt-lines
:expect: holds a value that is not a string

```{cell-insert}
:path: {{ notebook }}
:run: true
receipt = []
for line in item_lines:
    receipt.append(line)
receipt.append(subtotal)
receipt.append(discount)
receipt.append(total)
```
````

````{attempt}
:id: receipt-no-items
:check: receipt-lines
:expect: must begin with the lines of the list item_lines

```{cell-insert}
:path: {{ notebook }}
:run: true
receipt = []
label = "Subtotal"
receipt.append(f"{label:13}{subtotal:8.2f}")
label = "Discount"
receipt.append(f"{label:13}{discount:8.2f}")
label = "Total"
receipt.append(f"{label:13}{total:8.2f}")
```
````

````{attempt}
:id: receipt-items-only
:check: receipt-lines
:expect: The number of lines in the list receipt is 6

```{cell-insert}
:path: {{ notebook }}
:run: true
receipt = []
for line in item_lines:
    receipt.append(line)
for line in receipt:
    print(line)
```
````

````{attempt}
:id: receipt-no-width
:check: receipt-lines
:expect: The line for the word Subtotal

```{cell-insert}
:path: {{ notebook }}
:run: true
receipt = []
for line in item_lines:
    receipt.append(line)
receipt.append(f"Subtotal {subtotal:.2f}")
receipt.append(f"Discount {discount:.2f}")
receipt.append(f"Total {total:.2f}")
for line in receipt:
    print(line)
```
````

````{attempt}
:id: receipt-no-decimals
:check: receipt-lines
:expect: The line for the word Total

```{cell-insert}
:path: {{ notebook }}
:run: true
receipt = []
for line in item_lines:
    receipt.append(line)
label = "Subtotal"
receipt.append(f"{label:13}{subtotal:8.2f}")
label = "Discount"
receipt.append(f"{label:13}{discount:8.2f}")
label = "Total"
receipt.append(f"{label:13}{total:8}")
for line in receipt:
    print(line)
```
````

````{attempt}
:id: receipt-other-way
:check: receipt-lines
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
receipt = []
for i in range(len(item_lines)):
    receipt.append(item_lines[i])
receipt.append("Subtotal     " + f"{subtotal:8.2f}")
receipt.append(f"Discount     {discount:8.2f}")
receipt.append(f"Total        {total:8.2f}")
for line in receipt:
    print(line)
```
````

````{hint}
:title: Show me a solution
:unlock: "receipt-lines" in failed_checks or "receipt-lines" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-receipt-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [receipt-solution]
:run: true
receipt = []
for line in item_lines:
    receipt.append(line)
label = "Subtotal"
receipt.append(f"{label:13}{subtotal:8.2f}")
label = "Discount"
receipt.append(f"{label:13}{discount:8.2f}")
label = "Total"
receipt.append(f"{label:13}{total:8.2f}")
for line in receipt:
    print(line)
```
````

```{verify}
:id: receipt-lines
:label: The list receipt holds every line of the receipt
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed receipt; cell-executed receipt-solution
if not (isinstance(globals().get("item_lines"), list) and len(item_lines) > 0 and all(isinstance(text, str) for text in item_lines) and all(isinstance(globals().get(name), (int, float)) for name in ("subtotal", "discount", "total"))):
    print("The names item_lines, subtotal, discount and total are not ready. The list item_lines must hold one string for each item, and the other three names must refer to numbers. Return to the pages for parts 2 to 5, and make their checks pass. You can use the solutions on those pages. Then return to this page and run your cell again.")
elif "receipt" not in globals():
    print("The name receipt does not exist yet. Write your code under the comment in the new cell, and begin with a line that makes an empty list named receipt. Check the spelling. Then hold Shift and press Enter to run the cell.")
elif not isinstance(receipt, list):
    print(f"The name receipt must refer to a list, but it refers to the value {receipt!r}. Make an empty list with the line receipt = [] and add each line of the receipt to it with append. Then run the cell again.")
elif not all(isinstance(text, str) for text in receipt):
    print("The list receipt holds a value that is not a string. Every value in the list must be one line of text. For the subtotal, the discount and the total, append an f-string that holds the word and the number, and not the number alone. Then run the cell again.")
elif receipt[:len(item_lines)] != item_lines:
    print(f"The list receipt must begin with the lines of the list item_lines, in the same order. Its first {len(item_lines)} values are different from those lines. Make the empty list first. Then loop over item_lines and append each line to receipt, before you append the other three lines. Then run the cell again.")
elif len(receipt) != len(item_lines) + 3:
    print(f"The number of lines in the list receipt is {len(receipt)}, but the receipt needs {len(item_lines) + 3}: the {len(item_lines)} lines of item_lines, and then one line each for the subtotal, the discount and the total. When the list is too long, check that the line receipt = [] is in the same cell as the lines that append, above them. Then run the cell again.")
elif receipt == item_lines + [f"{'Subtotal':13}{subtotal:8.2f}", f"{'Discount':13}{discount:8.2f}", f"{'Total':13}{total:8.2f}"]:
    print(f"Correct. The list receipt holds all {len(receipt)} lines of the receipt. Compare the output under your cell with the receipt on this page.")
else:
    print([f"The line for the word {label} is different from the line that the check expects. The line must hold the word {label} in a width of 13, and then the number with 8.2f after the colon, with nothing between the two pairs of curly brackets. Change that line, and run the cell again. The quotes below show where each line starts and ends.\nYour line:     \"" + receipt[len(item_lines) + position] + "\"\nExpected line: \"" + f"{label:13}{amount:8.2f}" + "\"" for position, label, amount in ((0, "Subtotal", subtotal), (1, "Discount", discount), (2, "Total", total)) if receipt[len(item_lines) + position] != f"{label:13}{amount:8.2f}"][0])
isinstance(globals().get("item_lines"), list) and len(item_lines) > 0 and all(isinstance(text, str) for text in item_lines) and all(isinstance(globals().get(name), (int, float)) for name in ("subtotal", "discount", "total")) and isinstance(globals().get("receipt"), list) and receipt == item_lines + [f"{'Subtotal':13}{subtotal:8.2f}", f"{'Discount':13}{discount:8.2f}", f"{'Total':13}{total:8.2f}"]
```

## Your program works with other data

You calculated every number from the lists, and you typed none of the
results yourself. For that reason, the same program prints a correct
receipt for other shopping. This last step is optional, and it has no
check.

1. Find the cell that holds the shopping data. It is the first cell
   with code in your notebook. In the list `quantities`, change the
   last value from `4` to `1`. The person now buys only one soap.

2. Open the `Run` menu at the top of the window, and choose `Run All
   Cells`. Python runs every cell of the notebook again, from the
   first cell to the last.

3. Look at the output under your last cell.

The subtotal is now 23.95. That is not over 25, so your `if` chose the
other case, and the receipt ends with these lines:

```
Soap        1    1.35
Subtotal        23.95
Discount         0.00
Total           23.95
```

```{hint}
:title: The numbers did not change, or the run stopped
`Run All Cells` stops at the first cell that shows an error message.
If one of your earlier tries still has an error, correct that cell or
delete its code, and choose `Run All Cells` again.

If the discount is not `0.00`, look at your cell for part 4. The name
`discount` must get the value `0` in an `else` block.
```
