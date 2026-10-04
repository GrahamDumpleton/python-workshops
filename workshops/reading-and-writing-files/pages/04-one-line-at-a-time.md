---
title: One line at a time
requires: [verify:lines-printed, verify:newline-seen, verify:items-stripped, verify:spending-lines]
---

# One line at a time

The method `read()` gives all the text of a file as one string. Most
files of data are made of lines, and each line is one piece of the
data. In `spending.csv`, each line is one purchase. A program usually
wants the lines one by one, so that it can do the same work for each
line.

You already know how to do the same work for each item of a list: a
`for` loop. A `for` loop also works with an open file. The loop gives
you the lines of the file, one line each time, from the first line to
the last line.

Think of a person who reads a shopping list aloud, one line at a time,
and stops after each line while another person finds that product in
the shop.

## A loop over a file

Click the action below. It adds a cell that shows each line of the
small file `shopping.txt`, and runs it.

```{attempt}
:id: lines-not-printed
:check: lines-printed
:expect: The cell has not run yet. Click the action above
```

```{cell-insert}
:id: insert-print-lines
:title: Add a cell that shows each line of the file, and run it
:path: {{ notebook }}
:tags: [print-lines]
:run: true
with open("shopping.txt") as file:
    for line in file:
        print(line)
```

The output is:

```
bread

rice

tea

```

```{verify}
:id: lines-printed
:label: The cell that shows each line has run
:substrate: contents
:trigger: cell-executed print-lines
:message: The cell has not run yet. Click the action above to add the cell and run it.
cell-executed {{ notebook }} print-lines
```

The `for` line is inside the `with` block, so it starts with four
spaces. The `print()` line is inside the block of the `for` loop, so
it starts with eight spaces. The loop repeated its block three times,
because the file has three lines. Each time, the name `line` referred
to the next line of the file, as a string.

But the output has an empty line after each word. The file has no
empty lines. Where do they come from?

## The newline character

The answer is a character that you cannot see. At the end of each line
of a file there is a **newline character**: a character that marks the
end of a line. It is the character that the `Enter` key makes. An
editor does not show it as a symbol. It shows it by starting the next
text on a new line.

In Python code, you write the newline character as `\n`: a backslash
and the letter `n`, inside a string. You type two symbols, but they
mean one character.

To see the newline characters, put the lines in a list and show the
list. When Python shows a list, it shows each string in quotes, with
every character in it.

```{attempt}
:id: newline-not-seen
:check: newline-seen
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-newline
:title: Add a cell that puts the lines in a list, and run it
:path: {{ notebook }}
:tags: [newline]
:run: true
shopping_lines = []
with open("shopping.txt") as file:
    for line in file:
        shopping_lines.append(line)

print(shopping_lines)
```

The output is:

```
['bread\n', 'rice\n', 'tea\n']
```

```{verify}
:id: newline-seen
:label: The cell put the lines in a list
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed newline
if globals().get("shopping_lines") == ["bread\n", "rice\n", "tea\n"]:
    print("The cell ran. Each string in the list shopping_lines ends with a newline character.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("shopping_lines") == ["bread\n", "rice\n", "tea\n"]
```

Each line that the loop gives ends with `\n`. The string `'tea\n'` has
four characters: three letters and the newline character.

This explains the empty lines in the first cell. `print()` showed the
line, and the newline character at the end of the line moved the
output to a new line. Then `print()` moved to a new line again, as it
always does after it has shown a value.

## Removing the newline character

The newline character is part of the file, but it is not part of the
data. The word in the first line is `bread`, and not `bread\n`.

The method `strip()` of a string gives a copy of the string with no
spaces at the start and at the end. It also removes a newline
character at the start or at the end. So `line.strip()` gives the line
without its `\n`.

```{attempt}
:id: items-not-stripped
:check: items-stripped
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-strip
:title: Add a cell that removes the newline characters, and run it
:path: {{ notebook }}
:tags: [strip]
:run: true
shopping_items = []
with open("shopping.txt") as file:
    for line in file:
        shopping_items.append(line.strip())

print(shopping_items)
```

The output is:

```
['bread', 'rice', 'tea']
```

```{verify}
:id: items-stripped
:label: The cell removed the newline characters
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed strip
if globals().get("shopping_items") == ["bread", "rice", "tea"]:
    print("The cell ran. The strings in the list shopping_items have no newline character.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("shopping_items") == ["bread", "rice", "tea"]
```

The only difference from the cell before is `line.strip()` in place of
`line`. Almost every program that reads lines from a file uses
`strip()` on each line.

## Your task

Now read the lines of the file of Mariam.

Write a cell that does these three things:

1. It makes a list with the name `spending_lines`. The list holds
   every line of the file `spending.csv`, as a string, in the same
   order as in the file. No string in the list ends with a newline
   character.

2. It shows the number of lines, with `print(len(spending_lines))`.

3. It shows the second line, with `print(spending_lines[1])`. Remember
   that the first item of a list has the index 0, so the index 1 gives
   the second item.

The first line of the file, which holds the names of the parts, is
also a line. It must be in the list too.

When your code is correct, the output under the cell is:

```
38
2026-01-01,Rent for January,650.00,rent
```

The action below adds a new cell for your code.

```{cell-insert}
:id: insert-spending-lines
:title: Add a cell for my code
:path: {{ notebook }}
:tags: [spending-lines]
:run: false
# Write your code on the lines below this one.

```

Click on the empty line under the comment, and type your code. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: what to look at
Look at the last cell above, which makes the list `shopping_items`.
Your cell has the same form. The name of the file is different, and
the name of the list is different. Then you add the two `print()`
lines at the end.
```

```{hint}
:title: Hint: the shape of the code
1. Start with an empty list: `spending_lines = []`.

2. Open the file: `with open("spending.csv") as file:`.

3. Under it, with four spaces at the start, write the loop:
   `for line in file:`.

4. Under the loop, with eight spaces at the start, add the line
   without its newline character to the list:
   `spending_lines.append(line.strip())`.

5. At the end, with no spaces at the start, write the two `print()`
   lines of the task.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first. It names the type of
the error.

An `IndentationError` means that the spaces at the start of a line are
wrong. The `for` line starts with four spaces, and the line inside the
loop starts with eight spaces.

A `FileNotFoundError` means that no file has the name that you gave to
`open()`. The name must be `"spending.csv"`.

A `NameError` means that a name is spelled differently from the name
that exists.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: spending-lines-not-started
:check: spending-lines
:expect: The name spending_lines does not exist yet
```

````{attempt}
:id: spending-lines-a-string
:check: spending-lines
:expect: is not a list

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("spending.csv") as file:
    spending_lines = file.read()
print(len(spending_lines))
```
````

````{attempt}
:id: spending-lines-empty
:check: spending-lines
:expect: The list spending_lines is empty

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_lines = []
with open("spending.csv") as file:
    for line in file:
        line.strip()
print(len(spending_lines))
```
````

````{attempt}
:id: spending-lines-newline
:check: spending-lines
:expect: still ends with a newline character

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_lines = []
with open("spending.csv") as file:
    for line in file:
        spending_lines.append(line)
print(len(spending_lines))
print(spending_lines[1])
```
````

````{attempt}
:id: spending-lines-last-empty
:check: spending-lines
:expect: The last item of the list is an empty string

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("spending.csv") as file:
    spending_lines = file.read().split("\n")
print(len(spending_lines))
print(spending_lines[1])
```
````

````{attempt}
:id: spending-lines-other-file
:check: spending-lines
:expect: but the file spending.csv has 38 lines

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_lines = []
with open("shopping.txt") as file:
    for line in file:
        spending_lines.append(line.strip())
print(len(spending_lines))
print(spending_lines[1])
```
````

````{attempt}
:id: spending-lines-changed
:check: spending-lines
:expect: is not the same as line 1 of the file

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_lines = []
with open("spending.csv") as file:
    for line in file:
        spending_lines.append(line.strip().upper())
print(len(spending_lines))
print(spending_lines[1])
```
````

````{attempt}
:id: spending-lines-other-way
:check: spending-lines
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("spending.csv") as file:
    spending_lines = [line.strip() for line in file]
print(len(spending_lines))
print(spending_lines[1])
```
````

````{hint}
:title: Show me a solution
:unlock: "spending-lines" in failed_checks or "spending-lines" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-spending-lines-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [spending-lines-solution]
:run: true
spending_lines = []
with open("spending.csv") as file:
    for line in file:
        spending_lines.append(line.strip())

print(len(spending_lines))
print(spending_lines[1])
```
````

```{verify}
:id: spending-lines
:label: The list spending_lines holds the 38 lines of the file
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed spending-lines; cell-executed spending-lines-solution
def _workshop_check():
    if "spending_lines" not in globals():
        print("The name spending_lines does not exist yet. Write your code under the comment in the new cell, and check the spelling of the name. Then hold Shift and press Enter to run the cell.")
        return False
    value = globals()["spending_lines"]
    if not isinstance(value, list):
        print(f"The name spending_lines refers to a value of the type {type(value).__name__}, which is not a list. Start with an empty list, spending_lines = [], and add each line to it with append() inside a for loop. Then run the cell again.")
        return False
    try:
        with open("spending.csv") as file:
            expected = file.read().splitlines()
    except OSError:
        print("The check cannot read the file spending.csv. The file is part of this workshop. Close this workshop, open it again, and choose Restart when you are asked, so that the workshop makes the file again.")
        return False
    if value == expected:
        print("Correct. The list spending_lines holds the 38 lines of the file, and no line ends with a newline character.")
        return True
    if len(value) == 0:
        print("The list spending_lines is empty. Inside the for loop, add each line to the list: spending_lines.append(line.strip()). That line must start with eight spaces. Then run the cell again.")
        return False
    if not all(isinstance(item, str) for item in value):
        print("The list spending_lines holds an item that is not a string. Every item must be one line of the file, as a string. Add line.strip() to the list, and nothing else. Then run the cell again.")
        return False
    if any(item.endswith("\n") for item in value):
        print("A string in the list spending_lines still ends with a newline character. Use strip() on each line before you add it to the list: spending_lines.append(line.strip()). Then run the cell again.")
        return False
    if value[:-1] == expected and value[-1] == "":
        print("The list spending_lines holds 39 items, but the file has 38 lines. The last item of the list is an empty string. That happens when the code divides the whole text at each newline character, because the text ends with a newline character. Use a for loop over the file, and add line.strip() to the list each time. Then run the cell again.")
        return False
    if len(value) != len(expected):
        print(f"The list spending_lines holds {len(value)} items, but the file spending.csv has 38 lines. Check the name of the file in the call of open(), and check that the list starts empty before the loop. Then run the cell again.")
        return False
    for number in range(len(expected)):
        if value[number] != expected[number]:
            print(f"The item at index {number} of the list spending_lines is not the same as line {number + 1} of the file. The item is {value[number]!r} but the line is {expected[number]!r}. Add line.strip() to the list, with no other change. Then run the cell again.")
            return False
    return False
globals().pop("_workshop_check")()
```

You now have each purchase as a string of its own. The amounts are
still text inside those strings. The next page turns them into
numbers.
