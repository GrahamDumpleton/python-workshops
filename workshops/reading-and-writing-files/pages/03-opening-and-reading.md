---
title: Opening a file and reading it
requires: [verify:shopping-read, verify:spending-read]
---

# Opening a file and reading it

Before a program can read a file, it must **open** the file. To open a
file means to ask the computer for the file by its name, so that the
program can use it. When the program has finished with the file, it
**closes** the file: it tells the computer that it does not need the
file any more.

Think of a book on a shelf. You take the book from the shelf and open
it. You read it. Then you close the book and put it back, so that the
next person can use it. A program does the same three things with a
file: it opens the file, it reads the file, and it closes the file.

## A small file

This workshop includes a second file, which is smaller. Its name is
`shopping.txt`, and it holds three lines. Click the action below to
show it beside `spending.csv`, in the part under the notebook.

```{file-open}
:id: open-shopping
:title: Show the file shopping.txt under the notebook
:path: shopping.txt
:area: data
```

The part under the notebook now has two tabs, one for each file. Click
a tab to see that file.

## The code

Three pieces of Python work together to read a file.

- The function `open()` opens a file. Its argument is the name of the
  file, as a string: `open("shopping.txt")`. It gives back a value
  that stands for the open file.

- The word `with` starts a **`with` block**. The line
  `with open("shopping.txt") as file:` opens the file, and gives the
  name `file` to the open file. The lines under it that start with
  four spaces are the block. Inside the block, the file is open. When
  the block ends, Python closes the file for you.

- The method `read()` reads all the text of the file, and gives it
  back as one string.

Click the action below. It adds a cell that reads the small file, and
runs it.

```{attempt}
:id: shopping-not-read
:check: shopping-read
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-shopping-read
:title: Add a cell that reads the file shopping.txt, and run it
:path: {{ notebook }}
:tags: [shopping-read]
:run: true
with open("shopping.txt") as file:
    shopping_text = file.read()

print(shopping_text)
print(len(shopping_text))
```

The output is:

```
bread
rice
tea

15
```

```{verify}
:id: shopping-read
:label: The cell read the file shopping.txt
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed shopping-read
if globals().get("shopping_text") == "bread\nrice\ntea\n":
    print("The cell ran. The name shopping_text refers to the text of the file shopping.txt.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("shopping_text") == "bread\nrice\ntea\n"
```

## What happened

| Line | What Python did |
|------|-----------------|
| `with open("shopping.txt") as file:` | opened the file `shopping.txt`, and gave the name `file` to the open file |
| `shopping_text = file.read()` | read all the text of the file, and gave the name `shopping_text` to that string |
| the end of the block | closed the file |
| `print(shopping_text)` | showed the string, which is the same text as the editor shows |
| `print(len(shopping_text))` | showed the number of characters in the string, which is 15 |

Three things are important here.

- The `with` line ends with a colon, and the line under it starts with
  four spaces. This is a block, in the same way as the block of an
  `if` or of a `for` loop.

- The two `print()` lines start without spaces, so they are after the
  block. The file is already closed when they run. That is not a
  problem, because the text is now in the string `shopping_text`. The
  string stays after the file is closed.

- You do not write a line to close the file. The `with` block closes
  it, also when an error stops the code inside the block. This is why
  Python programmers open files with `with`.

The name of the file is a plain string. Python looks for the file in
the same place as your notebook. If no file has that name, Python
stops with an error of the type `FileNotFoundError`. When you see that
error, compare the name in your code with the name of the file, letter
by letter.

## Your task

Now read the file of Mariam.

Write a cell that does these two things:

1. It opens the file `spending.csv`, reads all of its text, and gives
   the name `spending_text` to that string.

2. It shows the number of characters in the string, with
   `print(len(spending_text))`.

When your code is correct, the output under the cell is:

```
1402
```

The action below adds a new cell for your code.

```{cell-insert}
:id: insert-spending-read
:title: Add a cell for my code
:path: {{ notebook }}
:tags: [spending-read]
:run: false
# Write your code on the lines below this one.

```

Click on the empty line under the comment, and type your code. Then
run the cell: hold `Shift` and press `Enter`. The check below runs
each time you run the cell.

```{hint}
:title: Hint: what to look at
Look at the cell above that reads `shopping.txt`. Your cell has the
same form. Two things are different: the name of the file, and the
name that you give to the string.
```

```{hint}
:title: Hint: the shape of the code
Your cell needs three lines:

1. `with open("spending.csv") as file:` Do not forget the colon at the
   end.

2. A line that starts with four spaces. It calls `file.read()`, and
   gives the name `spending_text` to the result.

3. `print(len(spending_text))`, which starts without spaces.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: spending-read-not-started
:check: spending-read
:expect: The name spending_text does not exist yet
```

````{attempt}
:id: spending-read-no-read
:check: spending-read
:expect: refers to the open file, and not to its text

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("spending.csv") as file:
    spending_text = file
```
````

````{attempt}
:id: spending-read-not-string
:check: spending-read
:expect: is not a string

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("spending.csv") as file:
    spending_text = len(file.read())
print(spending_text)
```
````

````{attempt}
:id: spending-read-other-file
:check: spending-read
:expect: is not the text of the file spending.csv

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("shopping.txt") as file:
    spending_text = file.read()
print(len(spending_text))
```
````

````{hint}
:title: Show me a solution
:unlock: "spending-read" in failed_checks or "spending-read" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-spending-read-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [spending-read-solution]
:run: true
with open("spending.csv") as file:
    spending_text = file.read()

print(len(spending_text))
```
````

```{verify}
:id: spending-read
:label: The name spending_text refers to the text of the file
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed spending-read; cell-executed spending-read-solution
def _workshop_check():
    if "spending_text" not in globals():
        print("The name spending_text does not exist yet. Write your code under the comment in the new cell, and check the spelling of the name. Then hold Shift and press Enter to run the cell.")
        return False
    value = globals()["spending_text"]
    if hasattr(value, "read"):
        print("The name spending_text refers to the open file, and not to its text. Call the method read() on the file, with a dot and a pair of parentheses: spending_text = file.read(). Then run the cell again.")
        return False
    if not isinstance(value, str):
        print(f"The name spending_text refers to {value!r}, which is not a string. It must refer to the string that file.read() gives. Write spending_text = file.read() inside the with block. Then run the cell again.")
        return False
    try:
        with open("spending.csv") as file:
            expected = file.read()
    except OSError:
        print("The check cannot read the file spending.csv. The file is part of this workshop. Close this workshop, open it again, and choose Restart when you are asked, so that the workshop makes the file again.")
        return False
    if value != expected:
        print(f"The name spending_text refers to a string of {len(value)} characters, but that string is not the text of the file spending.csv. Check the name of the file in the call of open(). It must be spending.csv. Then run the cell again.")
        return False
    print("Correct. The name spending_text refers to all the text of the file spending.csv.")
    return True
globals().pop("_workshop_check")()
```

All the text of the file is now in one string. A string of 1402
characters is hard to use: your code needs each purchase on its own.
The next page shows how to read a file one line at a time.
