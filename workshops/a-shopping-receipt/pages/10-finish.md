---
title: What you have learned
---

# What you have learned

You have built a complete program. Nobody gave you the code: you had a
goal for each part, and you wrote the lines yourself. This is how
programmers work every day.

## The ideas

- A large task becomes possible when you divide it into small parts.
  You wrote the receipt in six parts, and you tested each part before
  you started the next one.

- Lists that belong together hold their values in the same order. One
  index, from `for i in range(len(items)):`, reads the values for the
  same item from each list.

- A list can be built in a loop: start with an empty list, and
  `append` one value each time the loop repeats.

- A sum can be built in a loop: start with `0`, and add one value each
  time the loop repeats.

- `if` and `else` let a program follow a rule that has two cases.

- A **width** in an f-string makes a value fill a fixed number of
  characters. Strings go to the left side of the width, and numbers go
  to the right side. Values with widths form columns.

- A program that calculates its results from the data still works when
  the data changes.

## The code

| Code | What it does |
|------|--------------|
| `costs = []` | makes an empty list |
| `costs.append(quantities[i] * prices[i])` | adds one value to the end of the list |
| `for i in range(len(items)):` | repeats its block one time for each index of the list |
| `for line in receipt:` | repeats its block one time for each value of the list |
| `subtotal = subtotal + cost` | adds one value to a sum |
| `if subtotal > 25:` | runs its block only when the comparison is `True` |
| `f"{name:10}"` | shows a string in a width of 10 characters |
| `f"{cost:8.2f}"` | shows a number in a width of 8 characters, with two decimal places |

## What comes next

This was the last workshop of **Python first steps**. You can now
write a program that keeps data, repeats work, makes decisions and
shows its results clearly.

Your program for the receipt works for one set of lists. To print a
second receipt, you would have to copy all the cells. The next set of
workshops, **Python functions and data**, starts with a better way.
Its first workshop, **Your first function**, shows how to give a name
to a group of lines, so that you write them once and use them many
times.

Click `Finish` at the bottom of this panel.
