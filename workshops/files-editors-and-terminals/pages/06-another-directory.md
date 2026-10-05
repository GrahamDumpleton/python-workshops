---
title: Moving to another directory
requires: [quiz:pwd-in-trip, quiz:ls-in-trip, quiz:pwd-back]
---

# Moving to another directory

In the file browser, you looked inside the directory `recipes` with a
double-click. In the terminal, you move with a command. The command
`cd` makes another directory the current directory. The two letters
are short for "change directory".

After `cd`, you write a space and the name of the directory. The
directory must be inside the current directory.

On this page, the help with the commands becomes less, in three steps.
First a click runs the command. Then the page types the command and
you press `Enter`. Last, you type the command yourself.

## Step 1: a click runs the command

The directory `trip` is inside the directory `work`. This command
moves the terminal into it:

```{execute}
:id: run-cd-trip
:title: Run the command in the terminal
:wait: prompt
cd trip
```

The command `cd` shows nothing when it works. That is usual in a
terminal: many commands show text only when there is something to
say.

But look at the new prompt. It is longer than before, and it holds the
name `trip`. The prompt of this terminal shows a short form of the
current directory, so that you can always see where the terminal is.

## Step 2: the page types, you press Enter

Now look where the terminal is, with `pwd`. Click the action
below. It types the command in the terminal, but it does not press
`Enter`.

```{terminal-type}
:id: type-pwd
:title: Type the command in the terminal
pwd
```

The command is in the terminal now, after the prompt. Nothing has run
yet. The shell runs a command only when you press `Enter`.

Click one time inside the terminal, and then press `Enter`.

````{hint}
:title: Nothing happens when I press Enter
The keys go to the part of the window that you clicked last. Click
one time inside the terminal. Then press `Enter`.
````

````{hint}
:title: Press Enter for me
:unlock: "pwd-in-trip" in failed_checks
:locked: Answer the question below first

```{send-key}
:id: enter-pwd
:keys: enter
```
````

```{quiz}
:id: pwd-in-trip
:title: The current directory now
:type: text
:case: false
question: "Look at the line that `pwd` shows now. What is the last name in the path, after the last `/`?"
answer: "trip"
wrong:
  - { text: "work", explanation: "The name `work` is in the path, but it is not the last name now. Look at the end of the newest line that `pwd` showed. If that line ends with `work`, click the action of step 1 again, and then run `pwd` again." }
  - { pattern: ".*/.*", explanation: "That is more than the last name. Type only the name after the last `/`." }
otherwise: "Look at the newest line that begins with `/` in the terminal. Type only the letters after the last `/`."
explanation: "The path is the same as before, with `/trip` added at the end. The directory `trip` is inside the directory `work`, and the terminal is in `trip` now."
```

Now look at what the directory `trip` holds. Click the action to type
the command `ls`, and then press `Enter` in the terminal yourself.

```{terminal-type}
:id: type-ls
:title: Type the command in the terminal
ls
```

````{hint}
:title: Press Enter for me
:unlock: "ls-in-trip" in failed_checks
:locked: Answer the question below first

```{send-key}
:id: enter-ls
:keys: enter
```
````

```{quiz}
:id: ls-in-trip
:title: What the directory trip holds
:type: text
:case: false
question: "The command `ls` shows two names now. Type the two names, with a space between them."
answer:
  - { pattern: "route\\.txt\\s+ticket\\.txt", example: "route.txt ticket.txt" }
  - { pattern: "ticket\\.txt\\s+route\\.txt", example: "ticket.txt route.txt" }
wrong:
  - { pattern: "(route|ticket)\\.txt", explanation: "That is one of the two names. Type both names, with a space between them." }
  - { pattern: ".*(packing|recipes|count_up).*", explanation: "Those are names of the directory `work`. The terminal is not in the directory `trip`. Click the action of step 1 again, and then run `ls` again." }
otherwise: "Look at the line under the newest `ls` in the terminal. Type the two names exactly as the terminal shows them, with the dots."
explanation: "The same command, `ls`, showed four other names on the page before this one. A command works on the current directory, so the same command gives another result in another directory."
```

The file browser on the left did not change. It still shows the
directory `work`. The file browser and the terminal each have a
current directory of their own, and one does not follow the other.

## Step 3: you type the command

Now return to the directory `work`. You cannot write `cd work`,
because `work` is not inside `trip`. For this, every directory has a
special name: two dots, `..`. The name `..` means the directory that
holds the current directory. So this command moves the terminal one
step back:

```
cd ..
```

Click one time inside the terminal. Type `cd`, a space, and two dots.
Then press `Enter`.

If you make a mistake while you type, press the `Backspace` key to
remove the last character. The shell reads the line only when you
press `Enter`.

Then type `pwd` and press `Enter`, to see where the terminal is.

````{hint}
:title: The terminal says that the command is not found
The shell did not know the first word of the line. Nothing has
happened, and nothing is damaged. Most often a letter is wrong, or the
space after `cd` is missing: `cd..` is not the same as `cd ..`. Type
the command again on the new prompt.
````

````{hint}
:title: The path that pwd shows does not hold the name work
The terminal is in a directory outside this workshop. Type `cd -` and
press `Enter`. The command `cd -`, with a minus sign, returns the
terminal to the directory that it was in before the last `cd`. Then
run `pwd` again.
````

````{hint}
:title: Type the two commands for me
:unlock: "pwd-back" in failed_checks
:locked: Answer the question below first

```{execute}
:id: run-cd-back
:wait: prompt
cd ..
```

```{execute}
:id: run-pwd-back
:wait: prompt
pwd
```
````

```{quiz}
:id: pwd-back
:title: Back where you started
:type: text
:case: false
question: "Look at the newest line that `pwd` showed. What is the last name in the path now?"
answer: "work"
wrong:
  - { text: "trip", explanation: "The terminal is still in the directory `trip`. Type `cd ..` with a space between `cd` and the two dots, and press `Enter`. Then run `pwd` again." }
  - { pattern: ".*/.*", explanation: "That is more than the last name. Type only the name after the last `/`." }
otherwise: "The path must end with `work`. If the terminal is still in the directory `trip`, type `cd ..` and press `Enter`, and then run `pwd` again."
explanation: "The command `cd ..` moved the terminal from `trip` to the directory that holds it, which is `work`. The prompt is short again. The other pages of this workshop need the terminal in the directory `work`."
```
