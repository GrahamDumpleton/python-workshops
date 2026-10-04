---
title: Combining conditions
requires: [quiz:predict-and, quiz:predict-or, verify:rider-ran, verify:raining-ran, verify:free-entry]
---

# Combining conditions

Some decisions depend on two questions. A person may go on a ride at
a fair only when the person is tall enough and also old enough. A
museum is free for small children or for old people.

Python has three words that make one boolean from other booleans.

| Word | Example | The result is `True` when |
|------|---------|---------------------------|
| `and` | `a and b` | both `a` and `b` are `True` |
| `or` | `a or b` | `a` is `True`, or `b` is `True`, or both are |
| `not` | `not a` | `a` is `False` |

The words mean nearly the same as in English. One difference is that
`or` is also `True` when both sides are `True`.

## Both, or at least one

A ride accepts a person who is at least 120 centimetres tall and at
least 8 years old. Farid is 130 centimetres tall and 7 years old. Look
at this cell, and do not run it yet.

```python
rider_height = 130
rider_age = 7
print(rider_height >= 120 and rider_age >= 8)
print(rider_height >= 120 or rider_age >= 8)
```

Python calculates each comparison first. `rider_height >= 120` is
`True`, and `rider_age >= 8` is `False`. Then it combines the two
booleans.

```{quiz}
:id: predict-and
:type: text
:title: Predict the first line of the output
question: "What does the line with `and` show?"
answer: "False"
wrong:
  - { text: "True", explanation: "`and` gives `True` only when both sides are `True`. The right side, `rider_age >= 8`, is `False`, because 7 is less than 8." }
  - { text: "false", explanation: "The answer is right, but Python writes the value with a capital letter: `False`." }
otherwise: "The left side is `True` and the right side is `False`. `and` gives `True` only when both sides are `True`."
explanation: "The left side is `True` but the right side is `False`. `and` needs both sides to be `True`, so the result is `False`. Farid may not go on the ride."
```

```{quiz}
:id: predict-or
:type: text
:title: Predict the second line of the output
question: "What does the line with `or` show?"
answer: "True"
wrong:
  - { text: "False", explanation: "`or` gives `True` when at least one side is `True`. The left side, `rider_height >= 120`, is `True`." }
  - { text: "true", explanation: "The answer is right, but Python writes the value with a capital letter: `True`." }
otherwise: "The left side is `True` and the right side is `False`. `or` gives `True` when at least one side is `True`."
explanation: "The left side is `True`. `or` needs only one side to be `True`, so the result is `True`."
```

Run the cell, and compare the output with your predictions.

```{attempt}
:id: rider-not-run
:check: rider-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-rider
:title: Add a cell that combines two comparisons with and, then with or, and run it
:path: {{ notebook }}
:tags: [rider]
:run: true
rider_height = 130
rider_age = 7
print(rider_height >= 120 and rider_age >= 8)
print(rider_height >= 120 or rider_age >= 8)
```

```{verify}
:id: rider-ran
:label: Python combined two comparisons
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed rider
if globals().get("rider_height") == 130 and globals().get("rider_age") == 7:
    print("The cell ran. It shows False for and, and True for or.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("rider_height") == 130 and globals().get("rider_age") == 7
```

## The opposite

`not` goes before one boolean, and gives the opposite value: `not
True` is `False`, and `not False` is `True`. It is useful with a name
that refers to a boolean, because the code reads almost like a
sentence.

```python
is_raining = False
if not is_raining:
    print("You can walk to the shop.")
```

The name `is_raining` refers to `False`, so `not is_raining` is
`True`, and Python performs the block. A combined condition can be
used after `if` in the same way as one comparison.

```{attempt}
:id: raining-not-run
:check: raining-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-raining
:title: Add a cell that uses not in a condition, and run it
:path: {{ notebook }}
:tags: [raining]
:run: true
is_raining = False
if not is_raining:
    print("You can walk to the shop.")
```

```{verify}
:id: raining-ran
:label: Python used not in a condition
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed raining
if globals().get("is_raining") is False:
    print("The cell ran. not False is True, so Python performed the block.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("is_raining") is False
```

## Your task

A museum is free for children who are younger than 6, and also for
people who are 65 or older. Every other visitor pays. The action
below adds a cell that knows only the first half of the rule.

```{cell-insert}
:id: insert-free-entry
:title: Add a cell that has half of the rule, for me to change
:path: {{ notebook }}
:tags: [free-entry]
:run: false
guest_age = 70
free_entry = guest_age < 6
print(free_entry)
```

A guest of 70 must get free entry, but the cell gives `False`.

Change the second line, so that `free_entry` is `True` when the guest
is younger than 6, and also when the guest is 65 or older. Keep the
comparison `guest_age < 6`, and combine it with a second comparison.
Then run the cell. The output must be `True`.

A guest who is exactly 65 gets free entry too. When your cell gives
`True` for 70, change the first line to `guest_age = 65` and run the
cell again, and then try `guest_age = 30`, which must give `False`.

```{hint}
:title: Hint: which word do I need?
The entry is free when at least one of the two comparisons is `True`.
Look at the table at the top of this page. Which word gives `True`
when at least one side is `True`?
```

```{hint}
:title: Hint: the second comparison
"65 or older" means that the age is greater than 65, or equal to 65.
The operator for "greater than or equal to" is `>=`. The second line
has this form: `free_entry = guest_age < 6 or ...`, with your second
comparison in place of the three dots.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: free-entry-not-started
:check: free-entry
:expect: The cell has not run yet
```

````{attempt}
:id: free-entry-unchanged
:check: free-entry
:expect: must get free entry

```{cell-insert}
:path: {{ notebook }}
:run: true
guest_age = 70
free_entry = guest_age < 6
print(free_entry)
```
````

````{attempt}
:id: free-entry-and
:check: free-entry
:expect: If your line uses and, change it to or

```{cell-insert}
:path: {{ notebook }}
:run: true
guest_age = 70
free_entry = guest_age < 6 and guest_age >= 65
print(free_entry)
```
````

````{attempt}
:id: free-entry-boundary
:check: free-entry
:expect: A guest who is exactly 65

```{cell-insert}
:path: {{ notebook }}
:run: true
guest_age = 65
free_entry = guest_age < 6 or guest_age > 65
print(free_entry)
```
````

````{attempt}
:id: free-entry-not-boolean
:check: free-entry
:expect: must refer to True or False

```{cell-insert}
:path: {{ notebook }}
:run: true
guest_age = 70
free_entry = "True"
print(free_entry)
```
````

````{attempt}
:id: free-entry-always
:check: free-entry
:expect: A guest of 30 must pay

```{cell-insert}
:path: {{ notebook }}
:run: true
guest_age = 30
free_entry = True
print(free_entry)
```
````

````{attempt}
:id: free-entry-other-age
:check: free-entry
:expect: Give guest_age a value of 65 or more

```{cell-insert}
:path: {{ notebook }}
:run: true
guest_age = 30
free_entry = guest_age < 6 or guest_age >= 65
print(free_entry)
```
````

````{hint}
:title: Show me a solution
:unlock: "free-entry" in failed_checks or "free-entry" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-free-entry-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [free-entry-solution]
:run: true
guest_age = 70
free_entry = guest_age < 6 or guest_age >= 65
print(free_entry)
```
````

```{verify}
:id: free-entry
:label: A guest who is 65 or older gets free entry
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed free-entry; cell-executed free-entry-solution
if "guest_age" not in globals() or "free_entry" not in globals():
    print("The cell has not run yet. Change the second line of the new cell. Then hold Shift and press Enter to run the cell.")
elif type(guest_age) not in (int, float):
    print(f"The name guest_age refers to {guest_age!r} but it must refer to a number. Change the first line back to guest_age = 70. Then run the cell again.")
elif type(free_entry) is not bool:
    print(f"The name free_entry refers to {free_entry!r} but it must refer to True or False, the result of your comparisons. The second line must begin with free_entry = guest_age < 6 and then combine that comparison with a second one. Then run the cell again.")
elif free_entry and 6 <= guest_age < 65:
    print(f"The name free_entry refers to True, but the guest is {guest_age}. A guest of {guest_age} must pay. Entry is free only for a guest who is younger than 6, or who is 65 or older. Correct the second line. Then run the cell again.")
elif not free_entry and guest_age == 65:
    print("The name free_entry refers to False, but the guest is 65. A guest who is exactly 65 gets free entry. Use the operator >= in your second comparison, so that 65 is included. Then run the cell again.")
elif not free_entry and (guest_age < 6 or guest_age > 65):
    print(f"The name free_entry refers to False, but a guest of {guest_age} must get free entry. Combine guest_age < 6 with a second comparison that is True for 65 or older. If your line uses and, change it to or: no age is both less than 6 and 65 or more. Then run the cell again.")
elif guest_age < 65:
    print(f"Your cell gives the right result for a guest of {guest_age}, but this check needs an older guest to test your change. Give guest_age a value of 65 or more. Then run the cell again.")
else:
    print(f"Correct. A guest of {guest_age} gets free entry. Your cell combines two comparisons with or.")
"guest_age" in globals() and "free_entry" in globals() and type(guest_age) in (int, float) and type(free_entry) is bool and guest_age >= 65 and free_entry
```

In English, the rule says "children and old people", but the code
needs `or`. The condition is about one guest, and one guest cannot be
both younger than 6 and 65 or older. When you turn a sentence into a
condition, ask whether both parts must be true, or only one of them.
