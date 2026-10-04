---
title: What you have learned
---

# What you have learned

Your programs can now use data that lasts longer than the program. You
have read the purchases of Mariam from a file, added them up, and
written the results in new files.

## The ideas

- A **file** is a place where a computer keeps data under a name. The
  data stays when the program ends.

- A program must **open** a file before it uses it, and **close** the
  file afterwards. A **`with` block** closes the file for you when the
  block ends.

- The method `read()` gives all the text of a file as one string. A
  `for` loop over an open file gives the lines one at a time.

- Each line that a program reads ends with a **newline character**,
  which you write as `\n`. The method `strip()` removes it.

- Everything that a program reads from a file is a string. `float()`
  and `int()` turn a string into a number, so that the code can
  calculate with it.

- The **mode** says what the program wants to do with the file. With
  no mode, the program reads. The mode `"w"` writes, and removes the
  old text of the file first. The mode `"a"` adds text at the end, and
  keeps the old text.

- The method `write()` does not end a line. You put `\n` at the end of
  the string yourself.

- A **path** is the text that says where a file is. A `Path` value can
  test whether the file exists, and can read or write all of its text
  in one line.

## The code

| Code | What it does |
|------|--------------|
| `with open("spending.csv") as file:` | opens the file to read it, and closes it when the block ends |
| `text = file.read()` | reads all the text of the file into one string |
| `for line in file:` | repeats its block one time for each line of the file |
| `line.strip()` | gives the line without the newline character at its end |
| `line.strip().split(",")` | gives a list of the fields of the line |
| `float("6.40")` | gives the float `6.4` |
| `int("37")` | gives the integer `37` |
| `with open("notes.txt", "w") as file:` | opens the file to write it, and removes its old text |
| `with open("notes.txt", "a") as file:` | opens the file to add text at its end |
| `file.write("Pay the rent\n")` | writes one line in the file |
| `from pathlib import Path` | gets `Path`, so that the code can use it |
| `Path("spending.csv").exists()` | gives `True` when the file exists |
| `Path("notes.txt").read_text()` | gives all the text of the file |
| `Path("notes.txt").write_text("Pay the rent\n")` | replaces the text of the file with the string |

## What comes next

The file `spending.csv` is clean: every line has four fields, and
every amount looks like a number. Real data is often not like that. A
person types a word where a number must be, or forgets a field. Then
`float()` stops with an error, and the program stops with it.

The next workshop, **When the data is wrong**, shows how a program
handles a line that it cannot read, and continues with the next line.

Click `Finish` at the bottom of this panel.
