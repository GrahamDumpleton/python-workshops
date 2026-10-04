---
title: Paths, and a shorter way
requires: [verify:paths-tested, verify:greeting-written, verify:report-written]
---

# Paths, and a shorter way

A **path** is the text that says where a file is. The simplest path is
the name of the file alone, such as `spending.csv`. Python then looks
for the file in the same place as your notebook. Every file in this
workshop is in that place, so every path in this workshop is a plain
name.

Until now, a path in your code was a string, and a string knows
nothing about files. Python also has a type of value that is made for
paths. Its name is `Path`. A `Path` value holds a path, and it has
methods that answer questions about the file and that read and write
the file.

Think of the address of a house, written on an envelope. The address
is not the house. But with the address, you can find whether the house
exists, and you can send something to it.

## Does the file exist?

If you open a file that does not exist to read it, Python stops with a
`FileNotFoundError`. A program can test first whether the file is
there. The method `exists()` of a `Path` gives `True` when the file
exists, and `False` when it does not.

The first line of the next cell is new: `from pathlib import Path`.
`Path` is not ready to use when Python starts. This line gets it from
a part of Python that has the name `pathlib`. The workshop **The
batteries included** explains `import`. For now, you need to know only
that this line must run one time before your code uses `Path`.

```{attempt}
:id: paths-not-tested
:check: paths-tested
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-exists
:title: Add a cell that tests whether two files exist, and run it
:path: {{ notebook }}
:tags: [exists]
:run: true
from pathlib import Path

data_path = Path("spending.csv")
savings_path = Path("savings.csv")

print(data_path.exists())
print(savings_path.exists())
```

The output is:

```
True
False
```

```{verify}
:id: paths-tested
:label: The cell tested whether two files exist
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed exists
if "Path" in globals() and "data_path" in globals() and "savings_path" in globals():
    print("The cell ran. The file spending.csv exists, and the file savings.csv does not exist.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
"Path" in globals() and "data_path" in globals() and "savings_path" in globals()
```

`Path("spending.csv")` makes a `Path` value from a string. The file
`spending.csv` is part of this workshop, so `exists()` gives `True`.
Nobody made a file with the name `savings.csv`, so `exists()` gives
`False`. Python did not stop with an error. It answered the question.

The result of `exists()` is a boolean, so you can use it in an `if`:
`if data_path.exists():`.

## Read and write in one line

A `Path` has two more methods that are useful for small files.

- `read_text()` opens the file, reads all of its text, closes the
  file, and gives back the text as one string.

- `write_text()` takes a string. It opens the file, removes the old
  text as the mode `"w"` does, writes the string, and closes the file.

Each method does in one line what a `with` block and a `read()` or a
`write()` do in two lines. You do not write `open()` and you do not
write `with`.

```{attempt}
:id: greeting-not-written
:check: greeting-written
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-greeting
:title: Add a cell that writes a file and reads it again, and run it
:path: {{ notebook }}
:tags: [greeting]
:run: true
greeting_path = Path("greeting.txt")
greeting_path.write_text("Good morning, Mariam\n")

greeting_text = greeting_path.read_text()
print(greeting_text)
```

The output is:

```
Good morning, Mariam

```

```{verify}
:id: greeting-written
:label: The cell wrote a file and read it again
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed greeting
if globals().get("greeting_text") == "Good morning, Mariam\n":
    print("The cell ran. It wrote the file greeting.txt, and the name greeting_text refers to the text that it read from the file.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("greeting_text") == "Good morning, Mariam\n"
```

The second line made the file `greeting.txt`. The fourth line read the
text from the file again. The output ends with an empty line, because
the text ends with a newline character, and `print()` then moves to a
new line again.

`write_text()` also gives back a value: the number of characters that
it wrote. You can ignore that number. Remember only that the text of
the file comes from `read_text()`, and not from `write_text()`.

When do you use which way? `read_text()` and `write_text()` are good
when you want all the text at one time. A `with` block is needed when
you read a file one line at a time, and when you add to a file with
the mode `"a"`.

## Your task

Write a short report about the spending of Mariam, with `Path`.

Write a cell that does these four things, in this order:

1. It gives the name `report_path` to a `Path` value for the file
   `report.txt`.

2. It writes this line to the file, with `write_text()`. The line must
   end with a newline character.

   ```
   Mariam spent 2834.79
   ```

3. It reads the text of the file with `read_text()`, and gives the
   name `report_text` to that string.

4. It shows the string with `print(report_text)`.

When your code is correct, the output under the cell is the line
`Mariam spent 2834.79`, and then an empty line.

The action below adds a new cell for your code.

```{cell-insert}
:id: insert-report
:title: Add a cell for my code
:path: {{ notebook }}
:tags: [report]
:run: false
# Write your code on the lines below this one.

```

Click on the empty line under the comment, and type your code. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: what to look at
Look at the cell above that writes `greeting.txt`. Your cell has the
same four lines. The name of the file, the text, and the two names
that you give are different.
```

```{hint}
:title: Hint: the shape of the code
1. `report_path = Path("report.txt")`

2. `report_path.write_text("Mariam spent 2834.79\n")`

3. A line that calls `report_path.read_text()`, and gives the name
   `report_text` to the result.

4. `print(report_text)`

If Python stops with a `NameError` that names `Path`, the line
`from pathlib import Path` has not run. Run the first cell of this
page again, or write that line at the top of your cell.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: report-not-started
:check: report-written
:expect: The name report_path does not exist yet
```

````{attempt}
:id: report-a-string
:check: report-written
:expect: refers to a string, and not to a Path value

```{cell-insert}
:path: {{ notebook }}
:run: true
report_path = "report.txt"
print(report_path)
```
````

````{attempt}
:id: report-other-name
:check: report-written
:expect: but it must hold report.txt

```{cell-insert}
:path: {{ notebook }}
:run: true
report_path = Path("report")
print(report_path)
```
````

````{attempt}
:id: report-no-file
:check: report-written
:expect: The file report.txt does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
report_path = Path("report.txt")
print(report_path.exists())
```
````

````{attempt}
:id: report-other-text
:check: report-written
:expect: but it must hold the line

```{cell-insert}
:path: {{ notebook }}
:run: true
report_path = Path("report.txt")
report_path.write_text("Mariam spent 2834.79 in three months\n")
```
````

````{attempt}
:id: report-no-text-name
:check: report-written
:expect: The name report_text does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
report_path = Path("report.txt")
report_path.write_text("Mariam spent 2834.79\n")
print(report_path.read_text())
```
````

````{attempt}
:id: report-count
:check: report-written
:expect: That is the number of characters

```{cell-insert}
:path: {{ notebook }}
:run: true
report_path = Path("report.txt")
report_text = report_path.write_text("Mariam spent 2834.79\n")
print(report_text)
```
````

````{attempt}
:id: report-text-other
:check: report-written
:expect: is not the text of the file

```{cell-insert}
:path: {{ notebook }}
:run: true
report_path = Path("report.txt")
report_path.write_text("Mariam spent 2834.79\n")
report_text = "Mariam spent"
print(report_text)
```
````

````{hint}
:title: Show me a solution
:unlock: "report-written" in failed_checks or "report-written" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-report-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [report-solution]
:run: true
from pathlib import Path

report_path = Path("report.txt")
report_path.write_text("Mariam spent 2834.79\n")

report_text = report_path.read_text()
print(report_text)
```
````

```{verify}
:id: report-written
:label: Your code wrote the file report.txt and read it again
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed report; cell-executed report-solution
def _workshop_check():
    import pathlib
    if "report_path" not in globals():
        print("The name report_path does not exist yet. Write your code under the comment in the new cell. The first line is report_path = Path(\"report.txt\"). Then hold Shift and press Enter to run the cell.")
        return False
    path = globals()["report_path"]
    if isinstance(path, str):
        print("The name report_path refers to a string, and not to a Path value. A string has no method write_text(). Make a Path value from the string: report_path = Path(\"report.txt\"). Then run the cell again.")
        return False
    if not isinstance(path, pathlib.PurePath):
        print(f"The name report_path refers to a value of the type {type(path).__name__}, and not to a Path value. Write report_path = Path(\"report.txt\"). Then run the cell again.")
        return False
    if str(path) != "report.txt":
        print(f"The Path value report_path holds the path {str(path)} but it must hold report.txt. Check the string in the parentheses of Path(). Then run the cell again.")
        return False
    try:
        with open("report.txt") as file:
            text = file.read()
    except OSError:
        print("The file report.txt does not exist yet. The line that makes the Path value does not make the file. Call report_path.write_text() with the text of the report. Then run the cell again.")
        return False
    if text.strip() != "Mariam spent 2834.79":
        print(f"The file report.txt holds {text.strip()!r} but it must hold the line 'Mariam spent 2834.79'. Check the string that you give to write_text(). Then run the cell again.")
        return False
    if "report_text" not in globals():
        print("The file report.txt is correct. The name report_text does not exist yet. Read the file again with report_text = report_path.read_text() and then show the string with print(report_text). Then run the cell again.")
        return False
    value = globals()["report_text"]
    if isinstance(value, int):
        print(f"The file report.txt is correct, but the name report_text refers to the number {value}. That is the number of characters that write_text() wrote. The text of the file comes from the other method: report_text = report_path.read_text(). Then run the cell again.")
        return False
    if value != text:
        print(f"The file report.txt is correct, but the name report_text refers to {value!r}, which is not the text of the file. Give the name to the result of read_text(): report_text = report_path.read_text(). Then run the cell again.")
        return False
    print("Correct. Your code wrote the file report.txt with write_text(), and read the same text again with read_text().")
    return True
globals().pop("_workshop_check")()
```

Click the action below to see the file that your code wrote.

```{file-open}
:id: open-report
:title: Show the file report.txt under the notebook
:path: report.txt
:area: data
```
