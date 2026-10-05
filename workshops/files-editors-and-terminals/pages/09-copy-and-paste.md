---
title: Copy and paste in the terminal
requires: [quiz:ticket-passenger, verify:code-pasted]
---

# Copy and paste in the terminal

To **copy** means to make the computer remember a piece of text. To
**paste** means to put the remembered text in the place where the
cursor is. You may know both from other programs.

In a terminal you need them often. You paste a long command, so that
you do not have to type every character. You copy what a command
showed, to keep it in a file or to send it to a person who helps you.

In most programs on Windows and Linux, the keys are `Ctrl` and `C` to
copy, and `Ctrl` and `V` to paste. On a Mac, they are `Cmd` and `C`,
and `Cmd` and `V`. In a terminal, `Ctrl` and `C` stop a program, as
the page before this one explained. So the terminal of JupyterLab has
rules of its own:

| What you do | On Windows and Linux | On a Mac |
|---|---|---|
| Paste in the terminal | hold `Ctrl` and press `V` | hold `Cmd` and press `V` |
| Copy from the terminal | select the text, then hold `Ctrl` and press `C` | select the text, then hold `Cmd` and press `C` |

On Windows and Linux, `Ctrl` and `C` have two meanings in this
terminal. When some text in the terminal is selected, the keys copy
that text. When no text is selected, the keys stop the program that
runs.

## Paste a command

First you paste a command. The command shows the file `ticket.txt`,
which is in the directory `trip`:

```
cat trip/ticket.txt
```

The text `trip/ticket.txt` is a path: the directory `trip`, then the
character `/`, then the file `ticket.txt` inside it. With a path, a
command can use a file that is not in the current directory, and you
do not need `cd`.

1. Click this command: {copy}`cat trip/ticket.txt`. The click copies
   the command.

2. Click one time inside the terminal.

3. Paste: hold `Ctrl` and press `V`. On a Mac, hold `Cmd` and press
   `V`. The command appears after the prompt.

4. Press `Enter`.

````{hint}
:title: Nothing appears when I paste
First click one time inside the terminal, and then press the keys
again.

There is one more way. Hold `Shift`, and click in the terminal with
the right button of the mouse. This opens the menu of your web
browser, and you can choose `Paste` there. This does not work in
every web browser. If nothing works, type the command.
````

````{hint}
:title: Run the command for me

```{execute}
:id: run-cat-ticket
:wait: prompt
cat trip/ticket.txt
```
````

```{quiz}
:id: ticket-passenger
:title: What the ticket says
:type: text
:case: false
question: "The terminal shows three lines of the ticket. The first line begins with `Passenger:`. What is the name after it?"
answer:
  - "Amara Okafor"
  - "Passenger: Amara Okafor"
wrong:
  - { text: "Amara", explanation: "That is the first part of the name. Type both parts." }
  - { pattern: ".*KX7.*", explanation: "That is the booking code, from the last line. The question asks for the name on the first line." }
otherwise: "Look at the line under the command in the terminal. Type the two words after `Passenger:`."
explanation: "The ticket is for Amara Okafor. The last line of the ticket holds her booking code. You copy that code in the next step."
```

## Copy from the terminal

Amara wants the booking code at the end of her packing list, so that
she does not forget it. The code is `KX7-4492-PLM`. Such a code is
hard to type without a mistake, so you copy it.

1. In the terminal, find the line that begins with `Booking code:`.

2. Select the code. Put the mouse before the `K`, hold the button of
   the mouse, move to the end of the code, and release the button. The
   code now has another colour behind it.

3. Copy: hold `Ctrl` and press `C`. On a Mac, hold `Cmd` and press
   `C`.

4. Click the action below, so that the file `packing.txt` shows in the
   editor.

5. In the editor, click at the end of the last line and press `Enter`
   to begin a new line.

6. Paste, in the way that is usual on your computer: hold `Ctrl` and
   press `V`. On a Mac, hold `Cmd` and press `V`.

7. Save the file: hold `Ctrl` and press `S`. On a Mac, hold `Cmd` and
   press `S`.

```{file-open}
:id: open-packing-for-code
:title: Show the file packing.txt in the editor
:path: packing.txt
```

The check below runs each time you save the file.

```{attempt}
:id: code-missing
:check: code-pasted
:expect: does not hold the booking code yet
```

````{attempt}
:id: code-part
:check: code-pasted
:expect: holds only a part of the booking code

```{editor-insert}
:path: packing.txt
KX7-4492
```
````

````{hint}
:title: Show me a solution
:unlock: "code-pasted" in failed_checks or "code-pasted" in passed_checks
:locked: Click Check below first

This action adds the booking code as a new line at the end of the
file, and saves the file.

```{editor-insert}
:id: code-solution
:path: packing.txt
KX7-4492-PLM
```
````

```{verify}
:id: code-pasted
:label: The file packing.txt on the disk holds the booking code
:trigger: file-saved packing.txt; after:code-solution
from pathlib import Path

path = Path("packing.txt")
text = path.read_text().upper() if path.exists() else ""
if "KX7-4492-PLM" not in text and ("KX7" in text or "4492" in text or "PLM" in text):
    raise AssertionError("The file packing.txt on the disk holds only a part of the booking code. The whole code is KX7-4492-PLM. Select the code in the terminal from the K to the M, copy it, paste it in the editor, and save the file.")
assert "KX7-4492-PLM" in text, "The file packing.txt on the disk does not hold the booking code yet. Copy the code KX7-4492-PLM from the terminal, paste it at the end of the file in the editor, and save the file. A dot on the tab means that the file is not saved."
print("The file on the disk holds the booking code KX7-4492-PLM.")
```

You used all three tools together: the terminal showed a file, you
copied from the terminal, and you changed another file in the editor
and saved it.
