---
title: The up arrow
requires: [quiz:predict-again, verify:line-again, verify:left-arrow]
---

# The up arrow

In a notebook, you can click on a cell, change it, and run it again.
At the `>>>` prompt you cannot do that. A line that has run is only
text on the screen, and you cannot change it.

So the interpreter gives you another way. It remembers every line
that you enter. The up arrow is the key with an arrow that points up.
When you press it at the `>>>` prompt, the interpreter brings back
the line that you entered last, and shows it after `>>>`. Each time
you press the key again, it brings back the line before that one. The
down arrow goes the other way.

A line that the up arrow brings back does not run until you press
`Enter`. Before you press `Enter`, you can change the line: the left
arrow and the right arrow move the cursor in it.

Programmers use the up arrow very often: to run a line again, and to
correct a line that had a mistake in it.

## Enter some lines

The example is a train that travels 120 kilometres in 2 hours. The
distance divided by the hours gives the speed.

Start the interpreter: type `python` in the terminal and press
`Enter`. Wait for the `>>>` prompt.

```{attempt}
:id: speed-not-typed
:check: line-again
:expect: The line distance / hours is not among the lines
```

```{attempt}
:id: left-before-arrow
:check: left-arrow
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
:unlock: "line-again" in failed_checks or "line-again" in passed_checks
:locked: Try it first. This opens after the first check below has run.

Click the action below. It types the command `python` in the terminal
and presses `Enter`.

```{execute}
:id: start-for-arrow
:title: Run the command python
:wait: 2s
python
```
````

Type these three lines, and press `Enter` after each of them:

```python
distance = 120
hours = 2
distance / hours
```

The interpreter shows `60.0` after the third line. The speed is 60
kilometres in each hour.

Now the train is slower, and it needs 3 hours. Type this line, and
press `Enter`:

```python
hours = 3
```

````{attempt}
:id: speed-one-time
:check: line-again
:expect: You have not typed the line hours = 3 yet

```{execute}
:wait: 1s
distance = 120
```

```{execute}
:wait: 1s
hours = 2
```

```{execute}
:wait: 1s
distance / hours
```
````

````{attempt}
:id: speed-not-again
:check: line-again
:expect: You have not run the line distance / hours again

```{execute}
:wait: 1s
hours = 3
```
````

## Predict

The next step runs the line `distance / hours` again.

```{quiz}
:id: predict-again
:title: The same line, run again
:type: text
question: "What does the interpreter show when the line `distance / hours` runs again?"
answer: "40.0"
wrong:
  - { text: "40", explanation: "The number is right. But the operator `/` always gives a float, so Python shows a decimal point." }
  - { text: "40,0", explanation: "Python writes a float with a point, not with a comma." }
  - { pattern: "60(\\.0)?", explanation: "That was the value when `hours` was `2`. The line runs again now, and Python reads the value that `hours` has now, which is `3`." }
otherwise: "The name `distance` refers to `120`, and the name `hours` now refers to `3`. Work out `120 / 3`, and remember which type of number `/` gives."
explanation: "The line is the same text, but Python runs it again from the start. It reads the values that the names have now: `120 / 3` is `40.0`."
```

## Bring the line back

Do not type the line again. Press the up arrow one time. The
interpreter shows `hours = 3`, the line that you entered last. Press
the up arrow one more time. The interpreter shows `distance / hours`.
Now press `Enter`.

Your terminal shows this:

```
>>> hours = 3
>>> distance / hours
40.0
>>>
```

````{hint}
:title: The up arrow shows another line
Each press of the up arrow goes one line further back. If you went
too far, press the down arrow to come forward again. When the line
after `>>>` is `distance / hours`, press `Enter`.

The interpreter keeps the lines of earlier pages too. So if you press
the up arrow many times, you see lines such as `exit()`.
````

````{hint}
:title: Do the steps for me
:unlock: "line-again" in failed_checks or "line-again" in passed_checks
:locked: Try the task first. This opens after the check below has run.

Click the five actions below, in order. Each of them types one line
at the `>>>` prompt and presses `Enter`. An action cannot press the
up arrow for you, so the last action types the line again. If the
terminal does not show `>>>`, start the interpreter first.

```{execute}
:id: send-distance
:title: Type distance = 120 at the >>> prompt
:wait: 1s
distance = 120
```

```{execute}
:id: send-hours
:title: Type hours = 2 at the >>> prompt
:wait: 1s
hours = 2
```

```{execute}
:id: send-speed
:title: Type distance / hours at the >>> prompt
:wait: 1s
distance / hours
```

```{execute}
:id: send-hours-again
:title: Type hours = 3 at the >>> prompt
:wait: 1s
hours = 3
```

```{execute}
:id: send-speed-again
:title: Type distance / hours at the >>> prompt again
:wait: 1s
distance / hours
```
````

```{verify}
:id: line-again
:label: You ran the line distance / hours two times
:trigger: terminal-output /[^0-9.]40\.0\r\n/; after:send-speed-again
from pathlib import Path
history = Path(".python_history")
typed = [line.strip() for line in history.read_text().splitlines() if line.strip()] if history.exists() else []
short = [line.replace(" ", "") for line in typed]
last = typed[-1] if typed else "nothing"
speed = "distance/hours"
assert speed in short, f"The line distance / hours is not among the lines that you typed at the >>> prompt. The last line that you typed there is {last}. Look at the terminal. If it does not show >>> at the start of the last line, type python and press Enter. Then type the three lines distance = 120 and hours = 2 and distance / hours, and press Enter after each of them."
first = short.index(speed)
assert "hours=3" in short[first + 1:], "You ran the line distance / hours one time. You have not typed the line hours = 3 yet. Type hours = 3 at the >>> prompt and press Enter."
change = first + 1 + short[first + 1:].index("hours=3")
assert speed in short[change + 1:], "You typed hours = 3. You have not run the line distance / hours again after it. Press the up arrow two times, so that the line after >>> is distance / hours. Then press Enter."
print("The line distance / hours ran two times. The second time, Python read the new value of hours and showed 40.0.")
```

The up arrow brings back a whole block. If you press the up arrow
after a loop, the interpreter shows all the lines of the loop
together.

## Leave the interpreter

Type `exit()` at the `>>>` prompt, and press `Enter`.

```{attempt}
:id: arrow-still-open
:check: left-arrow
:expect: The check cannot see that you left the interpreter
```

````{hint}
:title: Leave the interpreter for me
:unlock: "left-arrow" in failed_checks or "left-arrow" in passed_checks
:locked: Try the task first. This opens after the check below has run.

Click the action below. It types `exit()` at the `>>>` prompt and
presses `Enter`.

```{execute}
:id: leave-arrow
:title: Type exit() at the >>> prompt
:wait: prompt
exit()
```
````

```{verify}
:id: left-arrow
:label: You left the interpreter with exit()
:trigger: terminal-output "exit"; after:leave-arrow
from pathlib import Path
history = Path(".python_history")
typed = [line.strip() for line in history.read_text().splitlines() if line.strip()] if history.exists() else []
short = [line.replace(" ", "") for line in typed]
assert "distance/hours" in short, "Do the steps above first: type the lines of this page at the >>> prompt. Then type exit() and press Enter."
assert short[-1] in ("exit()", "quit()"), f"The check cannot see that you left the interpreter. The last line that you typed at the >>> prompt is {typed[-1]}. Look at the terminal. If it shows >>> at the start of the last line, type exit() and press Enter. If it does not, start the interpreter with the command python, and then type exit() and press Enter."
print("The interpreter has ended, and the shell is ready for a command.")
```
