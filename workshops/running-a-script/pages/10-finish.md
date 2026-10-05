---
title: What you have learned
---

# What you have learned

You ran a file of Python code as a program, and you made that file
into a program that is worth running.

## The ideas

- The interpreter is the program named `python`, which runs Python
  code. A script is a file of Python code that you run as a program.

- The command `python spending.py` starts the interpreter. The
  interpreter runs every line of the file, from the first to the last,
  and then ends.

- Each run reads the file from the disk again. After you change a
  script, you save it and run the command again. Nothing needs a
  restart.

- A script shows only what the code gives to `print()`. A notebook
  shows the value of the last line of a cell, and the `>>>` prompt
  shows the value of every expression, but a script does not.

- Programmers put the work of a program in a function named `main`.
  The name is a habit, and Python does not call the function for you.

- A function that returns its lines is more useful than a function
  that prints them. Other code can show the lines, write them to a
  file, or check them.

- A function must also work when its data is empty. In an `if` line,
  an empty list counts as `False`.

- Python gives every file that it runs the name `__name__`. It refers
  to `"__main__"` in the file that `python` was asked to run, and to
  the name of the module in a file that is imported.

- To import a module, Python runs every line of its file. The test
  `if __name__ == "__main__":` keeps the call of `main()` from running
  at an import.

## The commands and the code

| Command or code | What it does |
|-----------------|--------------|
| `python spending.py` | runs the file `spending.py` as a script |
| `python -c "import spending"` | runs the code between the quotes, which here imports the module `spending` |
| `def main():` | begins the function where the program starts |
| `lines.append("")` | adds an empty line to a list of lines |
| `if not ledger.purchases:` | tests for an empty list |
| `return lines` | gives the list of lines back to the code that called the function |
| `print(__name__)` | shows `__main__` in a script, and the name of the module in a module |
| `if __name__ == "__main__":` | begins a block that runs only when the file is run as a script |

## The end of your file

The classes `Purchase` and `Ledger` and the function `read_ledger` did
not change. After them, your file `spending.py` now has these lines:

```python
def report_lines(ledger):
    lines = [f"Purchases: {len(ledger.purchases)}"]
    if not ledger.purchases:
        return lines
    lines.append(f"Total: {ledger.total():.2f}")
    lines.append("")
    lines.append("Total for each category:")
    for category, amount in ledger.total_by_category().items():
        lines.append(f"  {category}: {amount:.2f}")
    lines.append("")
    lines.append("Total for each month:")
    for month, amount in ledger.total_by_month().items():
        lines.append(f"  {month}: {amount:.2f}")
    lines.append("")
    largest = ledger.largest()
    lines.append(f"Largest purchase: {largest.date} {largest.description} {largest.amount:.2f}")
    return lines


def main():
    ledger = read_ledger("spending.csv")
    for line in report_lines(ledger):
        print(line)


if __name__ == "__main__":
    main()
```

## What comes next

Your program has two limits. It always reads the file `spending.csv`,
because that name is written in the code. And it always shows the
whole report.

The next workshop, **Taking arguments**, removes both limits. You
learn how a program reads the words that come after its name in the
command. Then one command can ask for the report of one month, or of
one category, from any file of purchases.

Click `Finish` at the bottom of this panel.
