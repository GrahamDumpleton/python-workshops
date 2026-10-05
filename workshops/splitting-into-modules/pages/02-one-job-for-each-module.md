---
title: One job for each module
requires: [quiz:read-terminal, quiz:which-module]
---

# One job for each module

A program can be one file, or it can be several files that work
together. Each file of Python code is a **module**. When a program is
split, each module gets one job, and the name of the file says what
the job is.

## Why programmers split a program

A program grows. Each new feature adds lines, and after some time one
file holds many hundreds of lines. Three problems then appear:

- It takes a long time to find the part that you want to change.

- The parts are mixed. The code that reads a file is next to the code
  that shows a report, and a change to one can damage the other.

- Another program cannot use one part alone. It gets all of the file
  or nothing.

Think of a kitchen. The plates are on one shelf, the cups are on
another shelf, and the knives and forks are in a drawer. You find a
cup quickly, because you know where the cups are. A kitchen with
everything in one large box holds the same things, but every search
takes longer.

## The four jobs in spending.py

`spending.py` is still a short file, but it already does four
different jobs. Click each action below. Each one marks one part of
the file in the editor for a few seconds.

```{editor-highlight}
:id: show-classes
:title: Show job 1, the classes Purchase and Ledger
:path: spending.py
:line: 9-59
:duration: 4s
```

Job 1 is to describe the data. The class `Purchase` describes one
purchase, and the class `Ledger` holds many purchases and adds up
their totals.

```{editor-highlight}
:id: show-reader
:title: Show job 2, the function read_ledger
:path: spending.py
:line: 62-68
:duration: 4s
```

Job 2 is to read the purchases from a CSV file.

```{editor-highlight}
:id: show-report
:title: Show job 3, the function report_lines
:path: spending.py
:line: 71-87
:duration: 4s
```

Job 3 is to make the lines of text of the report.

```{editor-highlight}
:id: show-main
:title: Show job 4, the function main
:path: spending.py
:line: 90-103
:duration: 4s
```

Job 4 is the command line. The function `main` reads the command line
arguments, calls the other parts, and prints the report. The last two
lines of the file call `main()` when you run the file.

## The plan

You give each job a module of its own:

| Module | Its one job | What moves into it |
|--------|-------------|--------------------|
| `models.py` | describe the data | the classes `Purchase` and `Ledger` |
| `storage.py` | read the data from a file | the function `read_ledger` |
| `report.py` | make the text of the report | the function `report_lines` |
| `main.py` | the command line | the function `main`, and the two lines that call it |

The word "model" is what programmers call a class that describes the
data of a program. That is the reason for the name `models.py`.

The program must do exactly the same after the split as before it. A
split changes where the code is. It does not change what the code
does.

## See what the program does now

Before you change anything, look at what the program shows. The
action below runs a command in the terminal, which is under the
editor. The command runs `spending.py` with the file of purchases,
for the food that Mariam bought in February 2026.

```{execute}
:id: run-old-program
:title: Run the program for the food of February
:wait: prompt
python spending.py spending.csv --month 2026-02 --category food
```

Read the report in the terminal.

```{quiz}
:id: read-terminal
:type: text
:title: Read the terminal
question: "The first line of the report begins with `Purchases:`. Which number comes after it?"
answer: "6"
wrong:
  - { text: "37", explanation: "37 is the number of all the purchases in the file. This command has the options `--month 2026-02` and `--category food`, so the report is about fewer purchases. Read the first line that the terminal shows under the command." }
  - { pattern: "199[.,]85", explanation: "That is the total, from the second line of the report. The question asks for the number in the first line, after `Purchases:`." }
  - { pattern: "Purchases: *6", explanation: "That is the right line. Type only the number that comes after `Purchases:`." }
otherwise: "Look in the terminal for the line that begins with `Purchases:`, under the command. Type the number that comes after it."
explanation: "Mariam bought food 6 times in February 2026, for a total of 199.85. When you have split the program, the same command line arguments must give the same report."
```

Now one question about the plan. Imagine that next month you add a
function with the name `write_ledger`. It saves the purchases of a
ledger in a new CSV file.

```{quiz}
:id: which-module
:title: A place for new code
question: "Which module is the right place for the function `write_ledger`?"
options:
  - { text: "`models.py`", explanation: "`models.py` describes what a purchase and a ledger are. It does not read or write files." }
  - { text: "`report.py`", explanation: "`report.py` makes the text that a person reads. A CSV file of purchases is data for a program, and the module for files of data is another one." }
  - { text: "`storage.py`", correct: true }
  - { text: "`main.py`", explanation: "`main.py` handles the command line. It calls the other modules to do the work." }
explanation: "The job of `storage.py` is the files of data. `read_ledger` reads purchases from a file, and `write_ledger` writes purchases to a file, so both belong there. When each module has one job, you know where new code goes and where to look for old code."
```

On the next page, you make the first of the four files.
