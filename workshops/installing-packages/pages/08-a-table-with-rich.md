---
title: A table with rich
requires: [quiz:prices-last-row]
---

# A table with rich

The environment holds `rich` again. Now you use it. On this page you
see a small program that shows a table, before you change the
spending tracker on the next pages.

## What a table needs

A table has a title above it, a heading for each column, and rows.
`rich` draws the lines round the table and between the parts, and it
makes each column as wide as its widest text. You say only what goes
in the table.

You use two classes of `rich`. Each class is in a module of its own,
inside the package `rich`:

- The class `Table`, in the module `rich.table`. An object of this
  class holds the title, the columns and the rows of one table.

- The class `Console`, in the module `rich.console`. An object of
  this class writes to the terminal. It knows how wide the terminal
  is, and which colours the terminal can show.

You import them in the same way that you import a module of your own
package: the name of the package, a dot, and the name of the module.

## The code

The action below makes the file `prices.py` in your work directory,
and opens it in the editor. Click it, and read the program.

```{file-write}
:id: make-prices
:title: Make the file prices.py and open it
:path: prices.py
:open: true
from rich.console import Console
from rich.table import Table

table = Table(title="Prices")
table.add_column("Product")
table.add_column("Price", justify="right")
table.add_row("Tea", "2.50")
table.add_row("Bread", "3.20")
table.add_row("All", "5.70", style="bold")

Console().print(table)
```

What each line does:

- The two `import` lines get the classes `Console` and `Table` from
  the package `rich`.

- `Table(title="Prices")` makes an empty table with the title
  `Prices`. The name `table` refers to it.

- The method `add_column` adds one column to the table. Its argument
  is the heading of the column. With `justify="right"`, the text in
  that column is on the right side of the column, which is where
  numbers are easiest to compare.

- The method `add_row` adds one row. It takes one argument for each
  column, in the order of the columns. Each argument is a string:
  `rich` shows text, so a number must first become text. With
  `style="bold"`, the whole row is shown in bold letters.

- `Console()` makes a console object, and its method `print` shows
  the table in the terminal.

Why not `print(table)`? The function `print()` shows the text of a
value. A `Table` object has only the default text of an object, such
as `<rich.table.Table object at 0x...>`, which does not draw anything.
The method `print` of a console knows how to draw a table.

## Run it

Look at the prompt first. It must begin with `(.venv)`, because the
program needs `rich`, and only the environment has it. Type this
command in the terminal, and press `Enter`:

```
python prices.py
```

The terminal shows the table, with lines round it:

```
      Prices
┏━━━━━━━━━┳━━━━━━━┓
┃ Product ┃ Price ┃
┡━━━━━━━━━╇━━━━━━━┩
│ Tea     │  2.50 │
│ Bread   │  3.20 │
│ All     │  5.70 │
└─────────┴───────┘
```

In your terminal, the title is in sloped letters, and the headings and
the row `All` are in bold letters.

````{hint}
:title: Run the command for me
:unlock: "prices-last-row" in failed_checks
:locked: Answer the question below first

```{execute}
:id: run-prices
:title: Run the program prices.py
:wait: prompt
python prices.py
```
````

```{hint}
:title: Hint: Python says that there is no module named rich
The terminal does not use the environment. Type
`source .venv/bin/activate` and press `Enter`. The prompt then begins
with `(.venv)`. Then type `python prices.py` again.
```

```{quiz}
:id: prices-last-row
:title: The last row
:type: text
question: "Look at the table in the terminal. What does the last row show in the column `Price`?"
answer: "5.70"
wrong:
  - { text: "3.20", explanation: "That is the row `Bread`. Look at the row under it, the last row of the table." }
  - { text: "All", explanation: "That is the text in the column `Product`. Type what the same row shows in the column `Price`." }
otherwise: "Find the row `All` at the bottom of the table. Type the number in its second column."
explanation: "The last row is the row `All`, which the last call of `add_row` added. `rich` shows the rows in the order in which the program added them."
```

The program wrote the total `5.70` itself, as text. In the spending
tracker, the totals come from the purchases. On the next page you
write a function that makes such a table from the purchases.
