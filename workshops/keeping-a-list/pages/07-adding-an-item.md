---
title: Adding an item
requires: [verify:basket-ran, quiz:predict-queue, verify:queue-ran, verify:guests-added]
---

# Adding an item

A program often does not know every item when it creates a list. A
customer puts one more thing in the basket. One more guest accepts an
invitation. The list must be able to grow.

A list has a method for this, named `append()`. A **method** is a
function that belongs to a value. To use a method, write the value or
its name, then a dot, then the name of the method, then parentheses.
You used methods of strings in the same way, for example
`name.upper()`.

`basket.append("tea")` adds the string `"tea"` at the end of the list
`basket`. The word "append" means "add at the end".

Writing one more line at the bottom of a shopping list on paper is a
good comparison. The list is the same piece of paper, and it is now
one line longer.

Click the action below. It adds a cell that creates a list of two
items, adds a third item, and shows the list.

```{attempt}
:id: basket-not-run
:check: basket-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-basket
:title: Add a cell that adds an item at the end of a list, and run it
:path: {{ notebook }}
:tags: [basket]
:run: true
basket = ["bread", "rice"]
basket.append("tea")
print(basket)
```

The output is `['bread', 'rice', 'tea']`.

1. `basket = ["bread", "rice"]` creates a list of two items.

2. `basket.append("tea")` adds `"tea"` after the last item. The list
   now has three items. This line shows nothing.

3. `print(basket)` shows the list.

```{verify}
:id: basket-ran
:label: The list basket has a third item
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed basket
if globals().get("basket") == ["bread", "rice", "tea"]:
    print("The cell ran. The list basket now has three items.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("basket") == ["bread", "rice", "tea"]
```

## append() changes the list and gives nothing back

The methods of a string give back a new string, because a string
never changes. `append()` is different. It changes the list itself,
and it does not give back a new list.

A function or a method that has nothing to give back gives back a
special value, which Python writes as `None`. **`None`** means "no
value". So the line `basket.append("tea")` is complete. Do not write
`basket = basket.append("tea")`: that line makes the name `basket`
refer to `None`, and the name no longer refers to the list.

## Starting with an empty list

A list can have no items at all. Two square brackets with nothing
between them, `[]`, are an empty list. A program often starts with an
empty list and adds the items one at a time.

Look at this cell. Do not run it yet.

```python
queue = []
queue.append("Ana")
queue.append("Bao")
queue.append("Chidi")
print(queue[1])
```

```{quiz}
:id: predict-queue
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "Bao"
wrong:
  - { text: "Ana", explanation: "`\"Ana\"` was added first, so it has the index 0. The cell shows the item with the index 1." }
  - { text: "Chidi", explanation: "`\"Chidi\"` was added last, so it is at the end of the list, with the index 2." }
  - { pattern: "[\"']Bao[\"']", explanation: "The item is correct. `print()` shows one string without its quotes, so type the word only." }
  - { pattern: "\\[.*\\]", explanation: "`print(queue[1])` shows one item, not the whole list. Which item has the index 1?" }
otherwise: "Each `append()` adds an item at the end. Write the list on paper after the three lines, and then count the items from 0."
explanation: "Each `append()` adds an item at the end, so the list is `[\"Ana\", \"Bao\", \"Chidi\"]`. The item with the index 1 is `\"Bao\"`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: queue-not-run
:check: queue-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-queue
:title: Add the cell that adds three items to an empty list, and run it
:path: {{ notebook }}
:tags: [queue]
:run: true
queue = []
queue.append("Ana")
queue.append("Bao")
queue.append("Chidi")
print(queue[1])
```

```{verify}
:id: queue-ran
:label: The list queue has three items
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed queue
if globals().get("queue") == ["Ana", "Bao", "Chidi"]:
    print("The cell ran. The list queue has three items, and the item with the index 1 is Bao.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("queue") == ["Ana", "Bao", "Chidi"]
```

## Your task

Now you write the code yourself. Amara and Mei are the guests at a
dinner. Then Diego says that he will come too.

Write three lines:

1. Create a list named `guests` that holds the two strings `"Amara"`
   and `"Mei"`, in that order.

2. Add the string `"Diego"` at the end of the list, with `append()`.

3. Show the list with `print()`.

When your code is correct, the output under the cell is:

```
['Amara', 'Mei', 'Diego']
```

The action below adds a new cell for your code.

```{cell-insert}
:id: insert-guests
:title: Add a cell for my code
:path: {{ notebook }}
:tags: [guests]
:run: false
# Write your three lines below this one.

```

Click on the empty line under the comment, and type your lines. Then
run the cell: hold `Shift` and press `Enter`. If the output is not
what you expected, change your code and run the cell again.

```{hint}
:title: Hint: how to begin
The first line is an assignment. The name `guests` is on the left,
and the list is on the right, like `basket = ["bread", "rice"]`. Each
string needs quotes, and the names begin with capital letters.
```

```{hint}
:title: Hint: how to add Diego
Look at the second line of the cell with the basket:
`basket.append("tea")`. Your line has the same form, with the name
`guests` and the string `"Diego"`. Do not write `guests =` at the
start of this line.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: guests-not-started
:check: guests-added
:expect: The name guests does not exist yet
```

````{attempt}
:id: guests-not-a-list
:check: guests-added
:expect: does not refer to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
guests = "Amara, Mei"
print(guests)
```
````

````{attempt}
:id: guests-no-append
:check: guests-added
:expect: The list guests has only two items

```{cell-insert}
:path: {{ notebook }}
:run: true
guests = ["Amara", "Mei"]
print(guests)
```
````

````{attempt}
:id: guests-assigned-append
:check: guests-added
:expect: The name guests refers to None

```{cell-insert}
:path: {{ notebook }}
:run: true
guests = ["Amara", "Mei"]
guests = guests.append("Diego")
print(guests)
```
````

````{attempt}
:id: guests-appended-list
:check: guests-added
:expect: The last item of the list guests is a list

```{cell-insert}
:path: {{ notebook }}
:run: true
guests = ["Amara", "Mei"]
guests.append(["Diego"])
print(guests)
```
````

````{attempt}
:id: guests-small-letters
:check: guests-added
:expect: but it must be ['Amara', 'Mei', 'Diego']

```{cell-insert}
:path: {{ notebook }}
:run: true
guests = ["amara", "mei"]
guests.append("diego")
print(guests)
```
````

````{hint}
:title: Show me a solution
:unlock: "guests-added" in failed_checks or "guests-added" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-guests-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [guests-solution]
:run: true
guests = ["Amara", "Mei"]
guests.append("Diego")
print(guests)
```
````

```{verify}
:id: guests-added
:label: The list guests holds Amara, Mei and Diego
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed guests; cell-executed guests-solution
if "guests" not in globals():
    print("The name guests does not exist yet. Write your three lines under the comment in the new cell, and begin with the line that creates the list guests. Check the spelling. Then hold Shift and press Enter to run the cell.")
elif guests is None:
    print("The name guests refers to None, and no longer refers to a list. That happens when the line is guests = guests.append(\"Diego\"). The method append() changes the list and gives back None. Write only guests.append(\"Diego\"), with no guests = before it. Then run the cell again.")
elif not isinstance(guests, list):
    print("The name guests does not refer to a list. Write the two strings between square brackets, with a comma between them: guests = [\"Amara\", \"Mei\"]. Then run the cell again.")
elif guests == ["Amara", "Mei", "Diego"]:
    print("Correct. The list guests holds Amara, Mei and Diego, in that order.")
elif guests == ["Amara", "Mei"]:
    print("The list guests has only two items. Add a line that adds Diego at the end: guests.append(\"Diego\"). Then run the cell again.")
elif len(guests) > 0 and isinstance(guests[-1], list):
    print("The last item of the list guests is a list, not a string. That happens when the line is guests.append([\"Diego\"]). Write the string with no square brackets: guests.append(\"Diego\"). Then run the cell again.")
else:
    print(f"The list guests is {guests} but it must be ['Amara', 'Mei', 'Diego']. Check the spelling of each name, the capital letters and the order. The first line must create the list with Amara and Mei, and the second line must add Diego. Then run the cell again.")
globals().get("guests") == ["Amara", "Mei", "Diego"]
```
