---
title: "Part 3: read the file"
requires: [verify:read-ledger]
---

# Part 3: read the file

You have a class for one purchase and a class for a ledger. In this
part, the purchases come from Mariam's file.

## The goal

Write a function named `read_ledger`. It takes the name of a CSV file.
It reads the rows of that file, makes a `Purchase` object from each
row, and gives back a `Ledger` object that holds all of them.

This is a function, and not a method, because it does not work on a
ledger that already exists. It makes a new one.

## What your code must do

- The function `read_ledger` has one **parameter**, named `filename`.
  A parameter is a name in the `def` line that receives the value
  given in the call. Here that value is a string: the name of a file.

- The function makes one new, empty ledger with `Ledger()`.

- The function opens the file whose name is in `filename`, and reads
  its rows with `csv.DictReader`. The module `csv` reads CSV files.
  `csv.DictReader(file)` gives each row of the file as a dictionary.
  The keys of that dictionary are the names in the header: `"date"`,
  `"description"`, `"amount"` and `"category"`. Every value is a
  string. The header itself is not given as a row. The cell must have
  the line `import csv` before it uses the module.

- For each row, the function makes one `Purchase` object, and adds it
  to the ledger with the method `add`.

- The amount of each purchase is a `Decimal` value, and not a string.
  `Decimal(row["amount"])` makes a `Decimal` value from the string in
  the row.

- The function gives the ledger back with `return`. It does not print
  it.

- After the function, the cell has three more lines. They call your
  function with Mariam's file, and show how many purchases the ledger
  holds, and the first one:

  ```python
  ledger = read_ledger("spending.csv")
  print(len(ledger.purchases))
  print(ledger.purchases[0])
  ```

For example, think of a file that holds these three lines:

```
date,description,amount,category
2025-12-01,Soup,4.25,food
2025-12-07,Map,6.00,hobbies
```

For that file, the function must give back a ledger whose list
`purchases` holds two objects:

```
Purchase(date='2025-12-01', description='Soup', amount=Decimal('4.25'), category='food')
Purchase(date='2025-12-07', description='Map', amount=Decimal('6.00'), category='hobbies')
```

When your code is correct, the output under the cell is:

```
37
Purchase(date='2026-01-01', description='Rent for January', amount=Decimal('650.00'), category='rent')
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-read
:title: Add a cell for part 3
:path: {{ notebook }}
:tags: [read]
:run: false
# Part 3: read the file. Write your code below this line.

```

Write your code under the comment, and run the cell. The check calls
your function with two small files of its own, and it tells you what
your function gave back. The check removes its two files when it has
finished.

## If you need help

```{hint}
:title: Hint: what to look at
The workshop **CSV and JSON** read a CSV file with `csv.DictReader`:

- `with open(filename, newline="") as file:` opens the file. The lines
  that use the file are in the block under the `with` line, and Python
  closes the file at the end of that block. The module `csv` asks for
  `newline=""` each time that you open a file for it.

- `for row in csv.DictReader(file):` gives each row of the file in
  turn, as a dictionary. `row["date"]` is the date of that row, as a
  string.

On the page **Part 1: a purchase**, you made a purchase from four
values: `Purchase("2026-01-03", "Bread and milk", Decimal("6.40"),
"food")`. Here the four values come from the dictionary `row`.

On the page **Part 2: a ledger**, you made a ledger with `Ledger()`,
and you added a purchase to it with the method `add`.
```

```{hint}
:title: Hint: the shape of the code
1. The first line of the cell is `import csv`.

2. Define the function: `def read_ledger(filename):`.

3. In the body, make an empty ledger, and give it a name:
   `new_ledger = Ledger()`.

4. Open the file: `with open(filename, newline="") as file:`. Write
   `filename` without quotes, because it is the parameter.

5. Inside the `with` block, write a loop:
   `for row in csv.DictReader(file):`.

6. Inside the loop, make a purchase from the four values of the row:
   `purchase = Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"])`.

7. Under that line, also inside the loop, add the purchase to the
   ledger: `new_ledger.add(purchase)`.

8. After the `with` block, with four spaces at the start of the line,
   give the ledger back: `return new_ledger`.

9. After the function, at the left side of the cell, write the three
   lines from the task.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first. It names the type of
the error.

A `NameError` that names `csv` means that the line `import csv` is
missing. Write it as the first line of the cell. A `NameError` that
names `Purchase`, `Ledger` or `Decimal` means that the cell of an
earlier part has not run. Return to that page, and run your cell there
again, or use the solution of that page.

A `FileNotFoundError` means that Python did not find the file. Check
the spelling of `"spending.csv"` in the call, and check that the
function opens `filename`, without quotes.

A `KeyError` means that the dictionary `row` has no key with that
name. The four keys are `"date"`, `"description"`, `"amount"` and
`"category"`, in small letters.

An `IndentationError` means that the spaces at the start of a line are
wrong. Each block starts four spaces further to the right than the
line that opens it.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: read-not-started
:check: read-ledger
:expect: The function read_ledger does not exist yet
```

````{attempt}
:id: read-not-a-function
:check: read-ledger
:expect: The name read_ledger is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
read_ledger = "spending.csv"
```
````

````{attempt}
:id: read-no-parameter
:check: read-ledger
:expect: must have exactly one parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger():
    return Ledger()
```
````

````{attempt}
:id: read-no-import
:check: read-ledger
:expect: uses a name that has no value yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger(filename):
    new_ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            new_ledger.add(Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"]))
    return new_ledger
```
````

````{attempt}
:id: read-name-in-quotes
:check: read-ledger
:expect: did not find the file

```{cell-insert}
:path: {{ notebook }}
:run: true
import csv

def read_ledger(filename):
    new_ledger = Ledger()
    with open("filename", newline="") as file:
        for row in csv.DictReader(file):
            new_ledger.add(Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"]))
    return new_ledger
```
````

````{attempt}
:id: read-wrong-key
:check: read-ledger
:expect: stopped with an error of the type KeyError

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger(filename):
    new_ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            new_ledger.add(Purchase(row["Date"], row["description"], Decimal(row["amount"]), row["category"]))
    return new_ledger
```
````

````{attempt}
:id: read-prints
:check: read-ledger
:expect: shows its result with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger(filename):
    new_ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            new_ledger.add(Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"]))
    print(len(new_ledger.purchases))
```
````

````{attempt}
:id: read-no-return
:check: read-ledger
:expect: gives back None

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger(filename):
    new_ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            new_ledger.add(Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"]))
```
````

````{attempt}
:id: read-gives-list
:check: read-ledger
:expect: gives back a list

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger(filename):
    found = []
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            found.append(Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"]))
    return found
```
````

````{attempt}
:id: read-gives-other
:check: read-ledger
:expect: must give back an object of the class Ledger

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger(filename):
    return Ledger
```
````

````{attempt}
:id: read-adds-rows
:check: read-ledger
:expect: holds a dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger(filename):
    new_ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            new_ledger.add(row)
    return new_ledger
```
````

````{attempt}
:id: read-adds-lists
:check: read-ledger
:expect: holds a value that is not a Purchase object

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger(filename):
    new_ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.reader(file):
            new_ledger.add(row)
    return new_ledger
```
````

````{attempt}
:id: read-fixed-file
:check: read-ledger
:expect: reads the file spending.csv

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger(filename):
    new_ledger = Ledger()
    with open("spending.csv", newline="") as file:
        for row in csv.DictReader(file):
            new_ledger.add(Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"]))
    return new_ledger
```
````

````{attempt}
:id: read-return-in-loop
:check: read-ledger
:expect: holds only the first purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger(filename):
    new_ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            new_ledger.add(Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"]))
            return new_ledger
```
````

````{attempt}
:id: read-add-after-loop
:check: read-ledger
:expect: but it must hold these purchases

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger(filename):
    new_ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            purchase = Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"])
    new_ledger.add(purchase)
    return new_ledger
```
````

````{attempt}
:id: read-string-amount
:check: read-ledger
:expect: has an amount that is the string

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger(filename):
    new_ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            new_ledger.add(Purchase(row["date"], row["description"], row["amount"], row["category"]))
    return new_ledger
```
````

````{attempt}
:id: read-mixed-fields
:check: read-ledger
:expect: has the description 'food'

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger(filename):
    new_ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            new_ledger.add(Purchase(row["date"], row["category"], Decimal(row["amount"]), row["description"]))
    return new_ledger
```
````

````{attempt}
:id: read-no-ledger
:check: read-ledger
:expect: The name ledger does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger(filename):
    new_ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            new_ledger.add(Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"]))
    return new_ledger
```
````

````{attempt}
:id: read-ledger-is-list
:check: read-ledger
:expect: The name ledger must refer to the Ledger object

```{cell-insert}
:path: {{ notebook }}
:run: true
ledger = read_ledger("spending.csv").purchases
```
````

````{attempt}
:id: read-ledger-short
:check: read-ledger
:expect: The ledger holds 2 purchases

```{cell-insert}
:path: {{ notebook }}
:run: true
ledger = small_ledger
```
````

````{attempt}
:id: read-other-way
:check: read-ledger
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
import csv

def read_ledger(filename):
    result = Ledger()
    file = open(filename)
    rows = list(csv.reader(file))
    file.close()
    for fields in rows[1:]:
        result.add(Purchase(fields[0], fields[1], Decimal(fields[2]), fields[3]))
    return result

ledger = read_ledger("spending.csv")
print(len(ledger.purchases))
```
````

````{hint}
:title: Show me a solution
:unlock: "read-ledger" in failed_checks or "read-ledger" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-read-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [read-solution]
:run: true
import csv

def read_ledger(filename):
    new_ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            purchase = Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"])
            new_ledger.add(purchase)
    return new_ledger

ledger = read_ledger("spending.csv")
print(len(ledger.purchases))
print(ledger.purchases[0])
```
````

```{verify}
:id: read-ledger
:label: The function read_ledger reads a file into a ledger
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed read; cell-executed read-solution
def _workshop_check():
    import contextlib, inspect, io, os
    missing = object()
    if "read_ledger" not in globals():
        print("The function read_ledger does not exist yet. Write it under the comment in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["read_ledger"]
    if not callable(function) or isinstance(function, type):
        print("The name read_ledger is not a function. It refers to another kind of value. Define the function with a line that starts with def read_ledger(filename): and write the body under it. Then run the cell again.")
        return False
    try:
        inspect.signature(function).bind("file.csv")
    except TypeError:
        print("The function read_ledger must have exactly one parameter, which receives the name of the file. The def line must be: def read_ledger(filename): Then run the cell again.")
        return False
    except ValueError:
        pass
    cls = globals().get("Ledger")
    if not isinstance(cls, type) or not isinstance(globals().get("Purchase"), type):
        print("The class Purchase or the class Ledger is missing. Return to the pages of part 1 and part 2, and run your cells there again, or use the solutions of those pages. Then return to this page and run your cell again.")
        return False
    header = "date,description,amount,category\n"
    tests = [
        ("_check_first.csv", header + "2025-12-01,Soup,4.25,food\n2025-12-07,Map,6.00,hobbies\n2025-12-09,Apples,2.40,food\n", [("2025-12-01", "Soup", 4.25, "food"), ("2025-12-07", "Map", 6.0, "hobbies"), ("2025-12-09", "Apples", 2.4, "food")], "The file holds a header and 3 purchases."),
        ("_check_second.csv", header + "2025-11-02,Tea,3.50,food\n2025-11-05,Tram ticket,2.10,transport\n", [("2025-11-02", "Tea", 3.5, "food"), ("2025-11-05", "Tram ticket", 2.1, "transport")], "The file holds a header and 2 purchases."),
    ]
    for file_name, text, expected, kind in tests:
        about = "The check made a small file of its own. " + kind
        shown = io.StringIO()
        try:
            with open(file_name, "w") as file:
                file.write(text)
            with contextlib.redirect_stdout(shown):
                result = function(file_name)
        except NameError:
            print("The function read_ledger stopped because it uses a name that has no value yet. The most likely reason is that the line import csv is missing: write it as the first line of the cell. Check also the spelling of each name in the body. Then run the cell again.")
            return False
        except FileNotFoundError:
            print(f"The function read_ledger did not find the file. The check called read_ledger(\"{file_name}\"), and that file exists. The function must open the file whose name is in the parameter: open(filename, newline=\"\") with no quotes around filename. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function read_ledger stopped with an error of the type {type(error).__name__} when the check called it with the name of a small file of its own. Call the function in a cell of your own, with read_ledger(\"spending.csv\"), and read the last line of the error message. Correct the function, and run the cell again.")
            return False
        finally:
            try:
                os.remove(file_name)
            except OSError:
                pass
        if result is None and shown.getvalue().strip():
            print("The function read_ledger shows its result with print(), but it does not return it. The code that calls the function then receives None. After the with block, give the ledger back with a line that starts with four spaces: return new_ledger. Then run the cell again.")
            return False
        if result is None:
            print("The function read_ledger gives back None. That happens when the body has no return line. After the with block, add a line that starts with four spaces and gives the ledger back: return new_ledger. Then run the cell again.")
            return False
        if isinstance(result, list):
            print("The function read_ledger gives back a list. It must give back a Ledger object that holds the purchases. Make an empty ledger at the start of the body, with new_ledger = Ledger(), add each purchase to it with new_ledger.add(purchase), and give it back with return new_ledger. Then run the cell again.")
            return False
        held = getattr(result, "purchases", missing)
        if not isinstance(result, cls) or not isinstance(held, list):
            print("The function read_ledger must give back an object of the class Ledger. It gives back another kind of value. Make an empty ledger at the start of the body, with the parentheses: new_ledger = Ledger(). Add each purchase to it, and give it back with return new_ledger. Then run the cell again.")
            return False
        if any(isinstance(item, dict) for item in held):
            print("The ledger that read_ledger gives back holds a dictionary, as csv.DictReader gives it. It must hold a Purchase object for each row. Make the object from the four values of the row: Purchase(row[\"date\"], row[\"description\"], Decimal(row[\"amount\"]), row[\"category\"]). Then add that object to the ledger, and run the cell again.")
            return False
        if not all(isinstance(item, globals()["Purchase"]) for item in held):
            print("The ledger that read_ledger gives back holds a value that is not a Purchase object. Make one object from the four values of each row: Purchase(row[\"date\"], row[\"description\"], Decimal(row[\"amount\"]), row[\"category\"]). Then add that object to the ledger, and run the cell again.")
            return False
        names = [getattr(item, "description", None) for item in held]
        wanted = [values[1] for values in expected]
        if len(held) == 37:
            print(f"The function read_ledger reads the file spending.csv, also when it is called with the name of another file. The check called read_ledger(\"{file_name}\"), and the function gave back 37 purchases. Open the file whose name is in the parameter: open(filename, newline=\"\"). Then run the cell again.")
            return False
        if len(held) == 1 and len(expected) > 1 and getattr(held[0], "date", None) == expected[0][0]:
            print(f"{about} The ledger that your function gives back holds only the first purchase. That happens when the return line is inside the loop, so the function stops in the first pass. The return line must start with four spaces only. Then run the cell again.")
            return False
        if len(held) != len(expected):
            print(f"{about} Your function gives back a ledger of the purchases {names!r}, but it must hold these purchases: {wanted!r}. Check that the line that makes a purchase and the line that adds it to the ledger are both inside the loop, so that they run for every row. Then run the cell again.")
            return False
        for item, values in zip(held, expected):
            amount = getattr(item, "amount", None)
            if isinstance(amount, str):
                print(f"{about} The purchase of {values[0]} in the ledger that your function gives back has an amount that is the string {amount!r}. Everything that csv.DictReader reads is a string, and a string cannot be added to a total. Make a Decimal value from it: Decimal(row[\"amount\"]). Then run the cell again.")
                return False
            try:
                number = round(float(amount), 2)
            except Exception:
                number = amount
            for label, found, value in [("date", getattr(item, "date", None), values[0]), ("description", getattr(item, "description", None), values[1]), ("amount", number, values[2]), ("category", getattr(item, "category", None), values[3])]:
                if found != value:
                    print(f"{about} The purchase of {values[0]} in the ledger that your function gives back has the {label} {found!r}, but it must have the {label} {value!r}. Give the four values in the order of the fields: Purchase(row[\"date\"], row[\"description\"], Decimal(row[\"amount\"]), row[\"category\"]). Then run the cell again.")
                    return False
    if "ledger" not in globals():
        print("The function read_ledger is correct. The name ledger does not exist yet. After the function, at the left side of the cell, add the three lines from the task. The first one is: ledger = read_ledger(\"spending.csv\"). Then run the cell again.")
        return False
    ledger = globals()["ledger"]
    held = getattr(ledger, "purchases", None)
    if not isinstance(ledger, cls) or not isinstance(held, list):
        print("The function read_ledger is correct. The name ledger must refer to the Ledger object that the function gives back, but it refers to another kind of value. Make it with this line: ledger = read_ledger(\"spending.csv\"). Then run the cell again.")
        return False
    if len(held) != 37:
        print(f"The function read_ledger is correct. The ledger holds {len(held)} purchases, but the file spending.csv holds 37 purchases. Make the ledger with your function, and do not change it: ledger = read_ledger(\"spending.csv\"). Then run the cell again.")
        return False
    print("Correct. The function read_ledger read the file spending.csv, and it gave back a ledger that holds 37 Purchase objects.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

The name `ledger` refers to one `Ledger` object. Its list `purchases`
holds 37 `Purchase` objects, one for each row of Mariam's file. In the
next parts, you teach the ledger to answer questions about them.
