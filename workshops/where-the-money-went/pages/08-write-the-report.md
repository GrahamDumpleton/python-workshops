---
title: "Part 6: write the report"
requires: [verify:report-written]
---

# Part 6: write the report

Your program knows the four answers, but they are only in the notebook.
When the notebook is closed, they are lost. In this last part you write
the answers to a file, so that Mariam can keep the report and read it
without Python.

## The goal

Write a file named `report.txt` that holds the four answers: the total
for each category, the total for each month, the largest purchase, and
the categories that were over their budget in each month.

You write no function in this part. You choose how the report looks.
The check reads the file and looks for the facts. It does not look for
an exact form.

## What your code must do

- It opens the file `report.txt` for writing, with
  `open("report.txt", "w")`. The `"w"` means "write". Each time the
  cell runs, the file is replaced by a new one.

- It writes text to the file with `file.write()`. The method `write()`
  does not end the line. Each string that must end a line has the
  **newline character** `\n` as its last character.

- For each category, the file has one line that holds the name of the
  category and its total with two decimal places, for example
  `food 445.60`.

- For each month, the file has one line that holds the month and its
  total with two decimal places, for example `2026-01 917.20`.

- The file has one line that holds the description of the largest
  purchase and its amount with two decimal places, for example
  `2026-01-01 Rent for January 650.00`.

- For each month, the file has one line that holds the month and the
  names of the categories that were over their budget in that month,
  and no other category. An example is
  `2026-03 ['clothes', 'transport']`.

- It reads the facts from the names that your program already has:
  `category_totals`, `month_totals`, `largest` and `over_by_month`. Do
  not type the numbers. Then the same code works for the data of next
  year.

- The file can also have headings and empty lines, and each line can
  have more words. You decide.

- The last line of the cell is outside the `with` block. It shows a
  short message, so that you can see that the cell has run:
  `print("The report is in the file report.txt.")`.

For example, the report can look like this:

```
Where the money went

Total for each category
rent 1950.00
food 445.60
transport 181.30
phone 54.00
hobbies 63.49
clothes 140.40

Total for each month
2026-01 917.20
2026-02 942.34
2026-03 975.25

Largest purchase
2026-01-01 Rent for January 650.00

Over the budget
2026-01 ['clothes']
2026-02 ['food']
2026-03 ['clothes', 'transport']
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-report
:title: Add a cell for part 6
:path: {{ notebook }}
:tags: [report]
:run: false
# Part 6: write the report. Write your code below this line.

```

Write your code under the comment, and run the cell. The check reads
the file `report.txt`, and tells you which fact it did not find.

## If you need help

```{hint}
:title: Hint: what to look at
The workshop **Reading and writing files** showed how to write a file:

- `with open("report.txt", "w") as file:` opens the file for writing.
  The lines that write are in the block under the `with` line, and
  Python closes the file at the end of that block.

- `file.write("Largest purchase\n")` writes one line. The `\n` at the
  end is the newline character. Without it, the next text continues on
  the same line.

- `write()` takes one string. An f-string builds a string from values:
  `f"{category} {total:.2f}\n"` holds the category, a space, the total
  with two decimal places, and the newline character.

To write one line for each category, use a loop over the dictionary:
`for category, total in category_totals.items():`. The loop is inside
the `with` block, and the line with `file.write()` is inside the loop.
```

```{hint}
:title: Hint: the shape of the code
1. The first line opens the file:
   `with open("report.txt", "w") as file:`. Every line that writes to
   the file is in the block under it, and starts with four spaces.

2. Write a heading: `file.write("Total for each category\n")`.

3. Write a loop: `for category, total in category_totals.items():`.
   Its block has one line, which starts with eight spaces:
   `file.write(f"{category} {total:.2f}\n")`.

4. Do the same for the months: a heading, and then a loop over
   `month_totals.items()` that writes the month and its total.

5. Write the largest purchase in one line:
   `file.write(f"{largest['description']} {largest['amount']:.2f}\n")`.
   Inside the f-string, the keys are written with single quotes.

6. Write a loop over the last dictionary:
   `for month, names in over_by_month.items():`. Its block writes the
   month and the list: `file.write(f"{month} {names}\n")`.

7. After the `with` block, at the left side of the cell, write the
   line with `print()` from the task.
```

## Look at the report

After you have run your cell, click the action below. It shows the
file `report.txt` under your notebook. The view does not change when
your cell writes the file again, so click the action again each time
that you have run the cell.

```{attempt}
:id: report-not-started
:check: report-written
:expect: The file report.txt does not exist yet
```

````{attempt}
:id: report-empty
:check: report-written
:expect: The file report.txt is empty

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("report.txt", "w") as file:
    file.write("")
```
````

````{attempt}
:id: report-one-line
:check: report-written
:expect: is on one line

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("report.txt", "w") as file:
    for category, total in category_totals.items():
        file.write(f"{category} {total:.2f} ")
    for month, total in month_totals.items():
        file.write(f"{month} {total:.2f} ")
```
````

````{attempt}
:id: report-no-categories
:check: report-written
:expect: No line of the file report.txt holds the category rent

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("report.txt", "w") as file:
    file.write("Where the money went\n")
    for month, total in month_totals.items():
        file.write(f"{month} {total:.2f}\n")
```
````

````{attempt}
:id: report-one-decimal
:check: report-written
:expect: no line holds both rent and its total 1950.00

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("report.txt", "w") as file:
    file.write("Where the money went\n")
    for category, total in category_totals.items():
        file.write(f"{category} {total:.1f}\n")
```
````

````{attempt}
:id: report-no-months
:check: report-written
:expect: No line of the file report.txt holds both the month 2026-01 and its total 917.20

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("report.txt", "w") as file:
    file.write("Where the money went\n")
    for category, total in category_totals.items():
        file.write(f"{category} {total:.2f}\n")
```
````

````{attempt}
:id: report-no-largest
:check: report-written
:expect: holds the description of the largest purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("report.txt", "w") as file:
    file.write("Where the money went\n")
    for category, total in category_totals.items():
        file.write(f"{category} {total:.2f}\n")
    for month, total in month_totals.items():
        file.write(f"{month} {total:.2f}\n")
```
````

````{attempt}
:id: report-largest-amount
:check: report-written
:expect: but it does not hold the amount 650.00

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("report.txt", "w") as file:
    file.write("Where the money went\n")
    for category, total in category_totals.items():
        file.write(f"{category} {total:.2f}\n")
    for month, total in month_totals.items():
        file.write(f"{month} {total:.2f}\n")
    file.write(f"{largest['description']} {largest['amount']:.0f}\n")
```
````

````{attempt}
:id: report-no-over
:check: report-written
:expect: holds the month 2026-01 together with

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("report.txt", "w") as file:
    file.write("Where the money went\n")
    for category, total in category_totals.items():
        file.write(f"{category} {total:.2f}\n")
    for month, total in month_totals.items():
        file.write(f"{month} {total:.2f}\n")
    file.write(f"{largest['description']} {largest['amount']:.2f}\n")
```
````

````{attempt}
:id: report-every-category
:check: report-written
:expect: holds the month 2026-01 together with

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("report.txt", "w") as file:
    file.write("Where the money went\n")
    for category, total in category_totals.items():
        file.write(f"{category} {total:.2f}\n")
    for month, total in month_totals.items():
        file.write(f"{month} {total:.2f}\n")
    file.write(f"{largest['description']} {largest['amount']:.2f}\n")
    for month in over_by_month:
        file.write(f"{month} {sorted(budgets)}\n")
```
````

````{attempt}
:id: report-other-way
:check: report-written
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("report.txt", "w") as file:
    file.write("Report for Mariam\n\n")
    for category in category_totals:
        file.write(f"Total for {category}: {category_totals[category]:.2f}\n")
    for month in month_totals:
        file.write(f"Total for {month}: {month_totals[month]:.2f}\n")
        file.write(f"Over the budget in {month}: {over_by_month[month]}\n")
    file.write(f"The largest purchase was {largest['description']}, {largest['amount']:.2f}, on {largest['date']}.\n")

print("The report is in the file report.txt.")
```
````

```{file-open}
:id: show-report
:title: Show the file report.txt under the notebook
:path: report.txt
:area: data
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

````{hint}
:title: Show me a solution
:unlock: "report-written" in failed_checks or "report-written" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.
Then click the action above again, to see the report that the solution
wrote.

```{cell-insert}
:id: insert-report-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [report-solution]
:run: true
with open("report.txt", "w") as file:
    file.write("Where the money went\n")
    file.write("\n")
    file.write("Total for each category\n")
    for category, total in category_totals.items():
        file.write(f"{category} {total:.2f}\n")
    file.write("\n")
    file.write("Total for each month\n")
    for month, total in month_totals.items():
        file.write(f"{month} {total:.2f}\n")
    file.write("\n")
    file.write("Largest purchase\n")
    file.write(f"{largest['date']} {largest['description']} {largest['amount']:.2f}\n")
    file.write("\n")
    file.write("Over the budget\n")
    for month, names in over_by_month.items():
        file.write(f"{month} {names}\n")

print("The report is in the file report.txt.")
```
````

```{verify}
:id: report-written
:label: The file report.txt holds the four answers
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed report; cell-executed report-solution
def _workshop_check():
    try:
        with open("report.txt") as file:
            text = file.read()
    except FileNotFoundError:
        print("The file report.txt does not exist yet. Write your code under the comment in the new cell. It opens the file with open(\"report.txt\", \"w\") and writes to it. Check the spelling of the name of the file. Then hold Shift and press Enter to run the cell.")
        return False
    except Exception as error:
        print(f"The check could not read the file report.txt. Python stopped with an error of the type {type(error).__name__}. Write the file again with your cell: open it with open(\"report.txt\", \"w\") and write strings to it. Then run the cell again.")
        return False
    lines = [line.strip() for line in text.splitlines() if line.strip()]
    if len(lines) == 0:
        print("The file report.txt is empty. Inside the with block, write each line of the report with file.write(). Check that the lines with file.write() start with four spaces, so that they are in the with block. Then run the cell again.")
        return False
    if len(lines) == 1:
        print("All the text of the file report.txt is on one line. The method write() does not end the line. End each string that must end a line with the newline character, which is written \\n, for example: file.write(\"Largest purchase\\n\"). Then run the cell again.")
        return False
    categories = [("rent", "1950.00"), ("food", "445.60"), ("transport", "181.30"), ("phone", "54.00"), ("hobbies", "63.49"), ("clothes", "140.40")]
    for name, total in categories:
        named = [line for line in lines if name in line]
        if len(named) == 0:
            print(f"No line of the file report.txt holds the category {name}. Write one line for each category, in a loop over category_totals.items(). Each line holds the name of the category and its total. Then run the cell again.")
            return False
        if not any(total in line for line in named):
            print(f"The file report.txt has the line \"{named[0]}\" for that category. But no line holds both {name} and its total {total}. Write the total with two decimal places. " + "In an f-string, that is {total:.2f} and the line that writes is: file.write(f\"{category} {total:.2f}\\n\"). Then run the cell again.")
            return False
    for month, total in [("2026-01", "917.20"), ("2026-02", "942.34"), ("2026-03", "975.25")]:
        if not any(month in line and total in line for line in lines):
            print(f"The totals of the categories are correct. No line of the file report.txt holds both the month {month} and its total {total}. Write one line for each month, in a loop over month_totals.items(). " + "Write the total with two decimal places: file.write(f\"{month} {total:.2f}\\n\"). Then run the cell again.")
            return False
    described = [line for line in lines if "Rent for" in line]
    if len(described) == 0:
        print("The totals of the categories and of the months are correct. No line of the file report.txt holds the description of the largest purchase, which starts with the words Rent for. Write one line that holds largest[\"description\"] and the amount. Then run the cell again.")
        return False
    if not any("650.00" in line for line in described):
        print(f"The file report.txt has the line \"{described[0]}\" in it. The line holds the description of the largest purchase, but it does not hold the amount 650.00 with two decimal places. " + "In an f-string, write the amount as {largest['amount']:.2f} with single quotes around the key. Then run the cell again.")
        return False
    names = [name for name, total in categories]
    for month, expected in [("2026-01", ["clothes"]), ("2026-02", ["food"]), ("2026-03", ["clothes", "transport"])]:
        found = [[name for name in names if name in line] for line in lines if month in line]
        if not any(sorted(group) == expected for group in found):
            print(f"The totals and the largest purchase are correct. No line of the file report.txt holds the month {month} together with the categories that were over their budget in that month, and no other category. For {month} that is: {', '.join(expected)}. Write one line for each month, in a loop over over_by_month.items(). " + "The line that writes is: file.write(f\"{month} {names}\\n\"). Then run the cell again.")
            return False
    print("Correct. The file report.txt holds the total for each category, the total for each month, the largest purchase, and the categories that were over their budget in each month.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

Your program is complete. It reads an untidy file of purchases and a
file of budgets, and it writes a report that answers the four
questions. When Mariam adds the purchases of April to her file, she
runs the same cells again, and the report is new.
