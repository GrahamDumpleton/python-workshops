---
title: The interactive interpreter
requires: [verify:typed-sums, verify:left-first]
---

# The interactive interpreter

When you run the command `python` with nothing after it, the
interpreter starts and waits for you. This is the **interactive
interpreter**: the interpreter started with no file, which shows the
`>>>` prompt and runs each line as you enter it. Programmers also
call it the REPL.

Most Python programmers use the interactive interpreter to try a line
of code. It is quick. You do not make a notebook or a file. You type
one line, and you see at once what Python does with it.

The interactive interpreter is like a calculator. You enter a sum,
and the answer shows at once. Nothing is kept on paper.

## Start the interpreter

```{attempt}
:id: nothing-typed
:check: typed-sums
:expect: You have not typed anything at the >>> prompt yet
```

```{attempt}
:id: left-before-typing
:check: left-first
:expect: Do the step above first
```

Click the action below. It runs the command `python` in the terminal.

```{execute}
:id: start-python
:title: Run the command python
:wait: 2s
python
```

The terminal now shows three new lines. They look like this:

```
Python 3.14.5 ...
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

The first line begins with the version of the interpreter. The rest
of that line is different on each computer, so this page leaves it
out. The second line names four words that give information about
Python. You do not need them now.

The third line is the important one. `>>>` is the prompt of the
interpreter. It shows that Python is ready for a line of code.

The terminal now has a different prompt, because a different program
reads what you type. Before, the shell read each line. Now Python
reads each line, and the shell waits until Python ends. So while the
terminal shows `>>>`, type Python code. Commands such as `ls` and
`pwd` belong to the shell, and Python does not know them.

## Type an expression

An expression is a piece of code that Python works out to a value.
Click in the terminal. Type this expression, and press `Enter`:

```python
2 + 3
```

Python shows the value, `5`, on the next line. Then it shows `>>>`
again, ready for the next line. Type a second expression, and press
`Enter`:

```python
10 / 4
```

Python shows `2.5`. Your terminal now shows this:

```
>>> 2 + 3
5
>>> 10 / 4
2.5
>>>
```

You did not hold `Shift`. In a notebook, `Enter` begins a new line in
the cell, and `Shift` and `Enter` run the cell. Here, `Enter` alone
runs the line.

````{attempt}
:id: other-sum
:check: typed-sums
:expect: The last line that you typed at the >>> prompt is 2 + 2

```{execute}
:wait: 1s
2 + 2
```
````

````{attempt}
:id: first-sum-only
:check: typed-sums
:expect: You typed 2 + 3. Now type the second expression

```{execute}
:wait: 1s
2 + 3
```
````

````{hint}
:title: The keys that I press do not show in the terminal
The keys go to the part of the window that you clicked last. Click
one time on the terminal, on the line with `>>>`. Then type.
````

````{hint}
:title: Type the two expressions for me
:unlock: "typed-sums" in failed_checks or "typed-sums" in passed_checks
:locked: Try the task first. This opens after the check below has run.

Click the two actions below, in order. Each of them types one line at
the `>>>` prompt and presses `Enter`.

```{execute}
:id: send-first-sum
:title: Type 2 + 3 at the >>> prompt
:wait: 1s
2 + 3
```

```{execute}
:id: send-sums
:title: Type 10 / 4 at the >>> prompt
:wait: 1s
10 / 4
```
````

```{verify}
:id: typed-sums
:label: You typed the two expressions at the >>> prompt
:trigger: terminal-output /[^0-9.]2\.5\r\n/; after:send-sums
from pathlib import Path
history = Path(".python_history")
typed = [line.strip() for line in history.read_text().splitlines() if line.strip()] if history.exists() else []
short = [line.replace(" ", "") for line in typed]
assert typed, "You have not typed anything at the >>> prompt yet. Click in the terminal, type 2 + 3 and press Enter. Then type 10 / 4 and press Enter."
assert "2+3" in short or "10/4" in short, f"This step asks for 2 + 3 and then 10 / 4. The last line that you typed at the >>> prompt is {typed[-1]}. Click in the terminal, type 2 + 3 and press Enter. Then type 10 / 4 and press Enter."
assert "10/4" in short, "You typed 2 + 3. Now type the second expression, 10 / 4, at the >>> prompt and press Enter."
print("You typed two expressions, and Python showed the value of each of them at once.")
```

## Leave the interpreter

The interpreter runs until you tell it to end. To leave it, type this
line at the `>>>` prompt, and press `Enter`:

```python
exit()
```

`exit()` is a call of a function, so it needs the two parentheses.
The function ends the interpreter. Then the shell shows its own
prompt again, and the terminal is ready for commands.

```{attempt}
:id: still-open
:check: left-first
:expect: The check cannot see that you left the interpreter
```

````{hint}
:title: The terminal shows something that I do not expect
Look at the start of the last line of the terminal.

If it is `>>>`, you are in the interpreter. Type Python code, or type
`exit()` to leave.

If it is the prompt of the shell, you are in the shell. A line of
Python that you type there is not a command, so the shell shows an
error message. For some lines, such as `exit()`, the shell does
something else: it shows `>` and waits for more text. To get the
prompt of the shell back, hold `Ctrl` and press `C`.
````

````{hint}
:title: Leave the interpreter for me
:unlock: "left-first" in failed_checks or "left-first" in passed_checks
:locked: Try the task first. This opens after the check below has run.

Click the action below. It types `exit()` at the `>>>` prompt and
presses `Enter`.

```{execute}
:id: leave-first
:title: Type exit() at the >>> prompt
:wait: prompt
exit()
```
````

```{verify}
:id: left-first
:label: You left the interpreter with exit()
:trigger: terminal-output "exit"; after:leave-first
from pathlib import Path
history = Path(".python_history")
typed = [line.strip() for line in history.read_text().splitlines() if line.strip()] if history.exists() else []
short = [line.replace(" ", "") for line in typed]
assert "10/4" in short, "Do the step above first: type 2 + 3 and then 10 / 4 at the >>> prompt. Then type exit() and press Enter."
assert short[-1] in ("exit()", "quit()"), f"The check cannot see that you left the interpreter. The last line that you typed at the >>> prompt is {typed[-1]}. Look at the terminal. If it shows >>> at the start of the last line, type exit() and press Enter. If it does not, start the interpreter with the command python, and then type exit() and press Enter."
print("The interpreter has ended, and the shell is ready for a command.")
```

You started the interpreter, used it, and left it. On the next pages
you start it yourself: you type `python` and press `Enter`.
