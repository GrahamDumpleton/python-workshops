---
title: Choosing which option to change
requires: [quiz:which-call, verify:tea-orders]
---

# Choosing which option to change

Default values and keyword arguments are most useful together. A
function can have several parameters that all have default values. A
call then names only the parameters that it wants to change, and
every other parameter keeps its default value.

You have already used a function that works in this way: `print()`.
When `print()` shows several values, it puts a space between them.
The space is the default value of a parameter that is named `sep`,
which is short for "separator". A keyword argument changes it.

```python
print(2026, 3, 14)
print(2026, 3, 14, sep="-")
```

The output of this code is:

```
2026 3 14
2026-3-14
```

The second call names the parameter `sep`, and gives it the string
`"-"`. `print()` has more parameters that have default values. A call
names only the ones that it wants to change.

## Why positions are not enough

Look at the first line of this function. It describes a cup of tea.

```python
def make_tea(kind="green", sugar=0, milk=False):
    return f"{kind} tea, sugar {sugar}, milk {milk}"
```

All three parameters have default values, so `make_tea()` with no
arguments works. It returns `"green tea, sugar 0, milk False"`.

Imagine that you want milk, and that you want the default values for
`kind` and `sugar`. With positional arguments, that is not possible.
The call `make_tea(True)` gives `True` to the first parameter, which
is `kind`. To reach the third parameter by position, the call must
also give the first two values.

A keyword argument solves the problem. The call `make_tea(milk=True)`
changes only `milk`.

```{quiz}
:id: which-call
:title: Change one option
question: "Which call gives a cup of green tea that has 2 sugars and no milk?"
options:
  - { text: "`make_tea(2)`", explanation: "A positional argument goes to the first parameter, which is `kind`. This call returns `\"2 tea, sugar 0, milk False\"`." }
  - { text: "`make_tea(sugar=2)`", correct: true }
  - { text: "`make_tea(\"sugar\", 2)`", explanation: "The first positional argument goes to `kind`, so this call asks for a kind of tea that is named sugar. It returns `\"sugar tea, sugar 2, milk False\"`." }
explanation: "The keyword argument `sugar=2` changes only the parameter `sugar`. The parameters `kind` and `milk` keep their default values, `\"green\"` and `False`."
```

## Your task

The action below adds a cell that holds the function `make_tea`, a
comment, and an empty line. The action does not run the cell.

```{cell-insert}
:id: insert-tea
:title: Add a cell with the function make_tea for me to complete
:path: {{ notebook }}
:tags: [tea]
:run: false
def make_tea(kind="green", sugar=0, milk=False):
    return f"{kind} tea, sugar {sugar}, milk {milk}"

# Write your lines below this one.

```

Do not change the function. Under the comment, write three
assignments, and then three lines that show the results. Each
assignment calls `make_tea()` and gives a name to the return value.
Give only the arguments that are needed.

| Name | The tea | The value that the name must refer to |
|------|---------|----------------------------------------|
| `tea_plain` | every default value | `"green tea, sugar 0, milk False"` |
| `tea_sweet` | 2 sugars, the other values default | `"green tea, sugar 2, milk False"` |
| `tea_milk` | black tea with milk, the sugar default | `"black tea, sugar 0, milk True"` |

After the three assignments, write `print(tea_plain)`,
`print(tea_sweet)` and `print(tea_milk)`, each on its own line. Then
run the cell. The output must be:

```
green tea, sugar 0, milk False
green tea, sugar 2, milk False
black tea, sugar 0, milk True
```

```{hint}
:title: Hint: the first two lines
A call with no arguments uses every default value, so the first line
is `tea_plain = make_tea()`. The second line changes only the sugar.
Name the parameter in the call: `tea_sweet = make_tea(sugar=2)`.
```

```{hint}
:title: Hint: the third line
The third call changes two parameters, `kind` and `milk`, and does
not change `sugar`. One way is two keyword arguments:
`tea_milk = make_tea(kind="black", milk=True)`. The value `True` is
written with a capital `T` and without quotes.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: tea-not-started
:check: tea-orders
:expect: The name tea_plain does not exist yet
```

````{attempt}
:id: tea-one-name
:check: tea-orders
:expect: The name tea_sweet does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def make_tea(kind="green", sugar=0, milk=False):
    return f"{kind} tea, sugar {sugar}, milk {milk}"

tea_plain = make_tea()
```
````

````{attempt}
:id: tea-two-names
:check: tea-orders
:expect: The name tea_milk does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def make_tea(kind="green", sugar=0, milk=False):
    return f"{kind} tea, sugar {sugar}, milk {milk}"

tea_plain = make_tea()
tea_sweet = make_tea(sugar=2)
```
````

````{attempt}
:id: tea-plain-wrong
:check: tea-orders
:expect: The name tea_plain refers to 'black tea, sugar 0, milk False'

```{cell-insert}
:path: {{ notebook }}
:run: true
def make_tea(kind="green", sugar=0, milk=False):
    return f"{kind} tea, sugar {sugar}, milk {milk}"

tea_plain = make_tea("black")
tea_sweet = make_tea(sugar=2)
tea_milk = make_tea("black", milk=True)
```
````

````{attempt}
:id: tea-sweet-positional
:check: tea-orders
:expect: The value 2 went to the parameter kind

```{cell-insert}
:path: {{ notebook }}
:run: true
def make_tea(kind="green", sugar=0, milk=False):
    return f"{kind} tea, sugar {sugar}, milk {milk}"

tea_plain = make_tea()
tea_sweet = make_tea(2)
tea_milk = make_tea("black", milk=True)
```
````

````{attempt}
:id: tea-sweet-wrong
:check: tea-orders
:expect: The name tea_sweet refers to 'green tea, sugar 3, milk False'

```{cell-insert}
:path: {{ notebook }}
:run: true
def make_tea(kind="green", sugar=0, milk=False):
    return f"{kind} tea, sugar {sugar}, milk {milk}"

tea_plain = make_tea()
tea_sweet = make_tea(sugar=3)
tea_milk = make_tea("black", milk=True)
```
````

````{attempt}
:id: tea-milk-positional
:check: tea-orders
:expect: The value True went to the parameter sugar

```{cell-insert}
:path: {{ notebook }}
:run: true
def make_tea(kind="green", sugar=0, milk=False):
    return f"{kind} tea, sugar {sugar}, milk {milk}"

tea_plain = make_tea()
tea_sweet = make_tea(sugar=2)
tea_milk = make_tea("black", True)
```
````

````{attempt}
:id: tea-milk-wrong
:check: tea-orders
:expect: The name tea_milk refers to 'green tea, sugar 0, milk True'

```{cell-insert}
:path: {{ notebook }}
:run: true
def make_tea(kind="green", sugar=0, milk=False):
    return f"{kind} tea, sugar {sugar}, milk {milk}"

tea_plain = make_tea()
tea_sweet = make_tea(sugar=2)
tea_milk = make_tea(milk=True)
```
````

````{attempt}
:id: tea-other-way
:check: tea-orders
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def make_tea(kind="green", sugar=0, milk=False):
    return f"{kind} tea, sugar {sugar}, milk {milk}"

tea_plain = make_tea()
tea_sweet = make_tea("green", 2)
tea_milk = make_tea(milk=True, kind="black")
```
````

````{hint}
:title: Show me a solution
:unlock: "tea-orders" in failed_checks or "tea-orders" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-tea-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [tea-solution]
:run: true
def make_tea(kind="green", sugar=0, milk=False):
    return f"{kind} tea, sugar {sugar}, milk {milk}"

tea_plain = make_tea()
tea_sweet = make_tea(sugar=2)
tea_milk = make_tea("black", milk=True)
print(tea_plain)
print(tea_sweet)
print(tea_milk)
```
````

```{verify}
:id: tea-orders
:label: The three calls of make_tea give the three cups of tea
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed tea; cell-executed tea-solution
if "tea_plain" not in globals():
    print("The name tea_plain does not exist yet. Write your lines under the comment in the new cell, and begin with tea_plain = make_tea(). Then hold Shift and press Enter to run the cell.")
elif "tea_sweet" not in globals():
    print("The name tea_sweet does not exist yet. Add a line that calls make_tea() with 2 sugars, and gives the result the name tea_sweet. Check the spelling. Then run the cell again.")
elif "tea_milk" not in globals():
    print("The name tea_milk does not exist yet. Add a line that calls make_tea() for black tea with milk, and gives the result the name tea_milk. Check the spelling. Then run the cell again.")
elif tea_plain != "green tea, sugar 0, milk False":
    print("The name tea_plain refers to " + repr(tea_plain) + " but it must refer to 'green tea, sugar 0, milk False'. Call the function with no arguments, so that every parameter keeps its default value: tea_plain = make_tea(). Then run the cell again.")
elif tea_sweet == "2 tea, sugar 0, milk False":
    print("The name tea_sweet refers to '2 tea, sugar 0, milk False'. The value 2 went to the parameter kind, because a positional argument goes to the first parameter. Name the parameter in the call: tea_sweet = make_tea(sugar=2). Then run the cell again.")
elif tea_sweet != "green tea, sugar 2, milk False":
    print("The name tea_sweet refers to " + repr(tea_sweet) + " but it must refer to 'green tea, sugar 2, milk False'. Change only the sugar, with a keyword argument: tea_sweet = make_tea(sugar=2). Then run the cell again.")
elif tea_milk == "black tea, sugar True, milk False":
    print("The name tea_milk refers to 'black tea, sugar True, milk False'. The value True went to the parameter sugar, because the second positional argument goes to the second parameter. Name the parameter in the call: tea_milk = make_tea(\"black\", milk=True). Then run the cell again.")
elif tea_milk != "black tea, sugar 0, milk True":
    print("The name tea_milk refers to " + repr(tea_milk) + " but it must refer to 'black tea, sugar 0, milk True'. The call must change the kind to \"black\" and the milk to True: tea_milk = make_tea(\"black\", milk=True). Then run the cell again.")
else:
    print("Correct. Each call changed only the options that it named, and every other parameter kept its default value.")
all(name in globals() for name in ("tea_plain", "tea_sweet", "tea_milk")) and tea_plain == "green tea, sugar 0, milk False" and tea_sweet == "green tea, sugar 2, milk False" and tea_milk == "black tea, sugar 0, milk True"
```
