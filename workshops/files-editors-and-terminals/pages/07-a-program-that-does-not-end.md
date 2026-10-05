---
title: A program that does not end
requires: [verify:count-clicked]
---

# A program that does not end

The commands that you ran until now finished at once. The command
showed its result, and the shell showed a new prompt.

Some programs take a long time. Some programs never end by themselves:
a clock, a game, a program that waits for visitors of a website. And
sometimes a program does not end because it has a mistake, such as a
loop whose condition is always `True`.

While a program runs, the terminal belongs to that program. The shell
waits. It shows no prompt, and it does not run a new command. So you
need a way to stop a program. This page and the next page are about
that.

## A program that counts

The file `count_up.py` holds a small Python program. Click the action
below to open it in the editor.

```{file-open}
:id: open-count
:title: Open the file count_up.py in the editor
:path: count_up.py
```

You know almost every line of this program:

- `import time` gets the module `time`, which comes with Python. A
  module is a file of Python code that someone has already written.

- `number = 1` makes the name `number` refer to `1`.

- `while True:` begins a loop. The condition of the loop is the value
  `True`, so the condition is never `False`, and the loop never ends.

- In the block of the loop, `print(number)` shows the number, and the
  next line adds `1` to it.

- `time.sleep(1)` is new. It makes the program wait for one second.
  Without this line, the numbers appear too fast to read.

So the program shows `1`, `2`, `3` and so on, one number each second,
and it never stops by itself.

## Start the program

This command runs the program:

```
python count_up.py
```

The first part, `python`, is the name of a program, as `cat` was. The
program `python` runs Python code. The second part says which file
holds the code. The next workshop, **Python in the terminal**,
explains the command `python`. For now, you only need to know that
this command runs the program in the file.

Click the action below. Then watch the terminal for a few seconds.

```{attempt}
:id: count-not-started
:check: count-clicked
:expect: this check has not seen it run
```

```{execute}
:id: start-count
:title: Run the program in the terminal
:wait: 3s
python count_up.py
```

The terminal shows a new number each second. Notice what is missing:
there is no prompt. The shell waits for the program to end, and this
program does not end.

````{hint}
:title: The terminal says that it cannot open the file
The terminal is not in the directory `work`, so `python` does not find
the file `count_up.py` there. Click in the terminal, type `pwd` and
press `Enter`. If the path ends with `trip`, type `cd ..` and press
`Enter`. Then click the action again.
````

## Stop the program

The program is still running. Now stop it. Click the action below.

```{attempt}
:id: count-still-running
:check: count-clicked
:expect: The program count_up.py is running now
```

```{interrupt}
:id: stop-count
:title: Stop the program that runs in the terminal
```

```{verify}
:id: count-clicked
:label: The program ran, and it has stopped
:trigger: after:start-count; after:stop-count; terminal-output "KeyboardInterrupt"
import os, subprocess
from pathlib import Path

marker = Path(".count_up_clicked")
found = subprocess.run(["pgrep", "-u", str(os.getuid()), "-f", r"count_up\.py"], capture_output=True, text=True)
if found.returncode == 0:
    marker.write_text("The check saw the program run.\n")
    raise AssertionError("The program count_up.py is running now. That is correct for the first half of this page. To stop the program, click the action with the title Stop the program that runs in the terminal.")
assert marker.exists(), "The program count_up.py is not running, and this check has not seen it run. Click the action with the title Run the program in the terminal. The program must run for a few seconds before you stop it."
print("The program ran, and it has stopped.")
```

Look at the terminal. The numbers have stopped, and the last lines
look like this:

```
^CTraceback (most recent call last):
  ...
KeyboardInterrupt
```

The three dots stand for some lines that are different on each
computer. They name the file `count_up.py` and the line that the
program was at when it stopped.

This looks like an error message, and it has the same form: a
traceback, and on the last line the name of what happened. But
nothing is wrong. `KeyboardInterrupt` is the way that Python says: "I
was told to stop, and I stopped". Most often the program was at the
line `time.sleep(1)`, because it spends almost all its time there.

Under these lines, the shell shows a prompt again. The terminal is
ready for the next command.

The action that you clicked did one thing: it sent the terminal the
keys `Ctrl` and `C`. The characters `^C` in the terminal are the mark
of those keys. On the next page, you press the keys yourself.
