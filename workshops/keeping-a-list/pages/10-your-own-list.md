---
title: A small program of your own
requires: [verify:readings-program]
---

# A small program of your own

On this page you write a small program yourself, from nothing. It
uses most of this workshop: a list, `append()`, `sorted()`, a slice
and `len()`.

## The problem

Farid records the temperature at midday, in degrees Celsius, once a
day.

- On the first four days the temperatures were 31, 27, 35 and 29.

- On the fifth day the temperature was 25.

Farid wants to know the three lowest temperatures, and the number of
days that he has measured. He also wants to keep the list in the
order of the days.

## What the program must do

Your program must do these six things, in this order:

1. Create a list named `readings` that holds the first four
   temperatures, in the order of the days: `31`, `27`, `35`, `29`.

2. Add the temperature of the fifth day, `25`, at the end of the list
   `readings`, with `append()`.

3. Make a new list that holds the same items in order from the lowest
   to the highest, and give it the name `coolest_first`. The list
   `readings` must stay in the order of the days.

4. Take the first three items of `coolest_first` with a slice, and
   give the result the name `coolest_three`.

5. Count the items of `readings`, and give the result the name
   `day_count`.

6. Show `coolest_three` with `print()`, and then show `day_count`
   with `print()`.

When the program is correct, the output under the cell is:

```
[25, 27, 29]
5
```

## Where to write it

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-readings
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [readings]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type the first line of
your program. Press `Enter` at the end of each line to start the next
line. When you have written the whole program, run the cell: hold
`Shift` and press `Enter`.

If you see an error message, or the output is not what you expected,
change the program and run the cell again. You can try as many times
as you like.

## If you need help

```{hint}
:title: Hint: the list and the fifth day
The first line is an assignment with a list on the right side, like
`scores = [12, 7, 15, 9]`. The second line uses the method `append()`
on the list, like `basket.append("tea")`. Do not write `readings =`
at the start of the second line.
```

```{hint}
:title: Hint: the sorted list, the slice and the count
The function `sorted()` gives back a new list:
`coolest_first = sorted(readings)`. The first three items of a list
are the slice from the index 0 to the index 3:
`coolest_three = coolest_first[0:3]`. The function `len()` counts the
items: `day_count = len(readings)`.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the message. A `NameError` means that a line
uses a name that no line has created, so check the spelling of each
name. A `SyntaxError` often means that a bracket, a comma or a quote
is missing. An `AttributeError` that mentions `NoneType` means that a
name refers to `None`: look for a line that begins with a name and
`=`, and has `.append(` or `.sort(` on its right side.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.
Compare the solution with your own cell, and find what is different.

```{attempt}
:id: readings-not-started
:check: readings-program
:expect: The name readings does not exist yet
```

````{attempt}
:id: readings-not-a-list
:check: readings-program
:expect: The name readings does not refer to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
readings = 31
```
````

````{attempt}
:id: readings-assigned-append
:check: readings-program
:expect: The name readings refers to None

```{cell-insert}
:path: {{ notebook }}
:run: true
readings = [31, 27, 35, 29]
readings = readings.append(25)
```
````

````{attempt}
:id: readings-no-append
:check: readings-program
:expect: The list readings has only the first four temperatures

```{cell-insert}
:path: {{ notebook }}
:run: true
readings = [31, 27, 35, 29]
```
````

````{attempt}
:id: readings-wrong-items
:check: readings-program
:expect: but it must be [31, 27, 35, 29, 25]

```{cell-insert}
:path: {{ notebook }}
:run: true
readings = [31, 27, 35]
readings.append(25)
```
````

````{attempt}
:id: readings-sorted-in-place
:check: readings-program
:expect: That happens when the program uses readings.sort()

```{cell-insert}
:path: {{ notebook }}
:run: true
readings = [31, 27, 35, 29]
readings.append(25)
readings.sort()
```
````

````{attempt}
:id: readings-no-sorted-list
:check: readings-program
:expect: The name coolest_first does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
readings = [31, 27, 35, 29]
readings.append(25)
print(sorted(readings))
```
````

````{attempt}
:id: readings-not-sorted
:check: readings-program
:expect: has the same order as the list readings

```{cell-insert}
:path: {{ notebook }}
:run: true
readings = [31, 27, 35, 29]
readings.append(25)
coolest_first = readings[0:5]
```
````

````{attempt}
:id: readings-sorted-is-none
:check: readings-program
:expect: The name coolest_first refers to None

```{cell-insert}
:path: {{ notebook }}
:run: true
readings = [31, 27, 35, 29]
readings.append(25)
coolest_first = print(sorted(readings))
```
````

````{attempt}
:id: readings-no-slice
:check: readings-program
:expect: The name coolest_three does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
readings = [31, 27, 35, 29]
readings.append(25)
coolest_first = sorted(readings)
```
````

````{attempt}
:id: readings-sliced-wrong-list
:check: readings-program
:expect: Those are the first three items of the list readings

```{cell-insert}
:path: {{ notebook }}
:run: true
readings = [31, 27, 35, 29]
readings.append(25)
coolest_first = sorted(readings)
coolest_three = readings[0:3]
```
````

````{attempt}
:id: readings-slice-from-one
:check: readings-program
:expect: but it must be [25, 27, 29]

```{cell-insert}
:path: {{ notebook }}
:run: true
readings = [31, 27, 35, 29]
readings.append(25)
coolest_first = sorted(readings)
coolest_three = coolest_first[1:3]
```
````

````{attempt}
:id: readings-no-count
:check: readings-program
:expect: The name day_count does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
readings = [31, 27, 35, 29]
readings.append(25)
coolest_first = sorted(readings)
coolest_three = coolest_first[0:3]
print(coolest_three)
```
````

````{attempt}
:id: readings-count-too-early
:check: readings-program
:expect: The name day_count refers to 4

```{cell-insert}
:path: {{ notebook }}
:run: true
readings = [31, 27, 35, 29]
day_count = len(readings)
readings.append(25)
coolest_first = sorted(readings)
coolest_three = coolest_first[0:3]
print(coolest_three)
print(day_count)
```
````

````{attempt}
:id: readings-count-of-slice
:check: readings-program
:expect: but it must refer to 5

```{cell-insert}
:path: {{ notebook }}
:run: true
readings = [31, 27, 35, 29]
readings.append(25)
coolest_first = sorted(readings)
coolest_three = coolest_first[0:3]
day_count = len(coolest_three)
print(coolest_three)
print(day_count)
```
````

````{attempt}
:id: readings-other-way
:check: readings-program
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
readings = [31, 27, 35, 29]
readings.append(25)
day_count = len(readings)
coolest_first = sorted(readings)
coolest_three = coolest_first[:3]
print(coolest_three)
print(day_count)
```
````

````{hint}
:title: Show me a solution
:unlock: "readings-program" in failed_checks or "readings-program" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-readings-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [readings-solution]
:run: true
readings = [31, 27, 35, 29]
readings.append(25)
coolest_first = sorted(readings)
coolest_three = coolest_first[0:3]
day_count = len(readings)
print(coolest_three)
print(day_count)
```
````

```{verify}
:id: readings-program
:label: Your program finds the three lowest temperatures
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed readings; cell-executed readings-solution
if "readings" not in globals():
    print("The name readings does not exist yet. Write your program under the comment in the new cell, and begin with the line that creates the list readings. Check the spelling. Then hold Shift and press Enter to run the cell.")
elif readings is None:
    print("The name readings refers to None, and no longer refers to a list. That happens when a line is readings = readings.append(25). The method append() changes the list and gives back None. Write only readings.append(25), with no readings = before it. Then run the cell again.")
elif not isinstance(readings, list):
    print("The name readings does not refer to a list. Write the four temperatures between square brackets, with commas between them: readings = [31, 27, 35, 29]. Then run the cell again.")
elif readings == [31, 27, 35, 29]:
    print("The list readings has only the first four temperatures. Add the temperature of the fifth day at the end: readings.append(25). Then run the cell again.")
elif readings == [25, 27, 29, 31, 35]:
    print("The list readings is now in order from the lowest to the highest, but it must stay in the order of the days. That happens when the program uses readings.sort(), which changes the list. Use sorted() in its place, which makes a new list: coolest_first = sorted(readings). Then run the cell again.")
elif readings != [31, 27, 35, 29, 25]:
    print(f"The list readings is {readings} but it must be [31, 27, 35, 29, 25]. The first line must create the list with 31, 27, 35 and 29, and the second line must add 25 with append(). Then run the cell again.")
elif "coolest_first" not in globals():
    print("The name coolest_first does not exist yet. Add a line that makes a sorted list from readings and gives it this name: coolest_first = sorted(readings). Check the spelling. Then run the cell again.")
elif coolest_first is None:
    print("The name coolest_first refers to None, not to a list. Use the function sorted(), which gives back a new list: coolest_first = sorted(readings). Then run the cell again.")
elif coolest_first == [31, 27, 35, 29, 25]:
    print("The list coolest_first has the same order as the list readings, so it is not in order from the lowest to the highest. Use the function sorted(): coolest_first = sorted(readings). Then run the cell again.")
elif coolest_first != [25, 27, 29, 31, 35]:
    print(f"The name coolest_first refers to {coolest_first} but it must refer to [25, 27, 29, 31, 35]. Make it from the whole list: coolest_first = sorted(readings). Then run the cell again.")
elif "coolest_three" not in globals():
    print("The name coolest_three does not exist yet. Add a line that takes the first three items of coolest_first with a slice, and gives the result this name. Check the spelling. Then run the cell again.")
elif coolest_three == [31, 27, 35]:
    print("The name coolest_three refers to [31, 27, 35]. Those are the first three items of the list readings, which is in the order of the days. Take the slice from the sorted list: coolest_three = coolest_first[0:3]. Then run the cell again.")
elif coolest_three != [25, 27, 29]:
    print(f"The name coolest_three refers to {coolest_three} but it must be [25, 27, 29]. The first three items are the slice that starts at the index 0 and stops at the index 3: coolest_three = coolest_first[0:3]. Then run the cell again.")
elif "day_count" not in globals():
    print("The name day_count does not exist yet. Add a line that counts the items of readings with len(), and gives the result this name. Check the spelling. Then run the cell again.")
elif day_count == 4:
    print("The name day_count refers to 4, but the list readings has 5 items. That happens when the program counts the items before it adds the fifth day. Put the line day_count = len(readings) after the line with append(). Then run the cell again.")
elif day_count != 5:
    print(f"The name day_count refers to {day_count} but it must refer to 5. Count the items of the whole list: day_count = len(readings). Then run the cell again.")
else:
    print("Correct. The three lowest temperatures are 25, 27 and 29, and Farid has measured on 5 days. The list readings is still in the order of the days.")
globals().get("readings") == [31, 27, 35, 29, 25] and globals().get("coolest_first") == [25, 27, 29, 31, 35] and globals().get("coolest_three") == [25, 27, 29] and globals().get("day_count") == 5
```
