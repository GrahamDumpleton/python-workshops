---
title: Adding to a file
requires: [verify:notes-added, verify:april-written]
---

# Adding to a file

The mode `"w"` removes the old text of a file. Often that is not what
a program needs. When Mariam makes a new purchase, the program must
keep the purchases that the file already holds, and put the new
purchase after them.

Think of a diary. Each day you write a new entry under the entry of
the day before. You do not remove the old pages first.

For this, `open()` has another mode: `"a"`. The letter `a` is the
first letter of "append", which means to add at the end. You know the
word from the method `append()` of a list, which adds an item at the
end of the list.

- `open("notes.txt", "a")` opens the file to add text at its end. The
  old text stays. If no file has that name, Python makes a new, empty
  file, as it does with the mode `"w"`.

The method `write()` works in the same way as before.

## Add a line

The file `notes.txt` holds one line now: `Call Chidi`. Click the
action below. It adds a cell that adds a second line to the file, and
runs it.

```{attempt}
:id: notes-not-added
:check: notes-added
:expect: The file notes.txt does not hold the added line yet
```

```{cell-insert}
:id: insert-notes-add
:title: Add a cell that adds a line to the file, and run it
:path: {{ notebook }}
:tags: [notes-add]
:run: true
with open("notes.txt", "a") as file:
    file.write("Visit Aiko\n")
```

```{verify}
:id: notes-added
:label: The cell added a line to the file notes.txt
:substrate: contents
:trigger: cell-executed notes-add
:message: The file notes.txt does not hold the added line yet. Click the action above to add the cell and run it.
cell-executed {{ notebook }} notes-add
contains notes.txt Visit Aiko
```

Click the action below to make the editor read the file again.

```{file-open}
:id: open-notes-added
:title: Show the new text of the file notes.txt
:path: notes.txt
:area: data
```

The file now holds two lines:

```
Call Chidi
Visit Aiko
```

The old line stayed, and the new line is after it.

The mode `"a"` adds text every time the code runs. If you run the cell
again, the file gets a third line, which is `Visit Aiko` again. Python
does not test whether the file already holds the line.

## The three modes

| Code | What it does | The old text of the file |
|------|--------------|--------------------------|
| `open(name)` | opens the file to read it | stays |
| `open(name, "w")` | opens the file to write it | is removed |
| `open(name, "a")` | opens the file to add text at its end | stays |

## Your task

It is April, and Mariam starts a new file for the new month. Your code
makes the file, and then adds two purchases to it.

Write a cell that does these three things, in this order:

1. It opens the file `april.csv` with the mode `"w"`, and writes this
   line:

   ```
   date,description,amount,category
   ```

2. It opens the file `april.csv` again, with the mode `"a"`, and
   writes this line:

   ```
   2026-04-01,Rent for April,650.00,rent
   ```

3. It opens the file `april.csv` again, with the mode `"a"`, and
   writes this line:

   ```
   2026-04-02,Bread and milk,6.40,food
   ```

So your cell has three `with` blocks, one under the other. Each line
that your code writes must end with a newline character.

Because the first `with` block uses the mode `"w"`, the file starts
empty every time the cell runs. So you can run the cell as many times
as you like, and the file always holds three lines at the end.

Your cell shows no output when it is correct. The check below reads
the file, and tells you what it found.

The action below adds a new cell for your code.

```{cell-insert}
:id: insert-april
:title: Add a cell for my code
:path: {{ notebook }}
:tags: [april]
:run: false
# Write your code on the lines below this one.

```

Click on the empty line under the comment, and type your code. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: what to look at
Each `with` block has two lines: the `with` line, and one `write()`
line under it. The first block has the same form as the cell that
wrote `notes.txt` on the page before. The second block and the third
block have the same form as the cell at the top of this page.
```

```{hint}
:title: Hint: the shape of the code
The first block is:

- `with open("april.csv", "w") as file:`

- under it, with four spaces at the start:
  `file.write("date,description,amount,category\n")`

The second block starts with no spaces at the start of the line:

- `with open("april.csv", "a") as file:`

- under it, with four spaces at the start:
  `file.write("2026-04-01,Rent for April,650.00,rent\n")`

The third block has the same form as the second block, with the other
purchase.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: april-not-started
:check: april-written
:expect: The file april.csv does not exist yet
```

````{attempt}
:id: april-all-w
:check: april-written
:expect: holds only the last line

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("april.csv", "w") as file:
    file.write("date,description,amount,category\n")
with open("april.csv", "w") as file:
    file.write("2026-04-01,Rent for April,650.00,rent\n")
with open("april.csv", "w") as file:
    file.write("2026-04-02,Bread and milk,6.40,food\n")
```
````

````{attempt}
:id: april-all-a
:check: april-written
:expect: but it must hold 3 lines

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("april.csv", "a") as file:
    file.write("date,description,amount,category\n")
with open("april.csv", "a") as file:
    file.write("2026-04-01,Rent for April,650.00,rent\n")
with open("april.csv", "a") as file:
    file.write("2026-04-02,Bread and milk,6.40,food\n")
```
````

````{attempt}
:id: april-no-newline
:check: april-written
:expect: The method write() does not end a line

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("april.csv", "w") as file:
    file.write("date,description,amount,category")
with open("april.csv", "a") as file:
    file.write("2026-04-01,Rent for April,650.00,rent")
with open("april.csv", "a") as file:
    file.write("2026-04-02,Bread and milk,6.40,food")
```
````

````{attempt}
:id: april-two-lines
:check: april-written
:expect: holds 2 lines, but it must hold 3 lines

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("april.csv", "w") as file:
    file.write("date,description,amount,category\n")
with open("april.csv", "a") as file:
    file.write("2026-04-01,Rent for April,650.00,rent\n")
```
````

````{attempt}
:id: april-other-text
:check: april-written
:expect: Line 3 of the file is

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("april.csv", "w") as file:
    file.write("date,description,amount,category\n")
with open("april.csv", "a") as file:
    file.write("2026-04-01,Rent for April,650.00,rent\n")
with open("april.csv", "a") as file:
    file.write("2026-04-02,Bread and milk,6.4,food\n")
```
````

````{hint}
:title: Show me a solution
:unlock: "april-written" in failed_checks or "april-written" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-april-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [april-solution]
:run: true
with open("april.csv", "w") as file:
    file.write("date,description,amount,category\n")

with open("april.csv", "a") as file:
    file.write("2026-04-01,Rent for April,650.00,rent\n")

with open("april.csv", "a") as file:
    file.write("2026-04-02,Bread and milk,6.40,food\n")
```
````

```{verify}
:id: april-written
:label: The file april.csv holds the three lines
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed april; cell-executed april-solution
def _workshop_check():
    expected = ["date,description,amount,category", "2026-04-01,Rent for April,650.00,rent", "2026-04-02,Bread and milk,6.40,food"]
    try:
        with open("april.csv") as file:
            text = file.read()
    except OSError:
        print("The file april.csv does not exist yet. Write your code under the comment in the new cell, and check the name of the file in each call of open(). Then hold Shift and press Enter to run the cell.")
        return False
    lines = [line.strip() for line in text.splitlines()]
    if lines == expected:
        print("Correct. The file april.csv holds the first line and the two purchases. The mode \"w\" started the file, and the mode \"a\" added to it.")
        return True
    if text.strip() == "":
        print("The file april.csv exists, but it is empty. Each with block needs a line under it that calls file.write() with a string. Then run the cell again.")
        return False
    if lines == expected[2:]:
        print("The file april.csv holds only the last line, and the two lines before it are gone. That happens when every with line uses the mode \"w\", because each one removes what the one before wrote. Only the first with line uses \"w\". The second and the third must use \"a\". Then run the cell again.")
        return False
    if len(lines) == 1 and "category" in lines[0] and "Rent" in lines[0]:
        print("The file april.csv holds all the text in one line. The method write() does not end a line. Put the newline character at the end of each string, inside the quotes, such as \"date,description,amount,category\\n\". Then run the cell again.")
        return False
    if len(lines) > 3:
        print(f"The file april.csv holds {len(lines)} lines, but it must hold 3 lines. The mode \"a\" adds text every time the cell runs, so the file becomes longer each time. The first with line must use the mode \"w\", so that the file starts empty each time. Then run the cell again.")
        return False
    if len(lines) < 3:
        print(f"The file april.csv holds {len(lines)} lines, but it must hold 3 lines: the line with the four names, and the two purchases. Write the with block that is missing. Then run the cell again.")
        return False
    for number in range(3):
        if lines[number] != expected[number]:
            print(f"Line {number + 1} of the file is {lines[number]!r} but it must be {expected[number]!r}. Check every character of the string. Then run the cell again.")
            return False
    return False
globals().pop("_workshop_check")()
```

Click the action below to see the file that your code wrote.

```{file-open}
:id: open-april
:title: Show the file april.csv under the notebook
:path: april.csv
:area: data
```

The new file has the same form as `spending.csv`: a first line with
the four names, and then one purchase on each line. The code from the
page **Text into numbers** can read it and add it up.
