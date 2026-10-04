---
title: A function that changes its argument
requires: [quiz:predict-shopping, verify:shopping-ran, verify:add-bag-fixed]
---

# A function that changes its argument

The same surprise can happen with a function, and there it is more
difficult to see, because no line of the form `b = a` appears in the
code.

First, three ideas from the workshop **Your first function**.

- A function is a group of lines with a name. You define it with
  `def`, and you call it by its name with parentheses.

- A **parameter** is a name in the `def` line. An **argument** is a
  value that the call gives to the function.

- `return` ends the function, and gives a value back to the code
  that called it. That value is the **return value**.

Now the new idea. When a call runs, Python ties each parameter to its
argument. The parameter is one more label on the same value. Python
does not copy the argument. So when the argument is a list, the
parameter refers to the same list as the name in the call, and a
change to the list inside the function is a change to the list of
the caller.

Think of the paper on the refrigerator door again. You do not give
your friend a copy of the paper. You give your friend the paper
itself. What your friend writes on it is there when you get it back.

## Predict: a list goes into a function

Look at this cell. Do not run it yet. The function is meant to give
back a shopping list with a bag added at its end.

```python
def with_bag(items):
    items.append("bag")
    return items

shopping = ["bread", "milk"]
packed = with_bag(shopping)
print(len(shopping))
```

```{quiz}
:id: predict-shopping
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "3"
wrong:
  - { text: "2", explanation: "No line outside the function changes the list `shopping`. But inside the function, the parameter `items` refers to the same list as `shopping`, and `append` changes that list." }
otherwise: "The last line shows the number of items of the list that `shopping` refers to. Which list does the parameter `items` refer to while the function runs? Type one whole number."
explanation: "The call `with_bag(shopping)` ties the parameter `items` to the list that `shopping` refers to. `items.append(\"bag\")` changes that list. So the list of the caller has 3 items after the call."
```

Run the cell, and compare the output with your prediction. The cell
in your notebook also shows the list, and asks whether `packed` and
`shopping` refer to the same list.

```{attempt}
:id: shopping-not-run
:check: shopping-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-shopping
:title: Add the cell with a function that changes its argument, and run it
:path: {{ notebook }}
:tags: [shopping]
:run: true
def with_bag(items):
    items.append("bag")
    return items

shopping = ["bread", "milk"]
packed = with_bag(shopping)
print(len(shopping))
print(shopping)
print(packed is shopping)
```

The output is:

```
3
['bread', 'milk', 'bag']
True
```

```{verify}
:id: shopping-ran
:label: The function changed the list of the caller
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed shopping
if globals().get("shopping") == ["bread", "milk", "bag"] and globals().get("packed") is globals().get("shopping"):
    print("The cell ran. The function changed the list shopping, which now has 3 items. The name packed refers to that same list.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("shopping") == ["bread", "milk", "bag"] and globals().get("packed") is globals().get("shopping")
```

## What happened

1. `shopping = ["bread", "milk"]` makes a list.

2. The call `with_bag(shopping)` starts the function. Python ties the
   parameter `items` to the argument, which is the list that
   `shopping` refers to. Two labels are now tied to one list.

3. `items.append("bag")` changes that list.

4. `return items` gives the same list back, and the assignment ties
   the label `packed` to it. That is a third label on one list.

The whole cell makes only one list. The person who wrote the line
`packed = with_bag(shopping)` expected two lists: the list `shopping`
as it was, and a new list `packed`.

Sometimes a function is meant to change its argument, and that is
correct. `append` itself changes the list that it belongs to. The
problem is a function that changes its argument when the person who
calls it does not expect that. A function that gives back a new list
must leave the list that it was given as it was.

## Your task

The cell below has a function with the same mistake.

```{cell-insert}
:id: insert-add-bag
:title: Add a cell with a function for me to correct
:path: {{ notebook }}
:tags: [add-bag]
:run: false
def add_bag(things):
    things.append("bag")
    return things

basket = ["rice", "tea"]
full_basket = add_bag(basket)
print(basket)
print(full_basket)
```

First run the cell as it is: click inside it, hold `Shift` and press
`Enter`. Both lines of the output show `['rice', 'tea', 'bag']`.

Then correct the function `add_bag`. Change only the lines of the
function, and leave the four lines under it as they are.

- The function still has one parameter, a list.

- It must return a new list, which holds the items of the list that
  it was given, and then the string `"bag"`.

- It must leave the list that it was given as it was.

For example, `add_bag(["rice", "tea"])` must return
`['rice', 'tea', 'bag']`. Run the cell again. When the function is
correct, the output is:

```
['rice', 'tea']
['rice', 'tea', 'bag']
```

```{hint}
:title: Hint: what to look at
The function must not call `append` on the list that the parameter
`things` refers to, because that list belongs to the caller. It needs
a list of its own. The page **A real copy** showed how to make a
second list from a list.
```

```{hint}
:title: Hint: the shape of the function
The function needs three lines under the `def` line. Each line begins
with four spaces.

1. Make a copy of the list `things`, and give the copy a name, for
   example `result`.

2. Add `"bag"` to the copy with `append`.

3. Return the copy.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: add-bag-not-started
:check: add-bag-fixed
:expect: The function add_bag does not exist yet
```

````{attempt}
:id: add-bag-not-a-function
:check: add-bag-fixed
:expect: The name add_bag does not refer to a function

```{cell-insert}
:path: {{ notebook }}
:run: true
add_bag = ["rice", "tea", "bag"]
print(add_bag)
```
````

````{attempt}
:id: add-bag-two-parameters
:check: add-bag-fixed
:expect: must have exactly one parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
def add_bag(things, extra):
    result = things.copy()
    result.append(extra)
    return result

print(add_bag(["rice", "tea"], "bag"))
```
````

````{attempt}
:id: add-bag-stops
:check: add-bag-fixed
:expect: stopped with a NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def add_bag(things):
    result = things.copy()
    result.append(bag)
    return result

print("The function is defined, but this cell does not call it.")
```
````

````{attempt}
:id: add-bag-unchanged
:check: add-bag-fixed
:expect: still changes the list that it is given

```{cell-insert}
:path: {{ notebook }}
:run: true
def add_bag(things):
    things.append("bag")
    return things

basket = ["rice", "tea"]
full_basket = add_bag(basket)
print(basket)
print(full_basket)
```
````

````{attempt}
:id: add-bag-no-return
:check: add-bag-fixed
:expect: does not return a value

```{cell-insert}
:path: {{ notebook }}
:run: true
def add_bag(things):
    result = things.copy()
    result.append("bag")

basket = ["rice", "tea"]
full_basket = add_bag(basket)
print(basket)
print(full_basket)
```
````

````{attempt}
:id: add-bag-prints
:check: add-bag-fixed
:expect: shows the new list with print()

```{cell-insert}
:path: {{ notebook }}
:run: true
def add_bag(things):
    result = things.copy()
    result.append("bag")
    print(result)

basket = ["rice", "tea"]
full_basket = add_bag(basket)
print(basket)
```
````

````{attempt}
:id: add-bag-no-append
:check: add-bag-fixed
:expect: but it must give ['pen', 'book', 'bag']

```{cell-insert}
:path: {{ notebook }}
:run: true
def add_bag(things):
    result = things.copy()
    return result

basket = ["rice", "tea"]
full_basket = add_bag(basket)
print(basket)
print(full_basket)
```
````

````{attempt}
:id: add-bag-other-way
:check: add-bag-fixed
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def add_bag(things):
    return things + ["bag"]

basket = ["rice", "tea"]
full_basket = add_bag(basket)
print(basket)
print(full_basket)
```
````

````{hint}
:title: Show me a solution
:unlock: "add-bag-fixed" in failed_checks or "add-bag-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-add-bag-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [add-bag-solution]
:run: true
def add_bag(things):
    result = things.copy()
    result.append("bag")
    return result

basket = ["rice", "tea"]
full_basket = add_bag(basket)
print(basket)
print(full_basket)
```
````

```{verify}
:id: add-bag-fixed
:label: The function add_bag returns a new list and leaves its argument as it was
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed add-bag; cell-executed add-bag-solution
def _workshop_check():
    import contextlib, io
    if "add_bag" not in globals():
        print("The function add_bag does not exist yet. Click inside the new cell, then hold Shift and press Enter to run it. If the cell shows an error message, read its last line, correct the cell, and run it again.")
        return False
    add_bag = globals()["add_bag"]
    if not callable(add_bag):
        print("The name add_bag does not refer to a function. That happens when a line assigns another value to the name add_bag. Run the cell that holds the line def add_bag(things): again.")
        return False
    for start, wanted in ((["pen", "book"], ["pen", "book", "bag"]), (["map"], ["map", "bag"])):
        given = start.copy()
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = add_bag(given)
        except TypeError:
            print(f"The check called add_bag({start!r}) and the function stopped with a TypeError. That usually means that the def line has more than one parameter, or no parameter. The function must have exactly one parameter, which is a list. Keep the line def add_bag(things): as it was. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The check called add_bag({start!r}) and the function stopped with a {type(error).__name__}. Add a line under your cell that calls the function in the same way, run the cell, and read the last line of the error message. Correct the function, and run the cell again.")
            return False
        if given != start:
            print(f"The function add_bag still changes the list that it is given. The check called add_bag({start!r}) and after the call that list was {given!r}. Inside the function, make a copy of the list first: result = things.copy() and then add the bag to the copy and return the copy. Then run the cell again.")
            return False
        if result is None and shown.getvalue().strip() == repr(wanted):
            print("The function add_bag shows the new list with print(), but it does not return it. The code that calls the function gets None. Replace print with return, so that the last line of the function gives the new list back. Then run the cell again.")
            return False
        if result is None:
            print("The function add_bag does not return a value, so the code that calls it gets None. The last line of the function must give the new list back: the word return and then the name of your copy. Then run the cell again.")
            return False
        if result != wanted:
            print(f"add_bag({start!r}) gives {result!r} but it must give {wanted!r}. The function must make a copy of the list that it is given, add the string bag to the copy with append, and return the copy. Then run the cell again.")
            return False
    print("Correct. add_bag(['pen', 'book']) gives ['pen', 'book', 'bag'] and the list that the function was given still has 2 items.")
    return True
globals().pop("_workshop_check")()
```

You corrected the function. It now makes its own list, changes that
list, and returns it. The list of the caller stays as it was.

When you write a function that takes a list or a dictionary, decide
which of the two the function does: change the value that it is
given, or return a new value. A function that does both, like
`with_bag` at the top of this page, is the one that causes surprises.
