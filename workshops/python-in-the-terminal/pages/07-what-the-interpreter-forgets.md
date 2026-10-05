---
title: What the interpreter forgets
requires: [verify:total-made, quiz:predict-total, verify:total-gone, verify:left-last]
---

# What the interpreter forgets

On each page so far, you started the interactive interpreter, typed
some lines, and left it. This page shows what happens to your work
when you leave.

## Make a name

Start the interpreter: type `python` in the terminal and press
`Enter`. Wait for the `>>>` prompt.

```{attempt}
:id: total-not-typed
:check: total-made
:expect: The line total = 25 + 15 is not among the lines
```

```{attempt}
:id: gone-before-total
:check: total-gone
:expect: Do the first step of this page first
```

```{attempt}
:id: left-before-total
:check: left-last
:expect: Do the steps above first
```

````{hint}
:title: The terminal already shows >>>
If the terminal shows `>>>`, the interpreter is still open from an
earlier page. Type `exit()` and press `Enter`. Then start the
interpreter again with the command `python`.
````

````{hint}
:title: Start the interpreter for me
:unlock: "total-made" in failed_checks or "total-made" in passed_checks
:locked: Try it first. This opens after the first check below has run.

Click the action below. It types the command `python` in the terminal
and presses `Enter`.

```{execute}
:id: start-for-total
:title: Run the command python
:wait: 2s
python
```
````

Type these two lines, and press `Enter` after each of them:

```python
total = 25 + 15
total
```

The first line makes the name `total` refer to `40`. The second line
is an expression that holds only the name, so the interpreter shows
the value that the name refers to:

```
>>> total = 25 + 15
>>> total
40
>>>
```

````{attempt}
:id: total-not-shown
:check: total-made
:expect: You typed total = 25 + 15. Now type the second line

```{execute}
:wait: 1s
total = 25 + 15
```
````

````{hint}
:title: Type the two lines for me
:unlock: "total-made" in failed_checks or "total-made" in passed_checks
:locked: Try the task first. This opens after the check below has run.

Click the two actions below, in order. Each of them types one line at
the `>>>` prompt and presses `Enter`. If the terminal does not show
`>>>`, start the interpreter first.

```{execute}
:id: send-total
:title: Type total = 25 + 15 at the >>> prompt
:wait: 1s
total = 25 + 15
```

```{execute}
:id: send-total-name
:title: Type total at the >>> prompt
:wait: 1s
total
```
````

```{verify}
:id: total-made
:label: The name total refers to 40
:trigger: terminal-output /[^0-9.]40\r\n/; after:send-total-name
from pathlib import Path
history = Path(".python_history")
typed = [line.strip() for line in history.read_text().splitlines() if line.strip()] if history.exists() else []
short = [line.replace(" ", "") for line in typed]
last = typed[-1] if typed else "nothing"
assert "total=25+15" in short or "total" in short, f"The line total = 25 + 15 is not among the lines that you typed at the >>> prompt. The last line that you typed there is {last}. Look at the terminal. If it does not show >>> at the start of the last line, type python and press Enter. Then type total = 25 + 15 and press Enter, and type total and press Enter."
assert "total" in short, "You typed total = 25 + 15. Now type the second line, total, at the >>> prompt and press Enter."
print("The name total refers to 40, and the interpreter showed its value.")
```

## Leave, and start again

Now leave the interpreter: type `exit()` and press `Enter`. The shell
shows its prompt again.

```{attempt}
:id: gone-before-leaving
:check: total-gone
:expect: You have not left the interpreter with exit() yet
```

````{hint}
:title: Leave the interpreter for me
:unlock: "total-gone" in failed_checks or "total-gone" in passed_checks
:locked: Try it first. This opens after the next check below has run.

Click the action below. It types `exit()` at the `>>>` prompt and
presses `Enter`.

```{execute}
:id: leave-with-total
:title: Type exit() at the >>> prompt
:wait: prompt
exit()
```
````

The next step is to start the interpreter again, and to type `total`
at the `>>>` prompt. Before you do it, answer this question.

```{quiz}
:id: predict-total
:title: After you start again
question: "You start the interpreter again and type `total` at the `>>>` prompt. What does the interpreter show?"
options:
  - { text: "`40`", explanation: "The name `total` referred to `40` in the interpreter that you left. The interpreter that you start now is a new one, and it has no names from before." }
  - { text: "Nothing", explanation: "The interpreter shows nothing after an assignment. The line `total` is an expression, so Python must work out its value, and it cannot." }
  - { text: "A `NameError`", correct: true }
explanation: "When the interpreter ends, every name that you made in it is gone. The command `python` starts a new interpreter, which knows no name `total`. Code that uses a name with no value stops with a `NameError`."
```

Now try it. Type `python` in the terminal and press `Enter`. Wait for
the `>>>` prompt. Then type this line, and press `Enter`:

```python
total
```

```{attempt}
:id: gone-not-typed
:check: total-gone
:expect: You left the interpreter. Now start it again
```

````{hint}
:title: Do the two steps for me
:unlock: "total-gone" in failed_checks or "total-gone" in passed_checks
:locked: Try the task first. This opens after the check below has run.

Click the two actions below, in order. The first starts the
interpreter. The second types `total` at the `>>>` prompt and presses
`Enter`.

```{execute}
:id: start-again
:title: Run the command python
:wait: 2s
python
```

```{execute}
:id: send-total-again
:title: Type total at the >>> prompt
:wait: 1s
total
```
````

```{verify}
:id: total-gone
:label: You asked a new interpreter for the name total
:trigger: terminal-output "NameError"; after:send-total-again
from pathlib import Path
history = Path(".python_history")
typed = [line.strip() for line in history.read_text().splitlines() if line.strip()] if history.exists() else []
short = [line.replace(" ", "") for line in typed]
made = [place for place, line in enumerate(short) if line in ("total=25+15", "total")]
assert made, "Do the first step of this page first: start the interpreter, type total = 25 + 15 and press Enter, and type total and press Enter."
left = [place for place, line in enumerate(short) if line in ("exit()", "quit()") and place > made[0]]
assert left, "You have not left the interpreter with exit() yet. Type exit() at the >>> prompt and press Enter. Then start the interpreter again with the command python, and type total at the >>> prompt."
assert "total" in short[left[0] + 1:], "You left the interpreter. Now start it again: type python and press Enter. Then type total at the >>> prompt and press Enter."
print("The new interpreter does not know the name total. Python stopped the line with a NameError.")
```

## What happened

Your terminal shows this:

```
>>> total
Traceback (most recent call last):
  File "<python-input-0>", line 1, in <module>
    total
NameError: name 'total' is not defined
>>>
```

This is a traceback, as in a notebook. Read it from the last line:
`NameError: name 'total' is not defined`. The line that begins with
`File` says where the error is. `<python-input-0>` is the name that
the interpreter gives to a line that you typed, and the number counts
your lines from `0`. If you typed other lines first, your number is
higher.

After the traceback, the interpreter shows the `>>>` prompt again. An error at the prompt
stops only the line that you typed. It does not end the interpreter.

The name is gone because of where it was kept. The interpreter keeps
every name and every value in the memory of the computer, and only
while the interpreter runs. `exit()` ends the program, and the
computer gives that memory to other programs. Think of the calculator
again: when you switch it off, the number on its screen is gone.

## Why this matters

Press the up arrow a few times, slowly. The interpreter shows the
lines that you typed before, one at a time. One of them is
`total = 25 + 15`. Do not press `Enter`. Press the down arrow until
the line after `>>>` is empty again.

The interpreter keeps the text of your lines in a list, and the list
is still there after you leave. But a line from the list is only
text. To get the name `total` again, you must run that line again,
and every other line that it needs, one at a time.

A notebook is different. The cells of a notebook stay in a document.
You can read them tomorrow, change them, and run them again. The
interactive interpreter keeps no document. This is why programmers
use it to try a line of code, and not to write a program.

So code that you want to keep needs a place where it stays, in the
right order, ready to run again. That place is a file. The next
workshop, **Code in a file**, shows how.

## Leave the interpreter

Type `exit()` at the `>>>` prompt, and press `Enter`.

```{attempt}
:id: last-still-open
:check: left-last
:expect: The check cannot see that you left the interpreter
```

````{hint}
:title: Leave the interpreter for me
:unlock: "left-last" in failed_checks or "left-last" in passed_checks
:locked: Try the task first. This opens after the check below has run.

Click the action below. It types `exit()` at the `>>>` prompt and
presses `Enter`.

```{execute}
:id: leave-last
:title: Type exit() at the >>> prompt
:wait: prompt
exit()
```
````

```{verify}
:id: left-last
:label: You left the interpreter with exit()
:trigger: terminal-output "exit"; after:leave-last
from pathlib import Path
history = Path(".python_history")
typed = [line.strip() for line in history.read_text().splitlines() if line.strip()] if history.exists() else []
short = [line.replace(" ", "") for line in typed]
made = [place for place, line in enumerate(short) if line in ("total=25+15", "total")]
left = [place for place, line in enumerate(short) if made and line in ("exit()", "quit()") and place > made[0]]
assert left and "total" in short[left[0] + 1:], "Do the steps above first: make the name total, leave the interpreter, start it again and type total. Then type exit() and press Enter."
assert short[-1] in ("exit()", "quit()"), f"The check cannot see that you left the interpreter. The last line that you typed at the >>> prompt is {typed[-1]}. Look at the terminal. If it shows >>> at the start of the last line, type exit() and press Enter. If it does not, start the interpreter with the command python, and then type exit() and press Enter."
print("The interpreter has ended, and the shell is ready for a command.")
```
