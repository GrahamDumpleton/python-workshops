---
title: Each line shows its value
requires: [quiz:predict-two-values, verify:typed-two-values, verify:typed-price, verify:left-values]
---

# Each line shows its value

The interactive interpreter and a notebook cell do the same thing with
an expression: Python works out the value, and you see it. Two things
are different.

The first difference is when the code runs. In a notebook, you write
all the lines of a cell, and then you run the cell. At the `>>>`
prompt, each line runs when you press `Enter`. You cannot return to a
line and change it after it has run.

The second difference is which values you see. The workshop **Talking
to Python** said that a notebook shows only the value of the last line
of a cell, and that this rule belongs to the notebook. The interactive
interpreter has another rule: it shows the value of every expression,
as soon as you enter it.

## Predict

Think about these two lines. You type the first line at the `>>>`
prompt and press `Enter`. Then you type the second line and press
`Enter`.

```python
10 - 4
6 * 7
```

```{quiz}
:id: predict-two-values
:title: How many values
:type: text
:case: false
question: "How many values does the interactive interpreter show for these two lines? Type the number."
answer: ["2", "two"]
wrong:
  - { pattern: "1|one", explanation: "One value is what a notebook cell shows for two lines, because a notebook shows only the value of the last line. The interactive interpreter runs each line when you press `Enter`, and shows its value at once." }
  - { pattern: "6|42|6\\s*,?\\s*(and)?\\s*42", explanation: "That is a value that the interpreter shows. The question asks how many values it shows." }
otherwise: "The interpreter runs each line when you press `Enter`. Count the lines that are expressions."
explanation: "The interpreter shows two values. It shows `6` when you enter the first line, and `42` when you enter the second line. In a notebook cell, these two lines show only `42`."
```

## Start the interpreter and try it

On the page before, a click started the interpreter. Now you start it
yourself. Click in the terminal, type this command, and press `Enter`:

```
python
```

Wait until the terminal shows the `>>>` prompt.

```{attempt}
:id: two-values-not-typed
:check: typed-two-values
:expect: The line 10 - 4 is not among the lines
```

```{attempt}
:id: price-not-typed
:check: typed-price
:expect: The line price = 4 is not among the lines
```

```{attempt}
:id: left-before-values
:check: left-values
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
:unlock: "typed-two-values" in failed_checks or "typed-two-values" in passed_checks
:locked: Try it first. This opens after the first check below has run.

Click the action below. It types the command `python` in the terminal
and presses `Enter`.

```{execute}
:id: start-for-values
:title: Run the command python
:wait: 2s
python
```
````

Now type the two lines, and press `Enter` after each of them:

```python
10 - 4
6 * 7
```

Your terminal shows this:

```
>>> 10 - 4
6
>>> 6 * 7
42
>>>
```

````{attempt}
:id: first-value-only
:check: typed-two-values
:expect: You typed 10 - 4. Now type the second line

```{execute}
:wait: 1s
10 - 4
```
````

````{hint}
:title: Type the two lines for me
:unlock: "typed-two-values" in failed_checks or "typed-two-values" in passed_checks
:locked: Try the task first. This opens after the check below has run.

Click the two actions below, in order. Each of them types one line at
the `>>>` prompt and presses `Enter`. If the terminal does not show
`>>>`, start the interpreter first.

```{execute}
:id: send-first-value
:title: Type 10 - 4 at the >>> prompt
:wait: 1s
10 - 4
```

```{execute}
:id: send-two-values
:title: Type 6 * 7 at the >>> prompt
:wait: 1s
6 * 7
```
````

```{verify}
:id: typed-two-values
:label: You typed the two lines, and each showed its value
:trigger: terminal-output /[^0-9.]42\r\n/; after:send-two-values
from pathlib import Path
history = Path(".python_history")
typed = [line.strip() for line in history.read_text().splitlines() if line.strip()] if history.exists() else []
short = [line.replace(" ", "") for line in typed]
last = typed[-1] if typed else "nothing"
assert "10-4" in short or "6*7" in short, f"The line 10 - 4 is not among the lines that you typed at the >>> prompt. The last line that you typed there is {last}. Look at the terminal. If it does not show >>> at the start of the last line, type python and press Enter. Then type 10 - 4 and press Enter, and type 6 * 7 and press Enter."
assert "6*7" in short, "You typed 10 - 4. Now type the second line, 6 * 7, at the >>> prompt and press Enter."
print("The interpreter showed 6 and then 42: one value for each line.")
```

## Names

Names work at the `>>>` prompt as they work in a notebook. An
assignment makes a name refer to a value. The interpreter keeps the
name for as long as it runs, so a later line can use it.

Type these two lines, and press `Enter` after each of them:

```python
price = 4
price * 3
```

Your terminal shows this:

```
>>> price = 4
>>> price * 3
12
>>>
```

After the first line, Python shows nothing. An assignment is not an
expression, so it has no value to show. This is the same in a
notebook. The second line is an expression, so Python shows its
value, `12`.

````{attempt}
:id: price-only
:check: typed-price
:expect: You typed price = 4. Now type the second line

```{execute}
:wait: 1s
price = 4
```
````

````{hint}
:title: Type the two lines for me
:unlock: "typed-price" in failed_checks or "typed-price" in passed_checks
:locked: Try the task first. This opens after the check below has run.

Click the two actions below, in order. Each of them types one line at
the `>>>` prompt and presses `Enter`.

```{execute}
:id: send-price
:title: Type price = 4 at the >>> prompt
:wait: 1s
price = 4
```

```{execute}
:id: send-price-total
:title: Type price * 3 at the >>> prompt
:wait: 1s
price * 3
```
````

```{verify}
:id: typed-price
:label: You made a name and used it
:trigger: terminal-output /[^0-9.]12\r\n/; after:send-price-total
from pathlib import Path
history = Path(".python_history")
typed = [line.strip() for line in history.read_text().splitlines() if line.strip()] if history.exists() else []
short = [line.replace(" ", "") for line in typed]
last = typed[-1] if typed else "nothing"
assert "price=4" in short, f"The line price = 4 is not among the lines that you typed at the >>> prompt. The last line that you typed there is {last}. Type price = 4 and press Enter. Then type price * 3 and press Enter."
assert "price*3" in short, "You typed price = 4. Now type the second line, price * 3, at the >>> prompt and press Enter."
print("The name price refers to 4, and the interpreter showed the value of price * 3, which is 12.")
```

## What each tool shows

You have now seen two rules for what is shown:

- A notebook shows the value of the last line of a cell.

- The interactive interpreter shows the value of every expression.

A later workshop, **Running a script**, shows the third rule: a
program in a file shows nothing unless it uses `print()`. The function
`print()` shows a value in all three places.

## Leave the interpreter

Type `exit()` at the `>>>` prompt, and press `Enter`.

```{attempt}
:id: values-still-open
:check: left-values
:expect: The check cannot see that you left the interpreter
```

````{hint}
:title: Leave the interpreter for me
:unlock: "left-values" in failed_checks or "left-values" in passed_checks
:locked: Try the task first. This opens after the check below has run.

Click the action below. It types `exit()` at the `>>>` prompt and
presses `Enter`.

```{execute}
:id: leave-values
:title: Type exit() at the >>> prompt
:wait: prompt
exit()
```
````

```{verify}
:id: left-values
:label: You left the interpreter with exit()
:trigger: terminal-output "exit"; after:leave-values
from pathlib import Path
history = Path(".python_history")
typed = [line.strip() for line in history.read_text().splitlines() if line.strip()] if history.exists() else []
short = [line.replace(" ", "") for line in typed]
assert "price*3" in short, "Do the steps above first: type the lines of this page at the >>> prompt. Then type exit() and press Enter."
assert short[-1] in ("exit()", "quit()"), f"The check cannot see that you left the interpreter. The last line that you typed at the >>> prompt is {typed[-1]}. Look at the terminal. If it shows >>> at the start of the last line, type exit() and press Enter. If it does not, start the interpreter with the command python, and then type exit() and press Enter."
print("The interpreter has ended, and the shell is ready for a command.")
```
