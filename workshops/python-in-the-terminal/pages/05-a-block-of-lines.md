---
title: A block of lines
requires: [verify:typed-loop, verify:left-loop]
---

# A block of lines

Some Python code needs more than one line. A `for` loop is an example.
Its first line ends with a colon, and under it there is a block: the
lines that begin with four spaces, which belong to the first line.

```python
for number in range(3):
    print(number * 2)
```

This loop runs its block three times. `range(3)` gives the numbers
`0`, `1` and `2`, one at a time. So the loop shows `0`, `2` and `4`.

At the `>>>` prompt this is a problem. The interpreter runs each line
when you press `Enter`. But it cannot run the first line of a loop
alone, because the loop has no block yet.

So the interpreter waits. After a line that ends with a colon, it does
not run anything. It shows a second prompt, `...`, in place of `>>>`.
The `...` prompt means: this code is not complete, type the next line
of the block.

The interpreter also needs to know where the block ends. You tell it
with an empty line: at the `...` prompt, you press `Enter` and type
nothing. Then the interpreter runs the whole loop.

## Type a loop

Start the interpreter: type `python` in the terminal and press
`Enter`. Wait for the `>>>` prompt.

```{attempt}
:id: loop-not-typed
:check: typed-loop
:expect: The loop is not among the lines
```

```{attempt}
:id: left-before-loop
:check: left-loop
:expect: Do the step above first
```

````{hint}
:title: The terminal already shows >>>
If the terminal shows `>>>`, the interpreter is still open from an
earlier page. Type `exit()` and press `Enter`. Then start the
interpreter again with the command `python`.
````

````{hint}
:title: Start the interpreter for me
:unlock: "typed-loop" in failed_checks or "typed-loop" in passed_checks
:locked: Try it first. This opens after the first check below has run.

Click the action below. It types the command `python` in the terminal
and presses `Enter`.

```{execute}
:id: start-for-loop
:title: Run the command python
:wait: 2s
python
```
````

Now type the loop. There are three steps.

1. Type `for number in range(3):` and press `Enter`. The line must end
   with a colon. The interpreter shows the `...` prompt.

2. Look at the cursor. The interpreter has put four spaces after
   `...` for you, so the block already begins in the right place.
   Type `print(number * 2)` and press `Enter`. The interpreter shows
   the `...` prompt again.

3. Press `Enter` one more time, and type nothing before it. This is
   the empty line that ends the block.

The interpreter runs the loop. Your terminal shows this:

```
>>> for number in range(3):
...     print(number * 2)
...
0
2
4
>>>
```

````{attempt}
:id: other-block
:check: typed-loop
:expect: but its block is not the line print(number * 2)

```{execute}
:wait: 2s
for number in range(3):
print(number)


```
````

````{hint}
:title: Python shows an IndentationError
On some computers, the interpreter does not put the four spaces after
`...` for you. Then the line with `print` begins with no spaces, and
Python stops with an `IndentationError`. Then it shows the `>>>`
prompt again.

Type the loop again. This time, at the `...` prompt, press the space
bar four times before you type `print(number * 2)`.
````

````{hint}
:title: The terminal still shows the ... prompt
The `...` prompt means that the interpreter waits for more lines of
the block. Press `Enter` and type nothing before it. The empty line
ends the block, and the loop runs.
````

````{hint}
:title: Type the loop for me
:unlock: "typed-loop" in failed_checks or "typed-loop" in passed_checks
:locked: Try the task first. This opens after the check below has run.

Click the action below. It sends the keys that you would press: the
first line, `Enter`, the second line, `Enter`, and `Enter` one more
time. It sends no spaces before `print`, because the interpreter puts
the four spaces there. If the terminal does not show `>>>`, start the
interpreter first.

```{execute}
:id: send-loop
:title: Type the loop at the >>> prompt
:wait: 2s
for number in range(3):
print(number * 2)


```
````

```{verify}
:id: typed-loop
:label: You typed a loop, and the interpreter ran it
:trigger: terminal-output /0\r\n2\r\n4\r\n/; after:send-loop
from pathlib import Path
history = Path(".python_history")
typed = [line.strip() for line in history.read_text().splitlines() if line.strip()] if history.exists() else []
short = [line.replace(" ", "") for line in typed]
last = typed[-1] if typed else "nothing"
first = "fornumberinrange(3):"
assert first in short, f"The loop is not among the lines that you typed at the >>> prompt. The last line that you typed there is {last}. Look at the terminal. If it shows the ... prompt, press Enter on an empty line to end the block. If it shows no >>> prompt, type python and press Enter. Then type the loop in three steps. First type for number in range(3): and press Enter. Next type print(number * 2) and press Enter. Last, press Enter on the empty line."
place = len(short) - 1 - short[::-1].index(first)
block = short[place + 1] if place + 1 < len(short) else ""
assert block == "print(number*2)", f"You typed the first line of the loop, but its block is not the line print(number * 2). The line under it is {typed[place + 1] if place + 1 < len(typed) else 'missing'}. Type the loop again in three steps. First type for number in range(3): and press Enter. Next type print(number * 2) and press Enter. Last, press Enter on the empty line."
print("The interpreter waited at the ... prompt until the block was complete. Then it ran the loop and showed 0, 2 and 4.")
```

## What happened

The interpreter did not run the first line when you pressed `Enter`.
It kept the line, and showed `...`. It kept the second line too. The
empty line told it that the block was complete, and only then did it
run the loop.

Every block works this way at the prompt: the block of an `if`, of a
`while`, and of a function that you define with `def`.

## Leave the interpreter

Type `exit()` at the `>>>` prompt, and press `Enter`.

```{attempt}
:id: loop-still-open
:check: left-loop
:expect: The check cannot see that you left the interpreter
```

````{hint}
:title: Leave the interpreter for me
:unlock: "left-loop" in failed_checks or "left-loop" in passed_checks
:locked: Try the task first. This opens after the check below has run.

Click the action below. It types `exit()` at the `>>>` prompt and
presses `Enter`.

```{execute}
:id: leave-loop
:title: Type exit() at the >>> prompt
:wait: prompt
exit()
```
````

```{verify}
:id: left-loop
:label: You left the interpreter with exit()
:trigger: terminal-output "exit"; after:leave-loop
from pathlib import Path
history = Path(".python_history")
typed = [line.strip() for line in history.read_text().splitlines() if line.strip()] if history.exists() else []
short = [line.replace(" ", "") for line in typed]
assert "fornumberinrange(3):" in short, "Do the step above first: type the loop at the >>> prompt. Then type exit() and press Enter."
assert short[-1] in ("exit()", "quit()"), f"The check cannot see that you left the interpreter. The last line that you typed at the >>> prompt is {typed[-1]}. Look at the terminal. If it shows >>> at the start of the last line, type exit() and press Enter. If it does not, start the interpreter with the command python, and then type exit() and press Enter."
print("The interpreter has ended, and the shell is ready for a command.")
```
