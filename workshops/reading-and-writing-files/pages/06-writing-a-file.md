---
title: Writing a file
requires: [verify:notes-written, quiz:predict-replace, verify:notes-replaced, verify:summary-written]
---

# Writing a file

To **write** a file means to put text into it. A program writes a file
to keep a result. Your code found that Mariam spent 2834.79. That
number is held by a name in the notebook, and Python forgets it when
the notebook is closed. If the code writes the number in a file, the
number is still there tomorrow, and another program can read it.

## The mode

The function `open()` can take a second argument, which is the
**mode**: a short string that says what the program wants to do with
the file.

- `open("notes.txt")`, with no mode, opens the file to read it. This
  is what you have used until now.

- `open("notes.txt", "w")` opens the file to write it. The letter `w`
  is the first letter of "write". If no file has that name, Python
  makes a new, empty file.

The method `write()` of the open file takes a string, and puts it at
the end of what the code has written until now.

There is one difference from `print()` that is important. `print()`
moves to a new line after each value. `write()` does not. It writes
exactly the characters of the string, and nothing more. To end a line,
you put the newline character `\n` at the end of the string yourself.

Click the action below. It adds a cell that writes two lines in a new
file with the name `notes.txt`, and runs it.

```{attempt}
:id: notes-not-written
:check: notes-written
:expect: The file notes.txt does not hold the two lines yet
```

```{cell-insert}
:id: insert-notes
:title: Add a cell that writes a new file, and run it
:path: {{ notebook }}
:tags: [notes]
:run: true
with open("notes.txt", "w") as file:
    file.write("Pay the rent\n")
    file.write("Buy a bus pass\n")
```

The cell shows no output. Its result is not in the notebook: it is the
new file.

```{verify}
:id: notes-written
:label: The cell wrote two lines in the file notes.txt
:substrate: contents
:trigger: cell-executed notes
:message: The file notes.txt does not hold the two lines yet. Click the action above to add the cell and run it.
cell-executed {{ notebook }} notes
exists notes.txt
```

Click the action below to see the new file. It opens in the part under
the notebook, in a new tab beside the other files.

```{file-open}
:id: open-notes
:title: Show the file notes.txt under the notebook
:path: notes.txt
:area: data
```

## What happened

| Line | What Python did |
|------|-----------------|
| `with open("notes.txt", "w") as file:` | made the new file `notes.txt`, and opened it to write |
| `file.write("Pay the rent\n")` | wrote the text `Pay the rent`, and then a newline character, which ends the first line |
| `file.write("Buy a bus pass\n")` | wrote the second line in the same way |
| the end of the block | closed the file |

To close the file is more important when you write than when you read.
Python may keep the text for a moment before it puts the text in the
file. The text is certain to be in the file only after the file is
closed. The `with` block closes the file for you, so the text is saved
when the block ends.

## The mode "w" replaces the file

What happens when the file already exists? Look at this cell. Do not
run it yet.

```python
with open("notes.txt", "w") as file:
    file.write("Call Chidi\n")
```

```{quiz}
:id: predict-replace
:title: Predict what the file holds
question: "The file `notes.txt` holds two lines now. How many lines does it hold after this cell has run?"
options:
  - { text: "Three lines: the two old lines and the new line", explanation: "That is what many people expect. But the mode `\"w\"` does not keep the old text." }
  - { text: "One line: the new line only", correct: true }
  - { text: "Two lines: the new line replaces only the first line", explanation: "The mode `\"w\"` does not replace one line. It removes all the old text of the file." }
explanation: "When Python opens a file with the mode `\"w\"`, it first removes everything that the file holds. The code then writes into an empty file. So the file holds only the new line."
```

Now run the cell, and then show the file again.

```{attempt}
:id: notes-not-replaced
:check: notes-replaced
:expect: The file notes.txt does not hold the new line yet
```

```{cell-insert}
:id: insert-notes-again
:title: Add a cell that writes the same file again, and run it
:path: {{ notebook }}
:tags: [notes-again]
:run: true
with open("notes.txt", "w") as file:
    file.write("Call Chidi\n")
```

```{verify}
:id: notes-replaced
:label: The cell replaced the text of the file notes.txt
:substrate: contents
:trigger: cell-executed notes-again
:message: The file notes.txt does not hold the new line yet. Click the action above to add the cell and run it.
cell-executed {{ notebook }} notes-again
contains notes.txt Call Chidi
```

The editor does not follow a file that changes. It still shows the old
text. Click the action below to make the editor read the file again.

```{file-open}
:id: open-notes-again
:title: Show the new text of the file notes.txt
:path: notes.txt
:area: data
```

The two old lines are gone. Python gave no warning, and nothing can
restore the old text.

So be careful with the mode `"w"`. Use it only with the name of a file
that your program makes itself. Never open a file of data, such as
`spending.csv`, with the mode `"w"`.

## Your task

Save the result of your work in a file.

Write a cell that makes a file with the name `summary.txt`. The file
must hold exactly these two lines:

```
Purchases: 37
Total: 2834.79
```

Each of the two lines must end with a newline character.

Your cell shows no output when it is correct. The check below reads
the file, and tells you what it found.

The action below adds a new cell for your code.

```{cell-insert}
:id: insert-summary
:title: Add a cell for my code
:path: {{ notebook }}
:tags: [summary]
:run: false
# Write your code on the lines below this one.

```

Click on the empty line under the comment, and type your code. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: what to look at
Look at the first cell on this page, which writes two lines in
`notes.txt`. Your cell has the same form: one `with` line, and two
`write()` lines under it. The name of the file and the two strings are
different.
```

```{hint}
:title: Hint: the shape of the code
1. `with open("summary.txt", "w") as file:`

2. Under it, with four spaces at the start:
   `file.write("Purchases: 37\n")`. The `\n` is inside the quotes, at
   the end of the string.

3. A second `write()` line of the same form, for the line
   `Total: 2834.79`.

Use only one `with` line. If you open the file two times with the mode
`"w"`, the second time removes what the first time wrote.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: summary-not-started
:check: summary-written
:expect: The file summary.txt does not exist yet
```

````{attempt}
:id: summary-empty
:check: summary-written
:expect: The file summary.txt exists, but it is empty

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("summary.txt", "w") as file:
    summary_line = "Purchases: 37\n"
```
````

````{attempt}
:id: summary-no-newline
:check: summary-written
:expect: holds only one line

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("summary.txt", "w") as file:
    file.write("Purchases: 37")
    file.write("Total: 2834.79")
```
````

````{attempt}
:id: summary-opened-twice
:check: summary-written
:expect: holds only the line Total: 2834.79

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("summary.txt", "w") as file:
    file.write("Purchases: 37\n")
with open("summary.txt", "w") as file:
    file.write("Total: 2834.79\n")
```
````

````{attempt}
:id: summary-other-text
:check: summary-written
:expect: Line 2 of the file is

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("summary.txt", "w") as file:
    file.write("Purchases: 37\n")
    file.write("Total 2834.79\n")
```
````

````{attempt}
:id: summary-other-way
:check: summary-written
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("summary.txt", "w") as file:
    file.write("Purchases: 37\nTotal: 2834.79\n")
```
````

````{hint}
:title: Show me a solution
:unlock: "summary-written" in failed_checks or "summary-written" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-summary-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [summary-solution]
:run: true
with open("summary.txt", "w") as file:
    file.write("Purchases: 37\n")
    file.write("Total: 2834.79\n")
```
````

```{verify}
:id: summary-written
:label: The file summary.txt holds the two lines
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed summary; cell-executed summary-solution
def _workshop_check():
    expected = ["Purchases: 37", "Total: 2834.79"]
    try:
        with open("summary.txt") as file:
            text = file.read()
    except OSError:
        print("The file summary.txt does not exist yet. Write your code under the comment in the new cell, and check the name of the file in the call of open(). The mode must be \"w\". Then hold Shift and press Enter to run the cell.")
        return False
    lines = [line.strip() for line in text.splitlines()]
    if lines == expected:
        print("Correct. The file summary.txt holds the two lines, and it stays when the notebook is closed.")
        return True
    if text.strip() == "":
        print("The file summary.txt exists, but it is empty. open() with the mode \"w\" makes the file, and the method write() puts text in it. Add two lines inside the with block that call file.write() with a string. Then run the cell again.")
        return False
    if len(lines) == 1 and "Purchases" in lines[0] and "Total" in lines[0]:
        print(f"The file summary.txt holds only one line: {lines[0]} The method write() does not end a line. Put the newline character at the end of each string, inside the quotes: file.write(\"Purchases: 37\\n\"). Then run the cell again.")
        return False
    if lines == expected[1:]:
        print("The file summary.txt holds only the line Total: 2834.79 and the line Purchases: 37 is gone. That happens when the code opens the file two times with the mode \"w\", because the second time removes what the first time wrote. Use one with line, and put both write() lines under it. Then run the cell again.")
        return False
    if len(lines) != 2:
        print(f"The file summary.txt holds {len(lines)} lines, but it must hold 2 lines. The first line is Purchases: 37 and the second line is Total: 2834.79. Then run the cell again.")
        return False
    for number in range(2):
        if lines[number] != expected[number]:
            print(f"Line {number + 1} of the file is {lines[number]!r} but it must be {expected[number]!r}. Check every letter, the colon and the space. Then run the cell again.")
            return False
    return False
globals().pop("_workshop_check")()
```

Click the action below to see the file that your code wrote.

```{file-open}
:id: open-summary
:title: Show the file summary.txt under the notebook
:path: summary.txt
:area: data
```

In this task you typed the two numbers. A real program writes the
values that it calculated. With an f-string, the second line is
`file.write(f"Total: {spending_total:.2f}\n")`, and the file then
always holds the total that the code found.
