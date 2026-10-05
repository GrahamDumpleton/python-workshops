---
title: Read a long traceback
requires: [quiz:stop-file, quiz:stop-line, quiz:stop-caller]
---

# Read a long traceback

In a notebook, a traceback was short, because all the code was in one
cell. This program is in several files, and the code of one file
calls the code of another. So the traceback is longer. It shows the
whole path that Python followed, from the start of the program to
the line where it stopped.

You read it in the same way as before: the last line first, and then
upward.

Think of a parcel that went from one office to the next, and was
lost. The record of the parcel lists every office that it passed, in
order. The last office in the list is where the problem appeared. If
that office did nothing wrong, you look at the office before it.

## The traceback in your terminal

This is the traceback, with two changes. Each line that begins with
`File` shows a long path on your computer, and the path is different
on every computer. Here, three dots stand for the first part of the
path, and for two line numbers that can differ.

```
Traceback (most recent call last):
  File "<frozen runpy>", line ..., in _run_module_as_main
  File "<frozen runpy>", line ..., in _run_code
  File ".../spending/__main__.py", line 5, in <module>
    main()
    ~~~~^^
  File ".../spending/cli.py", line 17, in main
    for line in report_lines(ledger):
                ~~~~~~~~~~~~^^^^^^^^
  File ".../spending/report.py", line 8, in report_lines
    lines.append(f"Total: {ledger.total():.2f}")
                           ~~~~~~~~~~~~^^
  File ".../spending/models.py", line 27, in total
    for purchase in self.purchase:
                    ^^^^^^^^^^^^^
AttributeError: 'Ledger' object has no attribute 'purchase'. Did you mean: 'purchases'?
```

## The parts

**The last line** says what went wrong. An object of the class
`Ledger` was asked for an attribute with the name `purchase`, and it
has no attribute with that name. Sometimes Python adds a suggestion,
as it does here. The suggestion is a guess, and it is often right.

**Each step above it** begins with a line that starts with `File`.
That line has three parts:

1. The file, such as `.../spending/models.py`.

2. The line number in that file, such as `line 27`.

3. The function or method that the line is in, such as `in total`.
   The word `<module>` means that the line is not inside a function.

Under the `File` line is the line of code itself. Under that is a row
of the characters `~` and `^`. They mark the part of the line that
Python was performing.

**The order** is the order in which things happened. The first steps
are at the top, and the last step is at the bottom. Read from the top
down, the steps say this:

1. `__main__.py`, line 5, called the function `main`.

2. In `cli.py`, line 17 of `main` called the function
   `report_lines`.

3. In `report.py`, line 8 of `report_lines` called the method
   `total` of the ledger.

4. In `models.py`, line 27 of `total` is where Python stopped.

The two lines that name `<frozen runpy>` belong to Python itself.
They are the code that performs `python -m`. You can ignore them.

## Where to look

Start at the bottom. The last step names the line where Python
stopped. Very often, the mistake is in that line.

Sometimes that line is correct, and the mistake is in the code that
called it. For example, the caller gave it a wrong value. Then you
move one step upward, and look at the line that made the call. This
is the reason that the traceback shows every step.

Answer these three questions from the traceback in your terminal, or
from the copy above.

```{quiz}
:id: stop-file
:title: The file
:type: text
:case: false
question: "In which file is the line where Python stopped? Type the name of the file, without the directory."
answer:
  - "models.py"
  - { pattern: "(.*/)?spending/models\\.py", example: "spending/models.py" }
wrong:
  - { pattern: "(.*/)?__main__(\\.py)?", explanation: "`__main__.py` is where the program started. It is the first step. Python stopped at the last step, which is the `File` line nearest to the bottom." }
  - { pattern: "(.*/)?cli(\\.py)?", explanation: "`cli.py` is one of the steps on the way. Python stopped at the last step, which is the `File` line nearest to the bottom." }
  - { pattern: "(.*/)?report(\\.py)?", explanation: "`report.py` holds the line that called the method `total`. Python stopped inside `total`, one step further down." }
otherwise: "Find the last line that begins with `File`. It is three lines above the line that begins with `AttributeError`. The name of the file is the last part of the path, after the last `/`."
explanation: "The last step of the traceback names the file `models.py` in the directory `spending`. That is the file to open."
```

```{quiz}
:id: stop-line
:title: The line
:type: text
question: "Which line of that file is it? Type the number."
answer: "27"
wrong:
  - { text: "5", explanation: "Line 5 belongs to the first step, in `__main__.py`. Look at the last line that begins with `File`." }
  - { text: "17", explanation: "Line 17 belongs to the step in `cli.py`. Look at the last line that begins with `File`." }
  - { text: "8", explanation: "Line 8 belongs to the step in `report.py`. Look at the last line that begins with `File`." }
otherwise: "Find the last line that begins with `File`. The number comes after the word `line`."
explanation: "Python stopped at line 27 of `models.py`. A traceback always gives you a file and a line number, so you never need to search the whole program."
```

```{quiz}
:id: stop-caller
:title: The caller
:type: text
:case: false
question: "Python stopped inside the method `total`. Which function called `total`? Type its name."
answer:
  - "report_lines"
  - "report_lines()"
wrong:
  - { pattern: "main(\\(\\))?", explanation: "`main` called `report_lines`, and `report_lines` called `total`. The caller of a step is the step directly above it." }
  - { pattern: "total(\\(\\))?", explanation: "`total` is the method in which Python stopped. The caller is the step directly above it in the traceback." }
otherwise: "Find the step directly above the last step. Its `File` line ends with the word `in` and the name of a function."
explanation: "The step above the last one is in `report.py`: line 8 of the function `report_lines` holds the call `ledger.total()`. If line 27 of `models.py` were correct, this is the next line that you would look at."
```

You now know the file and the line. On the next page you repair the
bug.
