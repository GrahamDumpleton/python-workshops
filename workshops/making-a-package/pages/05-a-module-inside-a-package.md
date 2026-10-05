---
title: A module inside a package
requires: [verify:food-written, quiz:predict-outside, quiz:missing-module]
---

# A module inside a package

A module inside a package has a longer name than before. On this page
you see that name, and you see the first thing that goes wrong after
the move.

## The full name of a module

Before the move, the module in the file `storage.py` had the name
`storage`. Now the file is inside the package `spending`, and the full
name of the module is `spending.storage`.

The dot is the dot that you know from `math.sqrt` and from
`purchase.amount`. The thing after the dot belongs to the thing before
the dot. The module `storage` belongs to the package `spending`.

A program outside the package uses the full name in its import:

```python
from spending.storage import read_ledger
```

This line means: from the module `storage` of the package `spending`,
get the function `read_ledger`.

The full name is the reason that a package solves the problem of
plain names. Another package may also have a module `storage`. The
two full names are different, so Python never confuses them.

## A small program that uses the package

The action below writes a small program in your work directory, beside
the package and outside it, and opens it in the editor. The program
shows how much Mariam spent on food.

```{attempt}
:id: food-not-written
:check: food-written
:expect: There is no file food_total.py in your work directory yet
```

```{file-write}
:id: write-food
:title: Write the file food_total.py and open it
:path: food_total.py
:open: true
from spending.storage import read_ledger

ledger = read_ledger("spending.csv")
food = ledger.select(category="food")
print(f"Food: {food.total():.2f}")
```

```{verify}
:id: food-written
:label: The file food_total.py exists
:substrate: contents
:trigger: after:write-food
:message: There is no file food_total.py in your work directory yet. Click the action above to write the file.
exists food_total.py
```

Read the four lines of code.

- The first line imports the function `read_ledger` by the full name
  of its module.

- The second line calls the function. It returns a `Ledger` object
  that holds the 37 purchases.

- The third line calls the method `select` of the ledger. It returns
  a new ledger that holds only the purchases of the category `food`.

- The last line shows the total of that ledger with two decimal
  places.

## Predict

Do not run the program yet. First read the top of the file
`spending/storage.py`. It has not changed since the move:

```python
import csv
from decimal import Decimal

from models import Ledger, Purchase
```

Remember where Python looks for a module. When you run
`python food_total.py`, the first directory of the list `sys.path` is
the directory that holds `food_total.py`. That is your work directory.

```{quiz}
:id: predict-outside
:title: What happens when the program runs
question: "You run `python food_total.py` in your work directory. What happens?"
options:
  - { text: "The program shows the total for food", explanation: "The first import works, but then Python runs the file `spending/storage.py`, and that file has an import of its own. Think about where Python looks for `models`." }
  - { text: "Python stops, because it cannot find the package `spending`", explanation: "Python does find the package. The directory `spending` is in your work directory, and your work directory is the first place where Python looks." }
  - { text: "Python stops, because it cannot find the module `models`", correct: true }
explanation: "Python finds the package `spending` in your work directory, and begins to run the file `spending/storage.py`. That file says `from models import Ledger, Purchase`. Python looks for a file `models.py` in the directories of `sys.path`. Your work directory has no such file now, because the file moved into the package. Python does not look inside the directory `spending` by itself."
```

Now run the program. Type this command in the terminal, and press
`Enter`:

```
python food_total.py
```

Python shows an error message of several lines. In place of `...`
you see the path of your work directory, which is different on every
computer:

```
Traceback (most recent call last):
  File ".../food_total.py", line 1, in <module>
    from spending.storage import read_ledger
  File ".../spending/storage.py", line 6, in <module>
    from models import Ledger, Purchase
ModuleNotFoundError: No module named 'models'
```

```{quiz}
:id: missing-module
:type: text
:case: false
question: "Read the last line of the error message in the terminal. Which module can Python not find? Type its name."
answer:
  - { pattern: "'?models'?", example: "models" }
wrong:
  - { pattern: "'?(spending\\.)?storage(\\.py)?'?", explanation: "Python found the module `storage` and began to run it. The last line names the module that `storage.py` asked for." }
  - { pattern: "'?spending'?", explanation: "Python found the package `spending`. The last line names another module, in quotes." }
otherwise: "The last line begins with `ModuleNotFoundError`. The name of the module is at the end of that line, in quotes."
explanation: "The last line says what went wrong: no module has the name `models`. The lines above it say where. Read them from the bottom upward. The line `from models import Ledger, Purchase` is line 6 of `spending/storage.py`, and Python reached that file from line 1 of `food_total.py`."
```

## What happened

The import in `storage.py` was correct before the move. Then the file
`models.py` was in the same directory as the program that you ran, so
it was in the first directory of `sys.path`.

Now the program that you run is outside the package, and the two
modules are inside it. The plain name `models` no longer leads to the
file. The module needs a way to say "the module `models` that is in
the same package as me". The next page shows that way.
