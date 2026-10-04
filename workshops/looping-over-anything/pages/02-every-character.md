---
title: Every character of a string
requires: [verify:drink-ran, verify:letter-count]
---

# Every character of a string

A **loop** is a piece of code that tells Python to run the same lines
many times. The `for` loop that you know works through a list: it runs
its **block**, the lines under it that begin with four spaces, one
time for each item of the list. Each run of the block is called a
**pass**.

A `for` loop also works through a **string**. A string is a piece of
text, written between quotes, and it is a row of **characters**. A
character is one letter, one digit, one space or one symbol. A `for`
loop over a string makes one pass for each character.

Programs often need this. A program counts how many times a letter
appears in a word. A program checks that every character of a
telephone number is a digit.

Think of how you spell your name to a person on the telephone. You
say one letter, then the next letter, and you continue to the last
letter. A `for` loop goes through a string in the same way.

Click the action below. It adds a cell with a `for` loop over a
string, and runs it.

```{attempt}
:id: drink-not-run
:check: drink-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-drink
:title: Add a cell that prints every character of a string, and run it
:path: {{ notebook }}
:tags: [drink]
:run: true
drink = "tea"
for letter in drink:
    print(letter)
```

The output has three lines, one for each character:

```
t
e
a
```

```{verify}
:id: drink-ran
:label: The loop printed every character of the string
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed drink
if globals().get("drink") == "tea" and "letter" in globals():
    print("The cell ran. The loop printed one line for each of the three characters.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("drink") == "tea" and "letter" in globals()
```

## What happened

1. `drink = "tea"` makes the name `drink` refer to a string of three
   characters.

2. `for letter in drink:` starts the loop. The name `letter`, between
   the words `for` and `in`, is the **loop name**. You choose the loop
   name yourself. Before each pass, Python makes the loop name refer
   to the next character.

3. `print(letter)` begins with four spaces, so it is the block of the
   loop. Python runs it one time for each character.

| Pass | `letter` |
|------|----------|
| 1 | `"t"` |
| 2 | `"e"` |
| 3 | `"a"` |

After the last character, the string has no more characters, so the
loop ends.

In each pass, the loop name refers to a string that holds one
character. So you can compare it with another string, for example
with `letter == "a"`.

## Your task

Write a program that counts how many times the letter `a` appears in
the word `banana`.

You know how to count with a loop. A name is given the start value
`0` before the loop. Inside the loop, an `if` tests each item, and a
line under the `if` adds `1` to the count.

Your program must do these four things, in this order:

1. Give the name `fruit` to the string `"banana"`.

2. Give the name `a_count` the start value `0`.

3. Use a `for` loop over `fruit`. In each pass, if the character is
   equal to `"a"`, add `1` to `a_count`. You can choose the loop name.
   A good loop name is `character`.

4. After the loop, show the value of `a_count` with `print()`.

When the program is correct, the output under the cell is:

```
3
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-fruit
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [fruit]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program. The
`if` line is in the block of the loop, so it begins with four spaces.
The line under the `if` begins with eight spaces. To write a line
after the loop, remove the spaces at the beginning of the line. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
The first two lines are assignments: `fruit = "banana"` and
`a_count = 0`. The loop line is `for character in fruit:`.
```

```{hint}
:title: Hint: the block of the loop
The block has two lines. The first line begins with four spaces and
tests the character: `if character == "a":`. The second line begins
with eight spaces and adds to the count: `a_count = a_count + 1`.
```

```{hint}
:title: Hint: my cell shows [*] and does not finish
While a cell runs, the square brackets at its left side show a star:
`[*]`. The loop of this task finishes in less than a second. If the
star stays for longer than a few seconds, the cell probably holds a
loop that never ends. Python cannot run any other cell while it
waits.

To stop the loop, you restart the **kernel**. The kernel is the Python
interpreter that runs the cells of your notebook. First correct the
loop in the cell. Then open the `Kernel` menu at the top of the
window, choose `Restart Kernel and Run All Cells…`, and click
`Restart` in the box that appears. Python starts again, forgets every
name, and runs the cells of the notebook again from the top. If Python
stops at a cell that shows an error message, correct that cell, and
choose the same menu item again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: fruit-not-started
:check: letter-count
:expect: The name fruit does not exist yet
```

````{attempt}
:id: fruit-wrong-word
:check: letter-count
:expect: The name fruit refers to 'bananas'

```{cell-insert}
:path: {{ notebook }}
:run: true
fruit = "bananas"
```
````

````{attempt}
:id: fruit-word-only
:check: letter-count
:expect: The name a_count does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
fruit = "banana"
```
````

````{attempt}
:id: fruit-nothing-counted
:check: letter-count
:expect: The name a_count still refers to 0

```{cell-insert}
:path: {{ notebook }}
:run: true
fruit = "banana"
a_count = 0
for character in fruit:
    if character == "A":
        a_count = a_count + 1
print(a_count)
```
````

````{attempt}
:id: fruit-every-character
:check: letter-count
:expect: That is the number of all the characters

```{cell-insert}
:path: {{ notebook }}
:run: true
fruit = "banana"
a_count = 0
for character in fruit:
    if character == "a":
        print(character)
    a_count = a_count + 1
print(a_count)
```
````

````{attempt}
:id: fruit-zero-inside
:check: letter-count
:expect: That happens when the line a_count = 0 is inside the loop

```{cell-insert}
:path: {{ notebook }}
:run: true
fruit = "banana"
for character in fruit:
    a_count = 0
    if character == "a":
        a_count = a_count + 1
print(a_count)
```
````

````{attempt}
:id: fruit-other-letter
:check: letter-count
:expect: but it must refer to 3

```{cell-insert}
:path: {{ notebook }}
:run: true
fruit = "banana"
a_count = 0
for character in fruit:
    if character == "n":
        a_count = a_count + 1
print(a_count)
```
````

````{attempt}
:id: fruit-other-loop-name
:check: letter-count
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
fruit = "banana"
a_count = 0
for symbol in fruit:
    if "a" == symbol:
        a_count = 1 + a_count
print(a_count)
```
````

````{hint}
:title: Show me a solution
:unlock: "letter-count" in failed_checks or "letter-count" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-fruit-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [fruit-solution]
:run: true
fruit = "banana"
a_count = 0
for character in fruit:
    if character == "a":
        a_count = a_count + 1
print(a_count)
```
````

```{verify}
:id: letter-count
:label: Your loop counts the letter a in the word
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed fruit; cell-executed fruit-solution
if "fruit" not in globals():
    print("The name fruit does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the string: fruit = \"banana\". Then hold Shift and press Enter to run the cell.")
elif fruit != "banana":
    print(f"The name fruit refers to {fruit!r} but it must refer to the string 'banana'. Correct the first line of your program. Then run the cell again.")
elif "a_count" not in globals():
    print("The name a_count does not exist yet. Add a line before the loop that gives it the start value: a_count = 0. Check the spelling. Then run the cell again.")
elif a_count == 3:
    print("Correct. Your loop tested every character of the string, and the name a_count refers to 3.")
elif a_count == 0:
    print("The name a_count still refers to 0, so the loop does not count anything. Inside the loop, test each character with an if line that begins with four spaces: if character == \"a\". Write the letter a in lower case, between quotes. Under the if, write a line with eight spaces that adds 1: a_count = a_count + 1. Then run the cell again.")
elif a_count == 6:
    print("The name a_count refers to 6. That is the number of all the characters, so the line that adds 1 runs in every pass. It must be inside the block of the if: give it eight spaces, so that it runs only when the character is equal to \"a\". Then run the cell again.")
elif a_count == 1:
    print("The name a_count refers to 1. That happens when the line a_count = 0 is inside the loop, so that every pass starts the count again. It also happens when the if is after the loop, so that it tests only the last character. The line a_count = 0 must be before the loop, and the if must be inside the loop, with four spaces. Then run the cell again.")
else:
    print(f"The name a_count refers to {a_count!r} but it must refer to 3. Check that a_count = 0 is before the loop, that the comparison in the if line is character == \"a\", and that the line under the if adds 1: a_count = a_count + 1. Then run the cell again.")
"fruit" in globals() and "a_count" in globals() and fruit == "banana" and a_count == 3
```
