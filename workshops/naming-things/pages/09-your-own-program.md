---
title: A small program of your own
requires: [verify:rice-program]
---

# A small program of your own

On this page you write a small program yourself, from nothing. It
uses everything from this workshop: names, an assignment with a
calculation, and `print()`.

## The problem

Amara cooks rice for a dinner.

- One person eats 75 grams of rice.

- 8 people come to the dinner.

Write a program that calculates how many grams of rice Amara needs,
and shows the result.

## What the program must do

Your program must have these four lines, in this order:

1. Give the name `grams_per_person` to the value `75`.

2. Give the name `people` to the value `8`.

3. Calculate the total from the two names, and give the result the
   name `total_grams`. Use the names in the calculation, not the
   numbers.

4. Show the value of `total_grams` with `print()`.

When the program is correct, the output under the cell is:

```
600
```

## Where to write it

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-rice
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [rice]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type the first line of
your program. Press `Enter` at the end of each line to start the next
line. When you have written all four lines, run the cell: hold `Shift`
and press `Enter`.

If you see an error message, or the output is not what you expected,
change the program and run the cell again. You can try as many times
as you like.

## If you need help

```{hint}
:title: Hint: how to begin
The first two lines are assignments, like `ticket_price = 12`. Each
has the name on the left, then the symbol `=`, then the number on the
right.
```

```{hint}
:title: Hint: the calculation
The total is the grams for one person multiplied by the number of
people. The third line is an assignment that has that expression on
its right side: `total_grams = grams_per_person * people`. The fourth
line is `print(total_grams)`.
```

```{hint}
:title: Hint: I see a NameError
A `NameError` means that a line uses a name that no line has created.
Read the last line of the error message to see which name Python
could not find. Check that the name is spelled in the same way in
every line, with small letters and underscores.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.
Compare the solution with your own cell, and find what is different.

```{attempt}
:id: rice-not-started
:check: rice-program
:expect: The name grams_per_person does not exist yet
```

````{attempt}
:id: rice-one-name
:check: rice-program
:expect: The name people does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
grams_per_person = 75
```
````

````{attempt}
:id: rice-no-total
:check: rice-program
:expect: The name total_grams does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
grams_per_person = 75
people = 8
print(grams_per_person * people)
```
````

````{attempt}
:id: rice-added
:check: rice-program
:expect: That happens when the two values are added

```{cell-insert}
:path: {{ notebook }}
:run: true
grams_per_person = 75
people = 8
total_grams = grams_per_person + people
print(total_grams)
```
````

````{attempt}
:id: rice-wrong-people
:check: rice-program
:expect: The name people refers to 10

```{cell-insert}
:path: {{ notebook }}
:run: true
grams_per_person = 75
people = 10
total_grams = grams_per_person * people
print(total_grams)
```
````

````{attempt}
:id: rice-other-order
:check: rice-program
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
people = 8
grams_per_person = 75
total_grams = people * grams_per_person
print(total_grams)
```
````

````{hint}
:title: Show me a solution
:unlock: "rice-program" in failed_checks or "rice-program" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-rice-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [rice-solution]
:run: true
grams_per_person = 75
people = 8
total_grams = grams_per_person * people
print(total_grams)
```
````

```{verify}
:id: rice-program
:label: Your program calculates the rice for the dinner
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed rice; cell-executed rice-solution
if "grams_per_person" not in globals():
    print("The name grams_per_person does not exist yet. Write your program under the comment in the new cell, and begin with the line that gives this name the value 75. Check the spelling. Then hold Shift and press Enter to run the cell.")
elif "people" not in globals():
    print("The name people does not exist yet. Add a line that gives the name people the value 8. Then run the cell again.")
elif "total_grams" not in globals():
    print("The name total_grams does not exist yet. Add a line that calculates the total from the two names, and gives the result the name total_grams. Check the spelling. Then run the cell again.")
elif grams_per_person != 75:
    print(f"The name grams_per_person refers to {grams_per_person} but one person eats 75 grams. Change the value in the first line to 75. Then run the cell again.")
elif people != 8:
    print(f"The name people refers to {people} but 8 people come to the dinner. Change the value in the second line to 8. Then run the cell again.")
elif total_grams == 600:
    print("Correct. Amara needs 600 grams of rice. Your cell also shows 600 under it if your last line is print(total_grams).")
elif total_grams == 83:
    print("The name total_grams refers to 83. That happens when the two values are added. Multiply them: total_grams = grams_per_person * people. Then run the cell again.")
else:
    print(f"The name total_grams refers to {total_grams} but it must refer to 600. Calculate it from the two names: total_grams = grams_per_person * people. Then run the cell again.")
all(name in globals() for name in ("grams_per_person", "people", "total_grams")) and grams_per_person == 75 and people == 8 and total_grams == 600
```
