---
title: What you have learned
---

# What you have learned

Your program now takes its instructions from the command that starts
it. One command chooses the file, and it can ask for one month, for
one category, or for both. You did not change the classes that hold
the data, and you did not change the code that makes the report.

## The ideas

- A **command line argument** is a word after the name of the
  program in a command. The shell divides the command into words at
  the spaces.

- Python gives the command line arguments to a script in the list
  `sys.argv`. The first item of the list is the name of the script.

- Every item of `sys.argv` is a string. A program that needs a
  number makes one, with `int()` for example.

- The module `argparse` reads the command line for you. You make a
  **parser** and tell it which command line arguments the program
  takes. It tests each command, shows a short message when a command
  is wrong, and writes the help text.

- An **option** is a command line argument that begins with `--`.
  The command may give it or leave it out. An option that the
  command does not give has the value `None`.

- A parameter with the default value `None`, and a test with
  `is None`, let one method work with a value or with no value.

- A method that returns a new object, and prints nothing, can be
  used by every part of a program.

## The code

| Code | What it does |
|------|--------------|
| `import sys` | makes the module `sys` ready to use |
| `sys.argv` | the list that holds the name of the script and the command line arguments |
| `sys.argv[1]` | the first command line argument, as a string |
| `import argparse` | makes the module `argparse` ready to use |
| `parser = argparse.ArgumentParser(description="...")` | makes a parser, with a description for the help text |
| `parser.add_argument("filename", help="...")` | adds a command line argument that the command must give |
| `parser.add_argument("--month", help="...")` | adds an option, which the command may leave out |
| `args = parser.parse_args()` | reads the command line, tests it, and returns an object that holds the values |
| `args.filename` | the value of the command line argument `filename` |
| `args.month` | the value of the option `--month`, or `None` |
| `def select(self, month=None, category=None):` | begins a method whose two parameters have the default value `None` |
| `month is None` | is `True` when no month was given |

## The commands

| Command | What it does |
|------|--------------|
| `python spending.py spending.csv` | reports on every purchase in the file |
| `python spending.py spending.csv --month 2026-02` | reports on the purchases of one month |
| `python spending.py spending.csv --category food` | reports on the purchases of one category |
| `python spending.py --help` | shows the help text |

## The code that you wrote

The method of the class `Ledger`:

```python
    def select(self, month=None, category=None):
        result = Ledger()
        for purchase in self.purchases:
            month_fits = month is None or purchase.month() == month
            category_fits = category is None or purchase.category == category
            if month_fits and category_fits:
                result.add(purchase)
        return result
```

The function `main()`:

```python
def main():
    parser = argparse.ArgumentParser(description="Report on the purchases in a CSV file.")
    parser.add_argument("filename", help="the CSV file that holds the purchases")
    parser.add_argument("--month", help="report on one month only, for example 2026-02")
    parser.add_argument("--category", help="report on one category only, for example food")
    args = parser.parse_args()

    ledger = read_ledger(args.filename).select(month=args.month, category=args.category)
    for line in report_lines(ledger):
        print(line)
```

## What comes next

The file `spending.py` has grown. It now holds the classes, the code
that reads a file, the code that makes the report, and the code that
reads the command line. A file that does four different things
becomes difficult to read.

The next workshop, **Splitting into modules**, divides the program
into several files. Each file has one job, and you write the imports
between them.

Click `Finish` at the bottom of this panel.
