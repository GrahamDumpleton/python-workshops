---
title: A function that skips bad rows
requires: [verify:read-amounts-function]
---

# A function that skips bad rows

On this page you write the function that the workshop has prepared
you for. It reads a file of spending, skips the rows that cannot be
read, and counts them.

There is no new idea on this page, and there is no cell to copy from.
Read the task with care before you start.

## Your task

Write a function that reads the amounts from a file such as
`spending-raw.csv`.

Your function must be like this:

- Its name is `read_amounts`.

- It has one parameter, with the name `filename`. The argument is the
  name of a file, as a string.

- It opens the file with that name. The first line of the file is
  the header, and the function does not use it.

- For each of the other lines, it makes a float from the third field,
  and adds that float to the end of a list.

- When a row cannot be read, the function does not stop. It skips
  the row, and adds `1` to a count. A row cannot be read when its
  amount is not a number, or when it has fewer than three fields.

- It returns two values, in this order: the list of amounts, and the
  number of rows that were skipped.

A function returns two values when its `return` line has two values
with a comma between them, such as `return amounts, skipped`. The
workshop **Pairs and unique things** showed this. The code that calls
the function can give a name to each value, with two names and a
comma on the left side of the `=`.

For example, suppose that a file with the name `small.csv` holds
these four lines:

```
date,description,amount,category
2026-04-01,Tea,3.50,food
2026-04-02,Pen,two,hobbies
2026-04-03,Bus ticket,2.80,transport
```

Then `read_amounts("small.csv")` returns the list `[3.5, 2.8]` and
the number `1`.

The function must work with any file of this form, so it must use
its parameter, and not the name `spending-raw.csv`.

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-read-amounts
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [read-amounts]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`.

To try your function, add these lines under it. They begin without
spaces, so they are not part of the function:

```python
good_amounts, skipped_rows = read_amounts("spending-raw.csv")
print(f"Rows read: {len(good_amounts)}")
print(f"Rows skipped: {skipped_rows}")
```

When the function is correct, these lines show:

```
Rows read: 37
Rows skipped: 3
```

The check calls your function with the file `spending-raw.csv`, and
with a small file of its own.

## If you need help

```{hint}
:title: Hint: the parts of the function
The first line is `def read_amounts(filename):`. The body starts with
an empty list and a count of `0`. Then comes the `with` line, which
opens `filename`. In its block, one line reads the header, and a
`for` loop reads the other lines. The last line of the body returns
the list and the count.
```

```{hint}
:title: Hint: the loop
The loop is nearly the same as the loop in the cell that you
corrected on the page **A bug is not bad data**. Each pass makes the list `fields` from the
line. Then a `try` block makes the float from `fields[2]` and adds it
to the list with `.append()`. An `except (ValueError, IndexError):`
block adds `1` to the count.
```

```{hint}
:title: Hint: the spaces at the start of each line
The lines of the body begin with four spaces. The lines in the `with`
block begin with eight spaces. The lines in the `for` block begin
with twelve spaces. The lines in the `try` block and in the `except`
block begin with sixteen spaces. The `return` line begins with four
spaces, so that it runs after the whole file has been read.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.
Compare the solution with your own cell, and find what is different.

```{attempt}
:id: read-amounts-not-started
:check: read-amounts-function
:expect: The function read_amounts does not exist yet
```

````{attempt}
:id: read-amounts-not-a-function
:check: read-amounts-function
:expect: is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
read_amounts = []
```
````

````{attempt}
:id: read-amounts-no-parameter
:check: read-amounts-function
:expect: but it has 0

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_amounts():
    return [], 0
```
````

````{attempt}
:id: read-amounts-no-try
:check: read-amounts-function
:expect: stopped with a ValueError

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_amounts(filename):
    amounts = []
    skipped = 0
    with open(filename) as file:
        header = file.readline()
        for line in file:
            fields = line.strip().split(",")
            amounts.append(float(fields[2]))
    return amounts, skipped
```
````

````{attempt}
:id: read-amounts-value-only
:check: read-amounts-function
:expect: stopped with an IndexError

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_amounts(filename):
    amounts = []
    skipped = 0
    with open(filename) as file:
        header = file.readline()
        for line in file:
            fields = line.strip().split(",")
            try:
                amounts.append(float(fields[2]))
            except ValueError:
                skipped = skipped + 1
    return amounts, skipped
```
````

````{attempt}
:id: read-amounts-bug
:check: read-amounts-function
:expect: stopped with a NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_amounts(filename):
    amounts = []
    skipped = 0
    with open(filename) as file:
        header = file.readline()
        for line in file:
            fields = line.strip().split(",")
            try:
                amounts.append(float(feilds[2]))
            except (ValueError, IndexError):
                skipped = skipped + 1
    return amounts, skipped
```
````

````{attempt}
:id: read-amounts-prints
:check: read-amounts-function
:expect: shows its result with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_amounts(filename):
    amounts = []
    skipped = 0
    with open(filename) as file:
        header = file.readline()
        for line in file:
            fields = line.strip().split(",")
            try:
                amounts.append(float(fields[2]))
            except (ValueError, IndexError):
                skipped = skipped + 1
    print(amounts, skipped)
```
````

````{attempt}
:id: read-amounts-no-return
:check: read-amounts-function
:expect: A function gives None when no line with return runs

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_amounts(filename):
    amounts = []
    skipped = 0
    with open(filename) as file:
        header = file.readline()
        for line in file:
            fields = line.strip().split(",")
            try:
                amounts.append(float(fields[2]))
            except (ValueError, IndexError):
                skipped = skipped + 1
```
````

````{attempt}
:id: read-amounts-list-only
:check: read-amounts-function
:expect: It must give two values

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_amounts(filename):
    amounts = []
    skipped = 0
    with open(filename) as file:
        header = file.readline()
        for line in file:
            fields = line.strip().split(",")
            try:
                amounts.append(float(fields[2]))
            except (ValueError, IndexError):
                skipped = skipped + 1
    return amounts
```
````

````{attempt}
:id: read-amounts-wrong-order
:check: read-amounts-function
:expect: The two values are in the wrong order

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_amounts(filename):
    amounts = []
    skipped = 0
    with open(filename) as file:
        header = file.readline()
        for line in file:
            fields = line.strip().split(",")
            try:
                amounts.append(float(fields[2]))
            except (ValueError, IndexError):
                skipped = skipped + 1
    return skipped, amounts
```
````

````{attempt}
:id: read-amounts-fixed-name
:check: read-amounts-function
:expect: reads the same file for every argument

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_amounts(filename):
    amounts = []
    skipped = 0
    with open("spending-raw.csv") as file:
        header = file.readline()
        for line in file:
            fields = line.strip().split(",")
            try:
                amounts.append(float(fields[2]))
            except (ValueError, IndexError):
                skipped = skipped + 1
    return amounts, skipped
```
````

````{attempt}
:id: read-amounts-header
:check: read-amounts-function
:expect: The function counts the header

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_amounts(filename):
    amounts = []
    skipped = 0
    with open(filename) as file:
        for line in file:
            fields = line.strip().split(",")
            try:
                amounts.append(float(fields[2]))
            except (ValueError, IndexError):
                skipped = skipped + 1
    return amounts, skipped
```
````

````{attempt}
:id: read-amounts-strings
:check: read-amounts-function
:expect: holds strings

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_amounts(filename):
    amounts = []
    skipped = 0
    with open(filename) as file:
        header = file.readline()
        for line in file:
            fields = line.strip().split(",")
            try:
                amount = float(fields[2])
                amounts.append(fields[2])
            except (ValueError, IndexError):
                skipped = skipped + 1
    return amounts, skipped
```
````

````{attempt}
:id: read-amounts-return-in-loop
:check: read-amounts-function
:expect: The return line is probably inside the loop

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_amounts(filename):
    amounts = []
    skipped = 0
    with open(filename) as file:
        header = file.readline()
        for line in file:
            fields = line.strip().split(",")
            try:
                amounts.append(float(fields[2]))
            except (ValueError, IndexError):
                skipped = skipped + 1
            return amounts, skipped
```
````

````{attempt}
:id: read-amounts-not-counted
:check: read-amounts-function
:expect: but the count of skipped rows is

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_amounts(filename):
    amounts = []
    skipped = 0
    with open(filename) as file:
        header = file.readline()
        for line in file:
            fields = line.strip().split(",")
            try:
                amounts.append(float(fields[2]))
            except (ValueError, IndexError):
                skipped = 1
    return amounts, skipped
```
````

````{attempt}
:id: read-amounts-two-blocks
:check: read-amounts-function
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_amounts(filename):
    numbers = []
    count = 0
    with open(filename) as file:
        lines = file.read().strip().split("\n")
    for line in lines[1:]:
        parts = line.split(",")
        if len(parts) < 3:
            count = count + 1
        else:
            try:
                numbers.append(float(parts[2]))
            except ValueError:
                count = count + 1
    return numbers, count
```
````

````{hint}
:title: Show me a solution
:unlock: "read-amounts-function" in failed_checks or "read-amounts-function" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-read-amounts-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [read-amounts-solution]
:run: true
def read_amounts(filename):
    amounts = []
    skipped = 0
    with open(filename) as file:
        header = file.readline()
        for line in file:
            fields = line.strip().split(",")
            try:
                amount = float(fields[2])
                amounts.append(amount)
            except (ValueError, IndexError):
                skipped = skipped + 1
    return amounts, skipped

good_amounts, skipped_rows = read_amounts("spending-raw.csv")
print(f"Rows read: {len(good_amounts)}")
print(f"Rows skipped: {skipped_rows}")
```
````

```{verify}
:id: read-amounts-function
:label: Your function read_amounts returns the amounts and the number of rows that it skipped
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed read-amounts; cell-executed read-amounts-solution
def _workshop_check():
    import contextlib, inspect, io, os
    if "read_amounts" not in globals():
        print("The function read_amounts does not exist yet. Write it under the comment in the new cell. The first line is def read_amounts(filename): and the spelling must be the same. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["read_amounts"]
    if not callable(function):
        print("The name read_amounts exists, but its value is not a function. Begin your cell with the line def read_amounts(filename): and write the lines of the function under it. Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(function).parameters)
    except (TypeError, ValueError):
        count = 1
    if count != 1:
        print(f"The function read_amounts must have one parameter, the name of the file, but it has {count}. Make the first line def read_amounts(filename): Then run the cell again.")
        return False
    name = "_check_rows.csv"
    text = "date,description,amount,category\n2026-04-01,Tea,3.50,food\n2026-04-02,Pen,two,hobbies\n2026-04-03,Soap\n2026-04-04,Bus ticket,2.80,transport\n2026-04-05,Stamp,,hobbies\n2026-04-06,Rice,4,food\n"
    expected = [3.5, 2.8, 4.0]
    shown = io.StringIO()
    try:
        with open(name, "w") as file:
            file.write(text)
        try:
            with contextlib.redirect_stdout(shown):
                result = function(name)
        except ValueError:
            print("The function read_amounts stopped with a ValueError when the check gave it a file that has a row with the amount two. The line that calls float() must be inside a try block, with an except block that names ValueError and adds 1 to the count. Then run the cell again.")
            return False
        except IndexError:
            print("The function read_amounts stopped with an IndexError when the check gave it a file that has a row with only two fields. The line that reads the third field must be inside the try block, and the except line must name the two types: except (ValueError, IndexError): Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function read_amounts stopped with a {type(error).__name__} when the check called it with a small file. That is not an exception from the data. It comes from a mistake in the body. Add a line under your function that calls read_amounts('spending-raw.csv'), run the cell, and read the error message from the last line. Then correct the function and run the cell again.")
            return False
    except OSError:
        print("The check could not write its own small file, so it could not test your function. Click Check again.")
        return False
    finally:
        try:
            os.remove(name)
        except OSError:
            pass
    printed = shown.getvalue().strip()
    if result is None and printed != "":
        print("The function read_amounts shows its result with print(), but it does not return it. The code that calls the function gets None. Make the last line of the body return the list and the count: return amounts, skipped. Then run the cell again.")
        return False
    if result is None:
        print("The function read_amounts gives None. A function gives None when no line with return runs. Make the last line of the body return the list and the count, with four spaces before the word return: return amounts, skipped. Then run the cell again.")
        return False
    if type(result) is not tuple or len(result) != 2:
        print(f"The check called read_amounts with a small file, and the function gives {result!r}. It must give two values: the list of amounts, and then the number of rows that were skipped. Write the two values in the return line, with a comma between them: return amounts, skipped. Then run the cell again.")
        return False
    amounts, skipped = result
    if type(amounts) is int and type(skipped) is list:
        print("The two values are in the wrong order. The function must return the list of amounts first, and the number of skipped rows second: return amounts, skipped. Then run the cell again.")
        return False
    if type(amounts) is not list or type(skipped) is not int:
        print(f"The function read_amounts gives {amounts!r} and {skipped!r}. The first value must be a list of floats, and the second value must be an integer, the number of rows that were skipped. Then run the cell again.")
        return False
    if len(amounts) == 37 and skipped == 3:
        print("The check called read_amounts with a small file of its own, and the function gives the amounts of spending-raw.csv. The function reads the same file for every argument. In the line with open(), use the parameter filename, with no quotes, where the name of the file goes. Then run the cell again.")
        return False
    if len(amounts) > 0 and all(type(amount) is str for amount in amounts):
        print(f"The list that read_amounts gives holds strings: {amounts!r}. It must hold floats. Add to the list the value that float() gives, not the field. Then run the cell again.")
        return False
    if amounts == expected and skipped == 4:
        print("The check gave read_amounts a file with 3 rows that cannot be read, and the function counted 4. The function counts the header as a row that cannot be read. Read the header before the loop, with the line header = file.readline(), so that the loop starts at the second line. Then run the cell again.")
        return False
    if amounts == expected[:1] and skipped == 0:
        print("The check gave read_amounts a file with 3 amounts, and the function gives a list with only the first amount. The return line is probably inside the loop, so the function ends in the first pass. Give the return line four spaces, so that it runs after the loop. Then run the cell again.")
        return False
    if amounts != expected:
        print(f"The check gave read_amounts a file with the amounts 3.50, 2.80 and 4, and three rows that cannot be read. The function gives the list {amounts!r} but it must give {expected!r}. In the try block, make a float from fields[2] and add it to the list with append(). Then run the cell again.")
        return False
    if skipped != 3:
        print(f"The check gave read_amounts a file with 3 rows that cannot be read. The list of amounts is correct, but the count of skipped rows is {skipped} and it must be 3. Start the count from 0 before the loop, and add 1 to it in the except block: skipped = skipped + 1. Then run the cell again.")
        return False
    try:
        with contextlib.redirect_stdout(io.StringIO()):
            real = function("spending-raw.csv")
        real_ok = len(real[0]) == 37 and real[1] == 3 and round(sum(real[0]), 2) == 2834.79
    except Exception:
        real_ok = False
    if not real_ok:
        print("The function works with the small file of the check, but it does not give 37 amounts and 3 skipped rows for spending-raw.csv. Add a line under your function that calls read_amounts('spending-raw.csv') and prints the result, and compare it with the task. Then run the cell again.")
        return False
    print("Correct. For spending-raw.csv your function gives 37 amounts, with the total 2834.79, and it counts 3 rows that it skipped. It also works with a file that it has never seen.")
    return True
globals().pop("_workshop_check")()
```

## What you built

Your function does what the first program of this workshop could not
do. It reads the whole file, although three rows of the file cannot
be read. It does not hide those rows: it counts them, and it gives
the count back, so that the code which calls it can tell Mariam.

The `except` line names only `ValueError` and `IndexError`, the two
types that wrong data can cause. If the function has a bug, Python
still stops and shows you where the bug is.
