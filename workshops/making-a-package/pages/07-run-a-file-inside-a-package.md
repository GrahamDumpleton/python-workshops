---
title: Run a file inside a package
requires: [quiz:predict-path, quiz:error-type]
---

# Run a file inside a package

The modules of the package now find each other. But how do you start
the program? Before the move, the command was
`python main.py spending.csv`. The file is now `spending/cli.py`. On
this page you try the command that seems right, and you see why it
does not work.

## Two ways in which Python reads a file

Python reads a file of code in one of two ways.

- **You run the file as a script**, with a command such as
  `python spending/cli.py`. A script is a file of Python code that you
  run as a program. Python sets the name `__name__` of the file to
  `"__main__"`. It does not treat the directory that holds the file as
  a package, so it does not know that the file belongs to one.

- **Another file imports it**, with a line such as
  `import spending.cli`. Python finds the package first, and then the
  module inside it. So Python knows that the module `cli` belongs to
  the package `spending`.

Now think about a relative import. The dot in the line
`from .report import report_lines` means "the package that this
module is in".

## Predict

The file `spending/cli.py` begins with these lines now:

```python
import argparse

from .report import report_lines
from .storage import read_ledger
```

```{quiz}
:id: predict-path
:title: What happens when the file runs as a script
question: "You run `python spending/cli.py spending.csv` in your work directory. What happens?"
options:
  - { text: "Python stops with an error, because a script does not belong to a package, so the dot has no meaning", correct: true }
  - { text: "The program shows the report, as it did before the move", explanation: "It did so before you changed the imports. Now the first import begins with a dot, and Python must know which package the dot means." }
  - { text: "Python stops with an error, because it cannot find the file `spending/cli.py`", explanation: "Python finds the file. The path `spending/cli.py` is correct, from your work directory." }
explanation: "When you run a file as a script, Python does not know that the file is inside a package. The dot means \"the package that this module is in\", and for a script there is no such package. Python stops at the first relative import."
```

Now try it. Type this command in the terminal, and press `Enter`:

```
python spending/cli.py spending.csv
```

Python shows this error message. In place of `...` you see the path of
your work directory:

```
Traceback (most recent call last):
  File ".../spending/cli.py", line 5, in <module>
    from .report import report_lines
ImportError: attempted relative import with no known parent package
```

```{quiz}
:id: error-type
:type: text
:case: false
question: "The last line of an error message begins with the type of the error. What is the type of this error? Type the one word."
answer:
  - { pattern: "ImportError:?", example: "ImportError" }
wrong:
  - { pattern: "ModuleNotFoundError:?", explanation: "That was the type of the error on the page before. Look at the last line of the newest error message in the terminal." }
otherwise: "The type is the first word of the last line of the error message, before the colon. It ends with the word `Error`."
explanation: "An `ImportError` means that an import did not work. The words after the type say why: Python tried a relative import, and it knows no package that the file belongs to. The \"parent package\" of a module is the package that the module is in."
```

## What happened

Python started the file `spending/cli.py` as a script. The first
import that begins with a dot is on line 5. Python needed the package
of the file, and a script has none, so Python stopped.

This is not a mistake in your code. The relative imports are correct.
The mistake is in the way that the program was started. A file that
is part of a package is not run by its path.

The package must be started by its name, so that Python finds the
package first. The next page shows how.
