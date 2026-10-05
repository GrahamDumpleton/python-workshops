---
title: Copy a class into the file
requires: [verify:purchase-in-file]
---

# Copy a class into the file

The module `spending` is empty. On this page you put the first piece
of code into it: the class `Purchase`. You do not type the class
again. You copy it from the cell of the notebook and paste it into
the editor.

## Copy and paste

To **copy** text is to tell the computer to remember it. To **paste**
is to put the remembered text at the place of the cursor. The text
that you copied stays where it was, so after a copy and a paste the
text exists in two places.

You do both with the keyboard. On a Mac, use the `Cmd` key in place of
the `Ctrl` key.

| Keys | Keys on a Mac | What they do |
|------|---------------|--------------|
| `Ctrl` and `A` | `Cmd` and `A` | select all the text of the cell or the file that the cursor is in |
| `Ctrl` and `C` | `Cmd` and `C` | copy the selected text |
| `Ctrl` and `V` | `Cmd` and `V` | paste the copied text at the cursor |
| `Ctrl` and `S` | `Cmd` and `S` | save the file |

In the workshop **Files, editors and terminals**, `Ctrl` and `C` in
the terminal stopped a program. That meaning belongs to the terminal.
In a notebook and in the editor, `Ctrl` and `C` copies.

## Save the file

When you type or paste in the editor, the file on the disk does not
change yet. To **save** is to write what the editor shows to the file
on the disk. Python reads the file on the disk, so Python sees your
change only after you save.

The tab of the file shows its name, `spending.py`, and a small cross.
When the editor holds a change that is not saved, the cross changes
to a dot. When you save, the dot changes to a cross again.

## Your task

Copy the class `Purchase` from the notebook into the file
`spending.py`. Follow these steps:

1. In the notebook, find the cell that begins with `@dataclass`.
   Click on the code inside that cell, so that the cursor is in the
   cell.

2. Select all the code of the cell: hold `Ctrl` and press `A`. The
   code of the cell gets a coloured background.

3. Copy the code: hold `Ctrl` and press `C`. You see no change, but
   the computer now remembers the code.

4. Click in the editor, on the last line of the file `spending.py`.
   That line is empty.

5. Paste the code: hold `Ctrl` and press `V`. The class appears in
   the editor, and the tab shows a dot.

6. Save the file: hold `Ctrl` and press `S`. The dot changes to a
   cross again.

Copy the whole cell, from the line `@dataclass` to the line
`return self.date[:7]`. Do not copy the cell with the `import` lines.
The next page is about those lines.

```{hint}
:title: Hint: Ctrl and A selects every cell of the notebook
This happens when the cursor is not inside a cell. Click one time on
an empty part of the notebook to remove the selection. Then click on
the code of the cell, on one of its words, so that a cursor appears
there. Now hold `Ctrl` and press `A` again.

You can also select the code with the mouse. Press the mouse button
before the `@` of the first line, keep it pressed, move to the end of
the last line, and release the button.
```

```{hint}
:title: Hint: the check says that the file has no class
The check reads the file on the disk. Look at the tab of the file
`spending.py`. If the tab shows a dot in place of the cross, the file is
not saved. Click in the editor, then hold `Ctrl` and press `S`. On a
Mac, hold `Cmd` and press `S`.

If you press the keys while the cursor is in the notebook, JupyterLab
saves the notebook and not the file.
```

If the hints were not enough, the box below holds a solution. It opens
after you have saved the file, or after you have clicked `Check`.

```{attempt}
:id: purchase-not-copied
:check: purchase-in-file
:expect: has no class with the name Purchase yet
```

````{attempt}
:id: purchase-part-only
:check: purchase-in-file
:expect: Python cannot read the file spending.py

```{file-write}
:path: spending.py
"""The spending tracker: purchases, a ledger that holds them, and a file reader."""

@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
```
````

````{attempt}
:id: purchase-no-decorator
:check: purchase-in-file
:expect: The line @dataclass above the class is probably missing

```{file-write}
:path: spending.py
"""The spending tracker: purchases, a ledger that holds them, and a file reader."""

class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return self.date[:7]
```
````

````{hint}
:title: Show me a solution
:unlock: "purchase-in-file" in failed_checks or "purchase-in-file" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below writes the file `spending.py` with the class
`Purchase` in it, and saves it. It replaces what your file holds now.
Compare the editor with the cell of the notebook: the class is the
same text in both.

```{file-write}
:id: purchase-solution
:title: Write the file spending.py with the class Purchase in it
:path: spending.py
"""The spending tracker: purchases, a ledger that holds them, and a file reader."""

@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return self.date[:7]
```
````

```{verify}
:id: purchase-in-file
:label: The file spending.py holds the class Purchase
:trigger: file-saved spending.py; after:purchase-solution
import os, subprocess, sys
from pathlib import Path

assert Path("spending.py").exists(), "There is no file spending.py in the directory of this workshop. Go back one page, and click the action that creates the file."
program = '''
import csv, sys, traceback
from dataclasses import dataclass
from decimal import Decimal
names = dict(csv=csv, dataclass=dataclass, Decimal=Decimal, __name__="spending")
try:
    exec(compile(open("spending.py", encoding="utf-8").read(), "spending.py", "exec"), names)
except BaseException as error:
    print("CHECK error", traceback.format_exception_only(error)[-1].strip())
    sys.exit()
cls = names.get("Purchase")
if not isinstance(cls, type):
    print("CHECK missing")
    sys.exit()
try:
    first = cls("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
    second = cls("2025-12-31", "Calendar", Decimal("4.20"), "hobbies")
    months = [first.month(), second.month()]
except BaseException as error:
    print("CHECK broken", type(error).__name__)
    sys.exit()
print("CHECK ok" if months == ["2026-01", "2025-12"] else "CHECK broken")
'''
try:
    run = subprocess.run([sys.executable, "-c", program], capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL, env={**os.environ, "PYTHON_COLORS": "0"})
except subprocess.TimeoutExpired:
    raise AssertionError("Python did not finish reading the file spending.py after 10 seconds. The file must hold only the class Purchase and the first line. Remove any other code, and save the file.") from None
found = [line for line in run.stdout.splitlines() if line.startswith("CHECK ")]
result = found[-1].split(" ", 2) if found else ["CHECK", "error", "Python stopped before the check could look at the file."]
assert result[1] != "missing", "The file spending.py has no class with the name Purchase yet. Copy the cell that begins with @dataclass, and paste it under the first line of the file. Then save the file: hold Ctrl and press S, or on a Mac hold Cmd and press S. A dot on the tab of the file means that the file is not saved."
assert result[1] != "error", f"Python cannot read the file spending.py. Probably a part of the class is missing, or the spaces at the start of a line changed. Remove what you pasted, copy the whole cell again, paste it, and save the file. The last line of the error is: {result[2]}"
assert result[1] != "broken", "The file spending.py has a class Purchase, but the check cannot make a purchase from it with four values and ask for its month. The line @dataclass above the class is probably missing. Remove what you pasted, copy the whole cell from the line @dataclass to the last line, paste it, and save the file."
print("Correct. The file spending.py holds the class Purchase. The check made a purchase from it with the date 2026-01-17, and month() gave 2026-01.")
```

The class is now in two places: in the cell of the notebook, and in
the file. That is correct for now. At the end of this workshop, the
notebook uses only the file.
