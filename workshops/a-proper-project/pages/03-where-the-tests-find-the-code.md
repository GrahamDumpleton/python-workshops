---
title: Where the tests find the code
requires: [quiz:predict-in-tests, quiz:missing-module]
---

# Where the tests find the code

The tests passed. But which code did they test? On this page you find
out where the tests found the package `spending`.

## The first place that Python looks

The tests begin with lines such as `from spending.models import
Ledger`. For that line, Python looks for `spending` in the list of
directories `sys.path`. When you start Python with `python -m`, the
first directory of that list is the **current directory**: the
directory that the terminal is in now.

Your terminal is in your work directory, and the directory `spending`
is there. So Python found the package because of where you were. It
did not find it because the package was installed.

## Run the tests from another directory

The command `cd` changes the current directory. `cd tests` goes into
the directory `tests`, and `cd ..` returns to the directory
that holds it. The two dots mean "the directory above".

```{quiz}
:id: predict-in-tests
:title: Predict
question: "You type `cd tests`, and then `python -m pytest`. The terminal is now in the directory `tests`. What happens?"
options:
  - { text: "The seven tests pass, as before", explanation: "pytest finds the seven tests. But now the current directory is `tests`, and that directory has no `spending` in it." }
  - { text: "pytest finds no tests", explanation: "The tests are in the directory `tests`, so pytest finds them. The problem comes when the tests import their code." }
  - { text: "Each file of tests stops with an error, because Python cannot find the package `spending`", correct: true }
explanation: "Now the first directory of `sys.path` is `tests`, and nothing in `tests` has the name `spending`. No environment holds it either. So each `import` line of the tests fails. Try it below."
```

Type these three commands in the terminal, one after another, and
press `Enter` after each one. The second command is the one that
matters. The third command takes the terminal back to your work
directory.

```
cd tests
```

```
python -m pytest
```

```
cd ..
```

While the terminal is in the directory `tests`, the prompt shows the
name `tests`. After `cd ..`, the name is gone again.

````{hint}
:title: Run the commands for me
The actions below run the three commands. Click them in this order.

```{execute}
:id: go-into-tests
:title: Go into the directory tests
:wait: prompt
cd tests
```

```{execute}
:id: run-tests-in-tests
:title: Run the tests from there
:wait: prompt
python -m pytest
```

```{execute}
:id: go-back-up
:title: Return to the work directory
:wait: prompt
cd ..
```
````

If you clicked the actions, a note under the second one may say that
the command ended with status 2. That is correct here: pytest ends
that way when it cannot run the tests.

pytest shows many lines. Look for the lines that begin with `E`. They
end like this:

```
E   ModuleNotFoundError: No module named 'spending'
```

```{quiz}
:id: missing-module
:title: The module that Python did not find
:type: text
:case: false
question: "Look at the lines that begin with `E`. What is the name of the module that Python did not find?"
answer: ["spending", "'spending'"]
wrong:
  - { text: "pytest", explanation: "pytest runs. It is the code of the tests that cannot be found. Look at the end of the lines that begin with `E`." }
  - { pattern: ".*ModuleNotFoundError.*", explanation: "That is the type of the error. Type only the name at the end of the line, with no quotes." }
otherwise: "Look at the lines that begin with `E`. Each one ends with `No module named` and a name in quotes. Type that name, with no quotes."
explanation: "The tests could not find `spending`. So before, they did not test an installed program. They tested whatever directory with the name `spending` was in the place where you stood. Programmers want the opposite: the tests must test the program that users install. The next pages show how."
```

If the prompt still shows the name `tests`, type `cd ..` and press
`Enter` before you go to the next page.
