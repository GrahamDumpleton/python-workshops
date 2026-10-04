---
title: When a loop is clearer
requires: [verify:short-form-ran, quiz:which-suits, verify:tidy-notes-list]
---

# When a loop is clearer

A comprehension is not always the best choice. It is one line, and
one line can hold only a small amount of work before it becomes
difficult to read. When that happens, the loop is the better way to
write the same work.

This matters because people read code many more times than they write
it. You read your own code again next week, and other people read it
too. Code that is short but difficult to read costs more time than it
saves.

Compare a note that you leave for a friend. "Buy bread" is fine as
one short line. But the directions to your home, with six turns, are
clearer as a list of steps than as one very long sentence.

Click the action below. It adds a cell with a list of notes that
someone typed without care. Some notes have spaces at the beginning or
at the end, some have capital letters, and one note holds only
spaces. The list comprehension in the cell cleans the notes, and the
action runs the cell.

```{attempt}
:id: short-form-not-run
:check: short-form-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-short-form
:title: Add a cell that cleans a list of notes in one long line, and run it
:path: {{ notebook }}
:tags: [short-form]
:run: true
notes = ["  Buy rice ", "CALL Omar", "   ", "  pay rent  "]
short_form = [note.strip().lower() for note in notes if len(note.strip()) > 0]
print(short_form)
```

The output is:

```
['buy rice', 'call omar', 'pay rent']
```

```{verify}
:id: short-form-ran
:label: The long list comprehension cleaned the notes
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed short-form
if globals().get("notes") == ["  Buy rice ", "CALL Omar", "   ", "  pay rent  "] and globals().get("short_form") == ["buy rice", "call omar", "pay rent"]:
    print("The cell ran. The name short_form refers to the list of three clean notes.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("notes") == ["  Buy rice ", "CALL Omar", "   ", "  pay rent  "] and globals().get("short_form") == ["buy rice", "call omar", "pay rent"]
```

## What happened

The method `.strip()` gives a string without the spaces at its
beginning and its end. The method `.lower()` gives a string with
every letter as a small letter.

The list comprehension is correct, and Python runs it without an
error. The problem is for the person who reads it:

- The line is long. In the cell, it may not fit in the width of the
  notebook.

- The reader must find the three parts, and remember all three at the
  same time.

- The code `note.strip()` is written two times, so Python removes the
  spaces of each note two times. In one line there is no place to
  give the result a name and use it again.

A loop can do the work in steps, and give a name to the result of
the first step:

```python
notes = ["  Buy rice ", "CALL Omar", "   ", "  pay rent  "]
clean = []
for note in notes:
    text = note.strip()
    if len(text) > 0:
        clean.append(text.lower())
print(clean)
```

The loop has more lines, but each line does one small thing, and you
can read the lines one at a time.

## How to choose

Use a comprehension when all of these are true:

- You are building a new list or a new dictionary.

- Each new item is made with one short expression.

- You can say the whole line in one short sentence, such as "the
  prices above 10, minus 5".

Use a loop when one of these is true:

- The work for each item needs more than one step, or a name for a
  result in the middle.

- The line becomes so long that you must read it several times to
  understand it.

- You are not building a list or a dictionary. To show each item with
  `print()`, or to add up a total, use a loop. A comprehension always
  builds a new list or dictionary, so do not use one when you do not
  need a new list or dictionary.

When you are not sure, write the loop. A loop is never wrong. You can
change it to a comprehension later, when you see that it has the
three parts: an empty list, a loop, and `.append()`.

```{quiz}
:id: which-suits
:title: A comprehension or a loop
question: Which of these three pieces of work is a good use of a list comprehension?
options:
  - { text: "Show each name of a list of guests on a line of its own, with `print()`", explanation: "This work does not build a new list. It only shows each item. A loop with `print()` in its block is the clear way to do it." }
  - { text: "Build a list of the lengths of the words in a list of words", correct: true }
  - { text: "For each line of a list of text lines: remove the spaces, split the line into words, test three conditions, and then add one of two different results to a new list", explanation: "This work has many steps for each item. One line cannot hold them and stay readable. A loop is clearer, because it does one step on each line." }
explanation: "A list of lengths is a new list, and each new item is one short expression: `len(word)`. That is the work that a list comprehension does well: `[len(word) for word in words]`."
```

## Your task

Write the list comprehension of this page as a loop yourself, with
your own names. The cell that you ran above made the name `notes`,
and your program uses that list. You do not need to type the list
again.

Your program must do these three things, in this order:

1. Give the name `tidy_notes` to an empty list.

2. Use a `for` loop over `notes`. In each pass, remove the spaces at
   the beginning and the end of the note with `.strip()`. When the
   result has more than 0 characters, change it to small letters with
   `.lower()`, and add it to the end of `tidy_notes` with `.append()`.

3. After the loop, show the value of `tidy_notes` with `print()`.

When the program is correct, the output under the cell is the same as
the output of the list comprehension:

```
['buy rice', 'call omar', 'pay rent']
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-tidy-notes
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [tidy-notes]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program. The
lines in the block of the loop begin with four spaces, and the line
under the `if` begins with eight spaces. To write the `print()` line
after the loop, remove the spaces at the beginning of the line. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Look at the loop in the section "What happened" on this page. Your
program has the same lines. Use the name `tidy_notes` for the new
list. You can keep the names `note` and `text`, or choose your own.
```

```{hint}
:title: Hint: the block of the loop
The block has three lines. The first line removes the spaces and
gives the result a name: `text = note.strip()`. The second line is
the test: `if len(text) > 0:`. The third line begins with eight
spaces, and adds the note in small letters:
`tidy_notes.append(text.lower())`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: tidy-notes-not-started
:check: tidy-notes-list
:expect: The name tidy_notes does not exist yet
```

````{attempt}
:id: tidy-notes-not-a-list
:check: tidy-notes-list
:expect: is not a list

```{cell-insert}
:path: {{ notebook }}
:run: true
tidy_notes = "buy rice"
print(tidy_notes)
```
````

````{attempt}
:id: tidy-notes-empty
:check: tidy-notes-list
:expect: The list tidy_notes is empty

```{cell-insert}
:path: {{ notebook }}
:run: true
tidy_notes = []
for note in notes:
    text = note.strip()
print(tidy_notes)
```
````

````{attempt}
:id: tidy-notes-no-test
:check: tidy-notes-list
:expect: The list tidy_notes holds an empty string

```{cell-insert}
:path: {{ notebook }}
:run: true
tidy_notes = []
for note in notes:
    text = note.strip()
    tidy_notes.append(text.lower())
print(tidy_notes)
```
````

````{attempt}
:id: tidy-notes-no-lower
:check: tidy-notes-list
:expect: still have capital letters

```{cell-insert}
:path: {{ notebook }}
:run: true
tidy_notes = []
for note in notes:
    text = note.strip()
    if len(text) > 0:
        tidy_notes.append(text)
print(tidy_notes)
```
````

````{attempt}
:id: tidy-notes-no-strip
:check: tidy-notes-list
:expect: still have spaces

```{cell-insert}
:path: {{ notebook }}
:run: true
tidy_notes = []
for note in notes:
    if len(note.strip()) > 0:
        tidy_notes.append(note.lower())
print(tidy_notes)
```
````

````{attempt}
:id: tidy-notes-list-inside-loop
:check: tidy-notes-list
:expect: holds only the last note

```{cell-insert}
:path: {{ notebook }}
:run: true
for note in notes:
    tidy_notes = []
    text = note.strip()
    if len(text) > 0:
        tidy_notes.append(text.lower())
print(tidy_notes)
```
````

````{attempt}
:id: tidy-notes-wrong-test
:check: tidy-notes-list
:expect: but it must refer to ['buy rice', 'call omar', 'pay rent']

```{cell-insert}
:path: {{ notebook }}
:run: true
tidy_notes = []
for note in notes:
    text = note.strip()
    if len(text) > 8:
        tidy_notes.append(text.lower())
print(tidy_notes)
```
````

````{attempt}
:id: tidy-notes-notes-changed
:check: tidy-notes-list
:expect: The name notes does not refer to the list of four notes

```{cell-insert}
:path: {{ notebook }}
:run: true
notes = ["buy rice"]
```
````

````{attempt}
:id: tidy-notes-other-way
:check: tidy-notes-list
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
notes = ["  Buy rice ", "CALL Omar", "   ", "  pay rent  "]
tidy_notes = []
for entry in notes:
    small = entry.lower().strip()
    if small != "":
        tidy_notes.append(small)
print(tidy_notes)
```
````

````{hint}
:title: Show me a solution
:unlock: "tidy-notes-list" in failed_checks or "tidy-notes-list" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-tidy-notes-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [tidy-notes-solution]
:run: true
tidy_notes = []
for note in notes:
    text = note.strip()
    if len(text) > 0:
        tidy_notes.append(text.lower())
print(tidy_notes)
```
````

```{verify}
:id: tidy-notes-list
:label: Your loop builds the same list as the list comprehension
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed tidy-notes; cell-executed tidy-notes-solution
if globals().get("notes") != ["  Buy rice ", "CALL Omar", "   ", "  pay rent  "]:
    print("The name notes does not refer to the list of four notes. Go to the top of this page, and click the action that adds the cell with the notes and runs it. Then run your own cell again.")
elif "tidy_notes" not in globals():
    print("The name tidy_notes does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes an empty list: tidy_notes = []. Then hold Shift and press Enter to run the cell.")
elif type(tidy_notes) is not list:
    print(f"The name tidy_notes refers to {tidy_notes!r}, which is not a list. Begin with an empty list, tidy_notes = [], and add each clean note inside the loop with tidy_notes.append(). Then run the cell again.")
elif tidy_notes == ["buy rice", "call omar", "pay rent"]:
    print("Correct. Your loop built the list ['buy rice', 'call omar', 'pay rent'], which is the same list that the list comprehension built.")
elif tidy_notes == []:
    print("The list tidy_notes is empty, so the loop does not add anything to it. Inside the loop, under the if line, add the clean note to the list: tidy_notes.append(text.lower()). Then run the cell again.")
elif "" in tidy_notes:
    print("The list tidy_notes holds an empty string. It comes from the note that has only spaces. Add the note to the list only when it has more than 0 characters after .strip(): write the line if len(text) > 0: above the .append() line, and give the .append() line eight spaces. Then run the cell again.")
elif tidy_notes == ["pay rent"]:
    print("The list tidy_notes holds only the last note. The line tidy_notes = [] is probably inside the loop, so every pass starts again with an empty list. Move that line before the loop, so that it runs one time. Then run the cell again.")
elif [entry.lower() for entry in tidy_notes if type(entry) is str] == ["buy rice", "call omar", "pay rent"]:
    print(f"The name tidy_notes refers to {tidy_notes!r}. The notes are the correct three, but they still have capital letters. Use .lower() on the note when you add it to the list: tidy_notes.append(text.lower()). Then run the cell again.")
elif [entry.strip() for entry in tidy_notes if type(entry) is str] == ["buy rice", "call omar", "pay rent"]:
    print(f"The name tidy_notes refers to {tidy_notes!r}. The notes are the correct three, but they still have spaces at the beginning or the end. Add the result of .strip() to the list, and not the note itself. Then run the cell again.")
else:
    print(f"The name tidy_notes refers to {tidy_notes!r} but it must refer to ['buy rice', 'call omar', 'pay rent']. Compare your loop with the loop in the section What happened on this page. Then run the cell again.")
globals().get("notes") == ["  Buy rice ", "CALL Omar", "   ", "  pay rent  "] and type(globals().get("tidy_notes")) is list and tidy_notes == ["buy rice", "call omar", "pay rent"]
```
