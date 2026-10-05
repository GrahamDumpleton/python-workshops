---
title: The old file
requires: [verify:old-file-gone]
---

# The old file

The four modules hold all the code that `spending.py` holds. Your
files now have every class and every function two times: one time in
`spending.py`, and one time in a new module.

Two copies of the same code are a problem. One day you correct a
mistake in one copy and forget the other, and after that the two
copies do different things. So the last step of a split is to remove
the old file.

Removing the file is also a test. If one of your modules still
imported a name from `spending`, the program would stop with an error
as soon as the file is gone. The checks of the earlier pages already
tested this, so the program is ready.

## Remove spending.py

The action below deletes `spending.py`. Its tab in the editor closes,
and the file leaves the file browser.

```{attempt}
:id: old-file-still-there
:check: old-file-gone
:expect: The file spending.py is still there
```

````{attempt}
:id: old-file-still-used
:check: old-file-gone
:expect: Python stopped with an error when it ran main.py

```{file-delete}
:path: spending.py
:missing: ignore
```

```{file-write}
:path: storage.py
import csv
from decimal import Decimal

from spending import Ledger, Purchase


def read_ledger(filename):
    ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            purchase = Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"])
            ledger.add(purchase)
    return ledger
```
````

````{attempt}
:id: old-file-repaired
:check: old-file-gone
:result: pass

```{file-write}
:path: storage.py
"""Reading the purchases from a CSV file."""

import csv
from decimal import Decimal

from models import Ledger, Purchase


def read_ledger(filename):
    ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            purchase = Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"])
            ledger.add(purchase)
    return ledger
```
````

```{file-delete}
:id: delete-old-file
:title: Delete spending.py
:path: spending.py
:missing: ignore
```

Now run the program again. It has only the four modules.

```{execute}
:id: run-without-old-file
:title: Run the program without spending.py
:wait: prompt
python main.py spending.csv --month 2026-03 --category transport
```

The terminal shows a report of 3 purchases with a total of 82.10.
Those are the three times that Mariam paid for transport in March
2026.

```{verify}
:id: old-file-gone
:label: The program runs without spending.py
:trigger: after:delete-old-file; after:run-without-old-file
import os, subprocess, sys

assert "spending.py" not in os.listdir("."), "The file spending.py is still there. Click the action above that deletes spending.py."
try:
    run = subprocess.run(
        [sys.executable, "main.py", "spending.csv", "--month", "2026-03", "--category", "transport"],
        capture_output=True, text=True, timeout=5, stdin=subprocess.DEVNULL,
        env={**os.environ, "PYTHON_COLORS": "0"},
    )
except subprocess.TimeoutExpired:
    raise AssertionError("Your program did not end after 5 seconds. Look in your files for a loop that never ends.") from None
if run.returncode != 0:
    last = (run.stderr.strip().splitlines() or ["no message"])[-1]
    raise AssertionError(f"Python stopped with an error when it ran main.py without spending.py. The last line of the error is: {last}. Go back to the pages before this one, and run the check of each part again. The message of the check says what to repair.")
assert run.stdout.splitlines()[:2] == ["Purchases: 3", "Total: 82.10"], "The check ran: python main.py spending.csv --month 2026-03 --category transport. The report must begin with the lines Purchases: 3 and Total: 82.10, and it did not. Go back to the pages before this one, and run the check of each part again."
print("The file spending.py is gone, and the program still runs. The check ran: python main.py spending.csv --month 2026-03 --category transport. The report shows 3 purchases with a total of 82.10.")
```

## What happened

The program is now four small modules, and each one has one job. The
command that runs it has changed from `python spending.py` to
`python main.py`. Everything after the name of the file is the same
as before.

If you want the old file again, the restart button at the top of
this panel begins the workshop again, with the files as they were at
the start. It also deletes the files that you made.
