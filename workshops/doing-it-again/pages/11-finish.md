---
title: What you have learned
---

# What you have learned

Your programs can now repeat work. You have written loops that add up
a total, count items, and find the largest value, and you wrote the
last program completely yourself.

## The ideas

- A **loop** tells Python to run the same lines many times. Each run
  of those lines is a **pass**.

- A `for` loop makes one pass for each item of a list. Before each
  pass, it makes the **loop name** refer to the next item.

- The **block** of a loop is the group of lines under it that begin
  with four spaces. The first line without those spaces is after the
  loop, and runs one time.

- `range()` gives a loop the numbers to count with. The numbers begin
  at `0`, and the number where the loop stops is not included.

- A total and a count both start from `0` before the loop. The largest
  value starts from the first item of the list.

- An `if` inside a loop decides in each pass. The line under the `if`
  begins with eight spaces.

- `range(len(items))` gives the indexes of a list. One index can be
  used with two lists that belong together.

- A `while` loop repeats until its **condition** becomes false. The
  block must change something that the condition uses, or the loop
  never ends.

- When a cell stays at `[*]`, it may hold a loop that never ends.
  Correct the loop, open the `Kernel` menu, and choose
  `Restart Kernel and Run All Cells…`.

## The code

| Code | What it does |
|------|--------------|
| `for guest in guests:` | runs the block one time for each item of the list `guests` |
| `for lap in range(3):` | runs the block three times, with `lap` as `0`, `1` and `2` |
| `for number in range(1, 4):` | runs the block with `number` as `1`, `2` and `3` |
| `total = total + price` | inside a loop, adds each item to a total |
| `count = count + 1` | inside an `if` in a loop, counts the items that pass the test |
| `if height > tallest:` | inside a loop, tests whether the item is larger than the largest so far |
| `for i in range(len(items)):` | runs the block one time for each index of the list `items` |
| `while saved < 100:` | runs the block again and again, until the condition is false |

## What comes next

You now know values, names, text, error messages, decisions, lists
and loops. That is enough to build a complete program.

The next workshop, **A shopping receipt**, is the last workshop of
**Python first steps**. In it you build a program that prints a
receipt for a list of items, quantities and prices. You get less help
than before, because you can now do more of the work yourself.

Click `Finish` at the bottom of this panel.
