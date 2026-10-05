---
title: A program with bugs
requires: [quiz:first-error]
---

# A program with bugs

A **bug** is a mistake in a program that makes it do the wrong thing.
The work of finding bugs and repairing them has a name too:
programmers call it **debugging**.

A bug can show itself in two ways:

- The program stops with an error message. This kind is the simpler
  one to find, because Python tells you where it stopped.

- The program runs to its end, and shows a wrong result. Python
  shows no error message, because Python does not know what result
  you wanted. This kind is harder to find.

Think of a recipe for bread with a mistake in it. One mistake names
an ingredient that is not in the list. The cook must stop and ask.
Another mistake says 100 grams of salt, where 10 grams is right. The
cook can follow every step, and the bread is still wrong.

The spending tracker in your work directory has three bugs. They were
put there for this workshop. You find them one at a time.

## What the program must do

Before you look for a bug, you must know what the program is meant to
do. This program reads the purchases in a file, and shows a report.
For the 37 purchases of Mariam, the correct report is this:

```
Purchases: 37
Total: 2834.79

Total for each category:
  rent: 1950.00
  food: 445.60
  transport: 181.30
  phone: 54.00
  hobbies: 63.49
  clothes: 140.40

Total for each month:
  2026-01: 917.20
  2026-02: 942.34
  2026-03: 975.25

Largest purchase: 2026-01-01 Rent for January 650.00
```

At the end of this workshop, your program shows exactly this report.

## Run the program

Click in the terminal. Type this command, and press `Enter`:

```
python -m spending spending.csv
```

The command tells Python to run the package `spending`. The word
`spending.csv` is the name of the file that the program reads.

````{hint}
:title: Run the command for me
The action below types the command in the terminal and runs it.

```{execute}
:id: run-first
:title: Run the program
:wait: prompt
python -m spending spending.csv
```
````

The program does not show the report. Python stopped, and it shows a
traceback. This is the first bug.

The traceback is long. Do not read all of it yet. Look only at its
last line.

```{quiz}
:id: first-error
:title: The type of the error
:type: text
:case: false
question: "The last line of the traceback begins with the type of the error. Type that one word."
answer:
  - "AttributeError"
  - { pattern: "AttributeError:.*", example: "AttributeError: 'Ledger' object has no attribute 'purchase'" }
wrong:
  - { text: "Traceback", explanation: "`Traceback` is the first word of the first line. Look at the last line that the terminal shows above the prompt. Type the word before the colon." }
  - { text: "Ledger", explanation: "`Ledger` is the name of a class in the message. The type of the error is the first word of the line, before the colon." }
otherwise: "Look at the last line that the terminal shows above the prompt. It begins with one word that ends in `Error`, and then a colon. Type that word."
explanation: "The last line is `AttributeError: 'Ledger' object has no attribute 'purchase'`, and then a suggestion from Python. An **object** is a value made from a class, and an **attribute** is a value that belongs to an object, with a name, written after a dot. An `AttributeError` means that the code asked an object for an attribute that the object does not have."
```

Now you know what went wrong. You do not know yet where it went
wrong. The next page shows how to read the rest of the traceback.
