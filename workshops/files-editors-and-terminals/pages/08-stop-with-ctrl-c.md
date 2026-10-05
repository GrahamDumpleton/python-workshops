---
title: Stopping a program with Ctrl+C
requires: [verify:count-started, verify:count-stopped]
---

# Stopping a program with Ctrl+C

To stop a program that runs in a terminal, you hold the `Ctrl` key and
press the `C` key. People write this as "Ctrl+C". The shell then tells
the program to stop.

This is one of the most useful things to know about a terminal. When
a program runs too long, or when you started the wrong program, you
press `Ctrl` and `C`, and the shell shows the prompt again.

## The same keys mean something else in other places

You may know these keys already, with another meaning. In most
programs on Windows and Linux, `Ctrl` and `C` mean "copy": they copy
the text that you selected. In a terminal, the keys have an older
meaning: "stop the program that runs now". The terminal existed long
before "copy" was given these keys.

So remember: in a terminal, `Ctrl` and `C` do not copy. They stop a
program. The last page of this workshop shows how you copy in the
terminal.

On a Mac, most shortcuts use the `Cmd` key, and "copy" is `Cmd` and
`C`. But to stop a program in a terminal, a Mac also uses the `Ctrl`
key: hold `Ctrl` and press `C`. The `Cmd` key does not stop a
program.

## Now you do it

This time you start the program yourself, and you stop it yourself.

1. Click one time inside the terminal.

2. Type this command, and press `Enter`:

   ```
   python count_up.py
   ```

3. Wait until the terminal has shown the number `5`.

Do not stop the program yet. The check below looks at the programs
that run on the computer. It runs by itself when the terminal has
shown the number `3`.

```{attempt}
:id: typed-not-started
:check: count-started
:expect: The program count_up.py is not running
```

```{attempt}
:id: stopped-not-started
:check: count-stopped
:expect: the checks have not seen it run on this page
```

````{hint}
:title: The terminal says that it cannot open the file, or that the command is not found
Read the command again, letter by letter: `python`, a space, and then
`count_up.py`, with the character `_` between `count` and `up`. Type
the command again on the new prompt.

If the command is right and the terminal still cannot open the file,
the terminal is not in the directory `work`. Type `pwd` and press
`Enter`. If the path ends with `trip`, type `cd ..` and press `Enter`.
````

````{hint}
:title: Start the program for me
:unlock: "count-started" in failed_checks
:locked: Click Check below first

```{execute}
:id: start-typed
:wait: 3s
python count_up.py
```
````

```{verify}
:id: count-started
:label: You started the program
:trigger: terminal-output /\n3\r/; after:start-typed
import os, subprocess
from pathlib import Path

marker = Path(".count_up_typed")
found = subprocess.run(["pgrep", "-u", str(os.getuid()), "-f", r"count_up\.py"], capture_output=True, text=True)
if found.returncode == 0:
    marker.write_text("The check saw the program run.\n")
    print("The program count_up.py is running.")
else:
    assert marker.exists(), "The program count_up.py is not running. Click one time in the terminal, type python count_up.py and press Enter. This check runs again when the terminal has shown the number 3."
    print("The program count_up.py ran on this page.")
```

Now stop the program: hold `Ctrl` and press `C`. The check below runs
by itself when the program stops.

```{attempt}
:id: typed-still-running
:check: count-stopped
:expect: The program count_up.py is still running
```

````{hint}
:title: The program does not stop
The keys go to the part of the window that you clicked last. Click
one time inside the terminal, and then hold `Ctrl` and press `C`
again. On a Mac, hold `Ctrl`, and not `Cmd`.

On Windows and Linux there is one more possible reason. If some text
in the terminal is selected, JupyterLab takes `Ctrl` and `C` as "copy"
and the program continues. Selected text has another colour behind
it. Click one time in the terminal, so that no text is selected, and
press the keys again.
````

````{hint}
:title: Stop the program for me
:unlock: "count-stopped" in failed_checks
:locked: Click Check below first

```{interrupt}
:id: stop-typed
```
````

```{verify}
:id: count-stopped
:label: You stopped the program
:trigger: terminal-output "KeyboardInterrupt"; after:stop-typed
import os, subprocess
from pathlib import Path

found = subprocess.run(["pgrep", "-u", str(os.getuid()), "-f", r"count_up\.py"], capture_output=True, text=True)
assert found.returncode != 0, "The program count_up.py is still running. Click one time in the terminal, then hold Ctrl and press C. On a Mac, hold Ctrl also, and not Cmd."
assert Path(".count_up_typed").exists(), "No program count_up.py is running, but the checks have not seen it run on this page. Start it again: click in the terminal, type python count_up.py and press Enter. Wait until the terminal has shown the number 5, and then hold Ctrl and press C."
print("You started the program, and you stopped it.")
```

The terminal shows `^C` and the lines that end with
`KeyboardInterrupt`, as on the page before this one. Then it shows the
prompt.

## When you are not sure

`Ctrl` and `C` are safe to press in a terminal. When no program runs,
the shell only shows a new prompt. So when the terminal does not
answer and you do not know why, click in it and press `Ctrl` and `C`.

Remember this for the later workshops. Each time that a page starts a
program that does not end by itself, you stop it in this way.
