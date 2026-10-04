---
title: Any expression can make the new item
requires: [verify:shouted-ran, quiz:predict-sizes, verify:sizes-ran, verify:welcomes-list]
---

# Any expression can make the new item

The first part of a list comprehension is an expression, and it says
what each new item is. Until now that expression was a calculation
with a number, such as `fare * 2`. It can be any expression that uses
the loop name: a method of a string, a function such as `len()`, or
an f-string.

This matters because lists hold more than numbers. A list of names
can become a list of greetings, and a list of words can become a list
of their lengths.

A **string** is a value that holds text, and a **method** is a
function that belongs to a value. You write a dot and the name of the
method after the value. For example, the method `.upper()` of a
string gives a new string with every letter as a capital letter.

Here is a loop that builds a list of names in capital letters:

```python
guests = ["aiko", "omar", "chidi"]
shouted = []
for guest in guests:
    shouted.append(guest.upper())
print(shouted)
```

Click the action below. It adds a cell that does the same work with a
list comprehension, and runs it.

```{attempt}
:id: shouted-not-run
:check: shouted-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-shouted
:title: Add a cell that builds a list of names in capital letters, and run it
:path: {{ notebook }}
:tags: [shouted]
:run: true
guests = ["aiko", "omar", "chidi"]
shouted = [guest.upper() for guest in guests]
print(shouted)
```

The output is:

```
['AIKO', 'OMAR', 'CHIDI']
```

```{verify}
:id: shouted-ran
:label: The list comprehension built the list of names in capital letters
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed shouted
if globals().get("shouted") == ["AIKO", "OMAR", "CHIDI"]:
    print("The cell ran. The name shouted refers to the new list of three names in capital letters.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("shouted") == ["AIKO", "OMAR", "CHIDI"]
```

## What happened

The expression is `guest.upper()`. In each pass, the loop name `guest`
refers to one name, and `guest.upper()` gives that name in capital
letters. That string is the new item.

Python shows the strings of a list with single quotes. The quotes are
not part of the text.

## Predict the result

The function `len()` gives the number of characters in a string. For
example, `len("tea")` is `3`. Look at this cell. Do not run it yet.

```python
fruits = ["fig", "banana", "kiwi"]
sizes = [len(fruit) for fruit in fruits]
print(sizes)
```

```{quiz}
:id: predict-sizes
:type: text
:title: Predict the list
question: What does the notebook show under this cell when it runs?
answer:
  - { pattern: '\[\s*3\s*,\s*6\s*,\s*4\s*\]', example: "[3, 6, 4]" }
wrong:
  - { text: "3", explanation: "`3` is the number of items in the list `fruits`. But `len()` is inside the list comprehension, so Python calculates `len(fruit)` for each item, one after another." }
  - { text: "13", explanation: "`13` is the number of letters in all three words together. The list comprehension makes one new item for each word, so the result is a list with three items." }
  - { pattern: '\[\s*3\s*\]', explanation: "The new list has one item for each item of `fruits`, so it has three items." }
  - { pattern: '3\s*,?\s*6\s*,?\s*4', explanation: "The three numbers are correct. Python shows a list with square brackets around the items, so type the brackets too." }
otherwise: "Read it from the middle: for each `fruit` in `fruits`, give me `len(fruit)`. Count the letters of each word."
explanation: "The expression `len(fruit)` gives the number of letters in one word. The words have 3, 6 and 4 letters, so the new list is `[3, 6, 4]`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: sizes-not-run
:check: sizes-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-sizes
:title: Add the cell that builds a list of the lengths of the words, and run it
:path: {{ notebook }}
:tags: [sizes]
:run: true
fruits = ["fig", "banana", "kiwi"]
sizes = [len(fruit) for fruit in fruits]
print(sizes)
```

```{verify}
:id: sizes-ran
:label: The list comprehension built the list of lengths
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed sizes
if globals().get("sizes") == [3, 6, 4]:
    print("The cell ran. The name sizes refers to the new list [3, 6, 4].")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("sizes") == [3, 6, 4]
```

## Your task

Three people arrive for a bicycle tour: Mei, Tariq and Ngozi. Write a
program that builds a list with a welcome message for each person.

An **f-string** is a string with the letter `f` before its first
quote. Python replaces each name in curly brackets with its value. For
example, when `rider` refers to `"Mei"`, the f-string
`f"Welcome, {rider}!"` gives the string `"Welcome, Mei!"`.

Your program must do these three things, in this order:

1. Give the name `riders` to the list `["Mei", "Tariq", "Ngozi"]`.

2. Give the name `welcomes` to a list comprehension. Each new item is
   the word `Welcome`, a comma, a space, the name of the rider, and an
   exclamation mark. For the rider `"Mei"`, the new item is
   `"Welcome, Mei!"`.

3. Show the value of `welcomes` with `print()`.

When the program is correct, the output under the cell is:

```
['Welcome, Mei!', 'Welcome, Tariq!', 'Welcome, Ngozi!']
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-welcomes
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [welcomes]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Look at the cell with the guests. Your program has the same three
lines: the list, the list comprehension, and the `print()` line. Only
the names and the expression are different.
```

```{hint}
:title: Hint: the expression
The expression is the f-string `f"Welcome, {rider}!"`. Put it first
inside the square brackets, and write `for rider in riders` after it.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: welcomes-not-started
:check: welcomes-list
:expect: The name riders does not exist yet
```

````{attempt}
:id: welcomes-wrong-riders
:check: welcomes-list
:expect: The name riders refers to ['Mei', 'Tariq']

```{cell-insert}
:path: {{ notebook }}
:run: true
riders = ["Mei", "Tariq"]
```
````

````{attempt}
:id: welcomes-riders-only
:check: welcomes-list
:expect: The name welcomes does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
riders = ["Mei", "Tariq", "Ngozi"]
```
````

````{attempt}
:id: welcomes-not-a-list
:check: welcomes-list
:expect: is not a list

```{cell-insert}
:path: {{ notebook }}
:run: true
riders = ["Mei", "Tariq", "Ngozi"]
welcomes = "Welcome, Mei!"
print(welcomes)
```
````

````{attempt}
:id: welcomes-no-f
:check: welcomes-list
:expect: Python did not replace the name in the curly brackets

```{cell-insert}
:path: {{ notebook }}
:run: true
riders = ["Mei", "Tariq", "Ngozi"]
welcomes = ["Welcome, {rider}!" for rider in riders]
print(welcomes)
```
````

````{attempt}
:id: welcomes-no-expression
:check: welcomes-list
:expect: the same items as the list riders

```{cell-insert}
:path: {{ notebook }}
:run: true
riders = ["Mei", "Tariq", "Ngozi"]
welcomes = [rider for rider in riders]
print(welcomes)
```
````

````{attempt}
:id: welcomes-wrong-text
:check: welcomes-list
:expect: The first item of welcomes is 'Welcome Mei'

```{cell-insert}
:path: {{ notebook }}
:run: true
riders = ["Mei", "Tariq", "Ngozi"]
welcomes = [f"Welcome {rider}" for rider in riders]
print(welcomes)
```
````

````{attempt}
:id: welcomes-one-item
:check: welcomes-list
:expect: The number of items in the list welcomes is 1

```{cell-insert}
:path: {{ notebook }}
:run: true
riders = ["Mei", "Tariq", "Ngozi"]
welcomes = [f"Welcome, {riders[0]}!"]
print(welcomes)
```
````

````{attempt}
:id: welcomes-typed-by-hand
:check: welcomes-list
:expect: The first item of welcomes is correct, but the list is

```{cell-insert}
:path: {{ notebook }}
:run: true
riders = ["Mei", "Tariq", "Ngozi"]
welcomes = ["Welcome, Mei!", "Welcome, Tariq!", "Welcome, Ngozi"]
print(welcomes)
```
````

````{attempt}
:id: welcomes-with-plus
:check: welcomes-list
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
riders = ["Mei", "Tariq", "Ngozi"]
welcomes = ["Welcome, " + person + "!" for person in riders]
print(welcomes)
```
````

````{hint}
:title: Show me a solution
:unlock: "welcomes-list" in failed_checks or "welcomes-list" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-welcomes-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [welcomes-solution]
:run: true
riders = ["Mei", "Tariq", "Ngozi"]
welcomes = [f"Welcome, {rider}!" for rider in riders]
print(welcomes)
```
````

```{verify}
:id: welcomes-list
:label: Your list comprehension builds the welcome messages
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed welcomes; cell-executed welcomes-solution
if "riders" not in globals():
    print('The name riders does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the list: riders = ["Mei", "Tariq", "Ngozi"]. Then hold Shift and press Enter to run the cell.')
elif riders != ["Mei", "Tariq", "Ngozi"]:
    print(f'The name riders refers to {riders!r} but it must refer to the list ["Mei", "Tariq", "Ngozi"]. Correct the first line of your program. Then run the cell again.')
elif "welcomes" not in globals():
    print("The name welcomes does not exist yet. Add a line that gives the name welcomes to a list comprehension. Check the spelling. Then run the cell again.")
elif type(welcomes) is not list:
    print(f"The name welcomes refers to {welcomes!r}, which is not a list. A list comprehension has square brackets around it, and the words for and in inside the brackets. Then run the cell again.")
elif welcomes == ["Welcome, Mei!", "Welcome, Tariq!", "Welcome, Ngozi!"]:
    print("Correct. The name welcomes refers to a list of three welcome messages, one for each rider.")
elif welcomes == riders:
    print("The name welcomes refers to a list that has the same items as the list riders. The expression at the start of the list comprehension says what each new item is. Write an f-string there that puts the name of the rider into the message. Then run the cell again.")
elif len(welcomes) != 3:
    print(f"The number of items in the list welcomes is {len(welcomes)}, but it must be 3, one for each rider. After the expression, write for rider in riders, so that Python calculates the expression for each item. Then run the cell again.")
elif type(welcomes[0]) is str and "{" in welcomes[0]:
    print(f"The first item of welcomes is {welcomes[0]!r}. Python did not replace the name in the curly brackets, because the string is not an f-string. Write the letter f before the first quote of the string. Then run the cell again.")
elif welcomes[0] != "Welcome, Mei!":
    print(f"The first item of welcomes is {welcomes[0]!r} but it must be 'Welcome, Mei!'. Compare each character: the capital letter, the comma, the space and the exclamation mark. Correct the expression. Then run the cell again.")
else:
    print(f"The first item of welcomes is correct, but the list is {welcomes!r}. Every item must have the same form as the first item. Let the list comprehension build every item: write the f-string one time, and then for rider in riders. Then run the cell again.")
"riders" in globals() and "welcomes" in globals() and riders == ["Mei", "Tariq", "Ngozi"] and welcomes == ["Welcome, Mei!", "Welcome, Tariq!", "Welcome, Ngozi!"]
```
