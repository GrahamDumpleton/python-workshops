---
title: A real copy
requires: [quiz:predict-stops, verify:stops-ran, verify:guests-fixed]
---

# A real copy

Often you want a second list that starts with the same items as the
first list, so that you can change one list and keep the other. You
now know that an assignment does not give you that. The line
`tuesday = monday` ties a second name to the same list.

A list has a method that makes a second list. A method is a function
that belongs to a value, and you call it with a dot after the value,
as you do with `append`. The method is `.copy()`. It makes a new list
that holds the same items in the same order, and it gives the new
list back. The new list is a **copy**: it is equal to the first list,
but it is not the same list.

In the comparison with the paper on the refrigerator door, `.copy()`
writes the items again on a second piece of paper.

Look at this cell. Do not run it yet. It holds the stops of a
journey.

```python
stops = ["Nairobi", "Cairo"]
longer_stops = stops.copy()
longer_stops.append("Tunis")
print(len(stops))
```

```{quiz}
:id: predict-stops
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "2"
wrong:
  - { text: "3", explanation: "That would be the answer for the line `longer_stops = stops`. This cell has `stops.copy()` on the right side, which makes a new list. The item `\"Tunis\"` is added only to the new list." }
otherwise: "The last line shows the number of items of the list that `stops` refers to. Does `append` change that list, or the copy? Type one whole number."
explanation: "`stops.copy()` makes a second list. The name `longer_stops` refers to the second list, so `append` changes only the second list. The list `stops` still has 2 items."
```

Run the cell, and compare the output with your prediction. The cell
in your notebook shows both lists, and then asks whether the two
names refer to the same list.

```{attempt}
:id: stops-not-run
:check: stops-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-stops
:title: Add the cell that makes a copy with .copy(), and run it
:path: {{ notebook }}
:tags: [stops]
:run: true
stops = ["Nairobi", "Cairo"]
longer_stops = stops.copy()
longer_stops.append("Tunis")
print(len(stops))
print(stops)
print(longer_stops)
print(longer_stops is stops)
```

The output is:

```
2
['Nairobi', 'Cairo']
['Nairobi', 'Cairo', 'Tunis']
False
```

```{verify}
:id: stops-ran
:label: The copy changed and the first list did not
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed stops
if globals().get("stops") == ["Nairobi", "Cairo"] and globals().get("longer_stops") == ["Nairobi", "Cairo", "Tunis"]:
    print("The cell ran. The list stops still has 2 items, and the copy longer_stops has 3 items.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("stops") == ["Nairobi", "Cairo"] and globals().get("longer_stops") == ["Nairobi", "Cairo", "Tunis"]
```

## What happened

1. `stops = ["Nairobi", "Cairo"]` makes a list, and ties the label
   `stops` to it.

2. `longer_stops = stops.copy()` calls the method `.copy()` of that
   list. The method makes a second list with the same items, and
   gives it back. The assignment ties the label `longer_stops` to the
   second list.

3. `longer_stops.append("Tunis")` changes the second list only.

4. The last line shows `False`: the two names refer to two lists.

## Your task

Farid plans a dinner. The list `guests` holds the people who said
that they will come. He wants a second list, `invited`, with the same
people and one more person, Tomasz, who has not answered yet. His
cell has the mistake of this workshop.

```{cell-insert}
:id: insert-guests
:title: Add a cell with the mistake for me to correct
:path: {{ notebook }}
:tags: [guests]
:run: false
guests = ["Amara", "Kenji", "Sofia"]
invited = guests
invited.append("Tomasz")
print(guests)
print(invited)
```

First run the cell as it is: click inside it, hold `Shift` and press
`Enter`. Both lines of the output show four people, so Tomasz is now
also in the list `guests`. That is wrong.

Then correct the cell. Change only the second line, so that `invited`
refers to a copy of the list `guests`. Run the cell again. When the
cell is correct, the output is:

```
['Amara', 'Kenji', 'Sofia']
['Amara', 'Kenji', 'Sofia', 'Tomasz']
```

```{hint}
:title: Hint: what to look at
Look at the second line of the cell at the top of this page:
`longer_stops = stops.copy()`. The right side of that line makes a
copy. The second line of your cell needs the same form.
```

```{hint}
:title: Hint: the form of the line
The second line must call the method `.copy()` of the list `guests`:
write a dot, the word `copy`, and a pair of parentheses after the
name `guests`. Do not forget the parentheses. Without them, Python
does not call the method.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: guests-not-started
:check: guests-fixed
:expect: The cell has not run yet
```

````{attempt}
:id: guests-unchanged
:check: guests-fixed
:expect: refer to the same list

```{cell-insert}
:path: {{ notebook }}
:run: true
guests = ["Amara", "Kenji", "Sofia"]
invited = guests
invited.append("Tomasz")
print(guests)
print(invited)
```
````

````{attempt}
:id: guests-no-parentheses
:check: guests-fixed
:expect: must refer to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
guests = ["Amara", "Kenji", "Sofia"]
invited = guests.copy
print(guests)
print(invited is guests)
```
````

````{attempt}
:id: guests-no-append
:check: guests-fixed
:expect: Change only the second line

```{cell-insert}
:path: {{ notebook }}
:run: true
guests = ["Amara", "Kenji", "Sofia"]
invited = guests.copy()
print(guests)
print(invited)
```
````

````{attempt}
:id: guests-slice
:check: guests-fixed
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
guests = ["Amara", "Kenji", "Sofia"]
invited = guests[:]
invited.append("Tomasz")
print(guests)
print(invited)
```
````

````{hint}
:title: Show me a solution
:unlock: "guests-fixed" in failed_checks or "guests-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-guests-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [guests-solution]
:run: true
guests = ["Amara", "Kenji", "Sofia"]
invited = guests.copy()
invited.append("Tomasz")
print(guests)
print(invited)
```
````

```{verify}
:id: guests-fixed
:label: The list invited is a copy, and the list guests did not change
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed guests; cell-executed guests-solution
if "guests" not in globals() or "invited" not in globals():
    print("The cell has not run yet. Click inside the new cell, then hold Shift and press Enter to run it. If the cell shows an error message, read its last line, correct the cell, and run it again.")
elif invited is guests:
    print("The names invited and guests still refer to the same list, so Tomasz was added to both. The line invited = guests makes no copy. Change the second line so that it calls the method copy of the list: invited = guests.copy() and then run the cell again.")
elif not isinstance(guests, list) or not isinstance(invited, list):
    print("Both names, guests and invited, must refer to a list, but one of them refers to another kind of value. That happens when the parentheses after copy are missing. The second line must be invited = guests.copy() with the parentheses. Then run the cell again.")
elif guests == ["Amara", "Kenji", "Sofia"] and invited == ["Amara", "Kenji", "Sofia", "Tomasz"]:
    print("Correct. The name invited refers to a copy, so Tomasz was added to the copy only. The list guests still holds 3 people.")
else:
    print(f"The two names now refer to two lists, which is right. But the list guests is {guests!r} and the list invited is {invited!r}. The list guests must hold Amara, Kenji and Sofia, and the list invited must hold the same three people and then Tomasz. Change only the second line of the cell, and leave the other lines as they were. Then run the cell again.")
"guests" in globals() and "invited" in globals() and invited is not guests and guests == ["Amara", "Kenji", "Sofia"] and invited == ["Amara", "Kenji", "Sofia", "Tomasz"]
```

You corrected the mistake. The method `.copy()` gave Farid a second
list, and a change to the second list does not appear in the first
list.

Dictionaries and sets have a method `.copy()` too, and it works in
the same way.
