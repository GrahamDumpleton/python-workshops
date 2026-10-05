---
title: A table of the spending
requires: [verify:category-table-works]
---

# A table of the spending

Now you use `rich` in the spending tracker. On this page you write a
function that makes a table of the total for each category. On the
next page the program shows it.

## What the function must do

The function goes into the file `report.py` of the directory
`spending`, below the function `report_lines`. These are its exact
parts:

- Its name is `category_table`, and it has one parameter, `ledger`.
  A ledger is an object of the class `Ledger`. Its method
  `total_by_category()` returns a dictionary, with each category as a
  key and the total of that category as the value. Its method
  `total()` returns the total of every purchase. Each total is a
  `Decimal`.

- It makes a table with the title `Spending`.

- The table has two columns. The first has the heading `Category`.
  The second has the heading `Total`, with its text on the right side
  of the column.

- It adds one row for each category, in the order of the dictionary
  that `total_by_category()` returns. The row holds the name of the
  category and its total with two decimal places, such as `445.60`.

- After those rows, it adds one more row, in bold letters. The row
  holds the word `All` and the total of every purchase, with two
  decimal places.

- It returns the table. It does not show it.

The file also needs the line that imports `Table`. Put it near the
top of the file, under the first line, which is the description of
the module in quotation marks.

For the purchases of `spending.csv`, the table has these rows:

| Category | Total |
|----------|-------|
| `rent` | `1950.00` |
| `food` | `445.60` |
| `transport` | `181.30` |
| `phone` | `54.00` |
| `hobbies` | `63.49` |
| `clothes` | `140.40` |
| `All` | `2834.79` |

## Your task: write the function

The action below shows the file `report.py` in the file browser.

```{file-browser-reveal}
:id: show-report
:title: Show the file report.py in the file browser
:path: spending/report.py
```

Double-click the file `report.py` to open it in the editor. Add the
`import` line and the function. Then save the file: hold `Ctrl` and
press `S`, or on a Mac hold `Cmd` and press `S`. The check below runs
each time that you save the file.

```{hint}
:title: Hint: where to look
The program `prices.py` on the last page has every part that you
need: the import line, `Table(title=...)`, two calls of `add_column`,
calls of `add_row`, and `style="bold"`. The function `report_lines`
in the same file has a loop over `ledger.total_by_category().items()`,
and it writes each amount with `:.2f`.
```

````{hint}
:title: Hint: the shape of the function
The function has this shape. Replace each `...` with the right code.

```python
def category_table(ledger):
    table = Table(...)
    table.add_column(...)
    table.add_column(...)
    for category, amount in ledger.total_by_category().items():
        table.add_row(...)
    table.add_row(...)
    return table
```

Each value that you give to `add_row` must be a string, so write each
amount with an f-string, such as `f"{amount:.2f}"`.
````

If the hints were not enough, the box below holds a solution. It
opens after the check below has run once.

```{attempt}
:id: table-missing
:check: category-table-works
:expect: has no function category_table yet
```

````{attempt}
:id: table-no-import
:check: category-table-works
:expect: stopped with a NameError

```{file-write}
:path: spending/report.py
:from: answers/report-no-import.py
```
````

````{attempt}
:id: table-bad-module
:check: category-table-works
:expect: Python could not import the file report.py

```{file-write}
:path: spending/report.py
:from: answers/report-bad-module.py
```
````

````{attempt}
:id: table-no-return
:check: category-table-works
:expect: returns nothing, so it gives None

```{file-write}
:path: spending/report.py
:from: answers/report-no-return.py
```
````

````{attempt}
:id: table-list
:check: category-table-works
:expect: returns a list, and it must return a Table

```{file-write}
:path: spending/report.py
:from: answers/report-list.py
```
````

````{attempt}
:id: table-headings
:check: category-table-works
:expect: The table has the columns Name and Amount

```{file-write}
:path: spending/report.py
:from: answers/report-headings.py
```
````

````{attempt}
:id: table-decimal
:check: category-table-works
:expect: stopped with a NotRenderableError

```{file-write}
:path: spending/report.py
:from: answers/report-decimal.py
```
````

````{attempt}
:id: table-no-all
:check: category-table-works
:expect: no row All at the end

```{file-write}
:path: spending/report.py
:from: answers/report-no-all.py
```
````

````{attempt}
:id: table-no-places
:check: category-table-works
:expect: Each amount must have two decimal places

```{file-write}
:path: spending/report.py
:from: answers/report-no-places.py
```
````

````{attempt}
:id: table-no-bold
:check: category-table-works
:expect: the last row All is not bold

```{file-write}
:path: spending/report.py
:from: answers/report-no-bold.py
```
````

````{hint}
:title: Show me a solution
:unlock: "category-table-works" in failed_checks or "category-table-works" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below writes a solution to the file `spending/report.py`,
and opens it in the editor. It replaces what the file holds now.
Compare it with your own code.

```{file-write}
:id: report-solution
:title: Write a solution to spending/report.py
:path: spending/report.py
:from: answers/report-solution.py
:open: true
```
````

```{verify}
:id: category-table-works
:label: The function category_table makes the table
:trigger: file-saved spending/report.py
import json, os, subprocess
from pathlib import Path

probe = '''
import json
from decimal import Decimal

def show(error):
    text = str(error)
    return type(error).__name__ + (": " + text if text else "")

try:
    import spending.report as report
    from spending.models import Ledger, Purchase
except BaseException as error:
    print(json.dumps({"stage": "import", "type": type(error).__name__, "name": getattr(error, "name", None), "last": show(error)}))
    raise SystemExit(0)
if not hasattr(report, "category_table"):
    print(json.dumps({"stage": "missing"}))
    raise SystemExit(0)
tests = [
    [("2026-01-03", "Bread", "3.20", "food"), ("2026-01-05", "Bus ticket", "2.50", "transport"), ("2026-01-09", "Rice", "4.30", "food")],
    [("2026-02-01", "Rent for February", "650", "rent")],
]
results = []
for test in tests:
    ledger = Ledger()
    for date, description, amount, category in test:
        ledger.add(Purchase(date, description, Decimal(amount), category))
    try:
        table = report.category_table(ledger)
    except BaseException as error:
        print(json.dumps({"stage": "call", "type": type(error).__name__, "name": getattr(error, "name", None), "last": show(error)}))
        raise SystemExit(0)
    found = {"type": type(table).__name__}
    if found["type"] == "Table":
        found["title"] = str(table.title)
        found["headers"] = [str(column.header) for column in table.columns]
        found["justify"] = [column.justify for column in table.columns]
        found["rows"] = [[str(cell) for cell in row] for row in zip(*[list(column.cells) for column in table.columns])]
        found["styles"] = [str(row.style) if row.style else "" for row in table.rows]
    results.append(found)
print(json.dumps({"stage": "done", "results": results}))
'''

expected = [
    ("a ledger of three purchases, food 3.20, transport 2.50 and food 4.30", [["food", "7.50"], ["transport", "2.50"], ["All", "10.00"]]),
    ("a ledger of one purchase, rent 650", [["rent", "650.00"], ["All", "650.00"]]),
]
assert Path(".venv/bin/python").exists(), "There is no environment .venv in your work directory. Make it and activate it, then run python -m pip install -r requirements.txt."
assert Path("spending/report.py").exists(), "There is no file report.py in the directory spending. The workshop shipped it. Click Restart in the panel to get it back."
try:
    run = subprocess.run(
        [".venv/bin/python", "-c", probe],
        capture_output=True, text=True, timeout=30, stdin=subprocess.DEVNULL,
        env={**os.environ, "PYTHON_COLORS": "0"},
    )
except subprocess.TimeoutExpired:
    raise AssertionError("The function category_table did not end after 30 seconds. Look for a loop that never ends.") from None
lines = run.stdout.strip().splitlines()
if run.returncode != 0 or not lines:
    last = (run.stderr.strip().splitlines() or ["(nothing)"])[-1]
    raise AssertionError(f"Python stopped with an error when it ran your code. The last line of the error is: {last}")
found = json.loads(lines[-1])
if found["stage"] == "import":
    if found["type"] == "ModuleNotFoundError" and found["name"] == "rich":
        raise AssertionError("The environment .venv has no package rich. Look at the prompt. If it does not begin with (.venv), type source .venv/bin/activate and press Enter. Then type python -m pip install -r requirements.txt and press Enter.")
    if found["type"] in ("ModuleNotFoundError", "ImportError"):
        raise AssertionError(f"Python could not import the file report.py. The last line of the error is: {found['last']}. Check the import line at the top of the file. It must be exactly: from rich.table import Table. Then save the file.")
    raise AssertionError(f"Python could not import the file report.py. The last line of the error is: {found['last']}. Read the line of the file that the error names, correct it, and save the file.")
if found["stage"] == "missing":
    raise AssertionError("The file spending/report.py has no function category_table yet. Write the function at the end of the file, under the function report_lines, and save the file. To save, hold Ctrl and press S, or on a Mac hold Cmd and press S.")
if found["stage"] == "call":
    if found["type"] == "NameError" and found["name"] == "Table":
        raise AssertionError(f"The function category_table stopped with a NameError. The last line of the error is: {found['last']}. The module report.py must import the name Table before it can use it. Add the line from rich.table import Table near the top of the file, and save the file.")
    if found["type"] == "NotRenderableError":
        raise AssertionError(f"The function category_table stopped with a NotRenderableError. The last line of the error is: {found['last']}. The method add_row needs a string for each cell, and an amount is a Decimal. Make the string with an f-string and :.2f, as the function report_lines does, and save the file.")
    raise AssertionError(f"The function category_table stopped with a {found['type']}. The last line of the error is: {found['last']}. Read the line of the file that the error names, correct it, and save the file.")
for result, (ledger, rows) in zip(found["results"], expected):
    if result["type"] == "NoneType":
        raise AssertionError("The function category_table returns nothing, so it gives None. Its last line must be return table, with four spaces before it, as in the line that begins with for. Save the file after you change it.")
    if result["type"] != "Table":
        raise AssertionError(f"The function category_table returns a {result['type']}, and it must return a Table. Make the table with Table(title=\"Spending\"), add the columns and the rows to it, and return the table. Save the file after you change it.")
    if result["title"] != "Spending":
        raise AssertionError(f"The table has the title {result['title']}, and it must have the title Spending. Write Table(title=\"Spending\"), and save the file.")
    if result["headers"] != ["Category", "Total"]:
        shown = " and ".join(result["headers"]) or "no columns"
        raise AssertionError(f"The table has the columns {shown}, and it must have two columns: Category and Total, in that order. Save the file after you change it.")
    if result["justify"][1] != "right":
        raise AssertionError("The numbers in the column Total must be on the right side of the column. Add justify=\"right\" when you add the column Total, and save the file.")
    if result["rows"] != rows:
        wanted = "; ".join(" ".join(row) for row in rows)
        shown = "; ".join(" ".join(row) for row in result["rows"]) or "no rows"
        if result["rows"] == rows[:-1]:
            raise AssertionError(f"The table has a row for each category, and no row All at the end. For {ledger}, the rows must be: {wanted}. Add the last row after the loop, and save the file.")
        if [row[0] for row in result["rows"]] == [row[0] for row in rows]:
            raise AssertionError(f"For {ledger}, the table has the rows: {shown}. They must be: {wanted}. Each amount must have two decimal places. Write the amount with an f-string and :.2f, and save the file.")
        raise AssertionError(f"For {ledger}, the rows must be: {wanted}. Your table has the rows: {shown}. Save the file after you change it.")
    if result["styles"][-1] != "bold":
        raise AssertionError("The rows are right, but the last row All is not bold. Add style=\"bold\" to the call of add_row for that row, and save the file.")
print("Correct. The function category_table returns the right table for two different ledgers.")
```

## What happened

The module `report.py` now imports `rich`, so the whole spending
tracker needs `rich`. That is what the file `requirements.txt` already
says. The program runs only with the `python` of an environment that
has `rich`.
