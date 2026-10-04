---
title: A dataclass of your own
requires: [verify:budget-class]
---

# A dataclass of your own

You have seen what a dataclass is, and you have read one. On this
page you write one, from the first line to the last. You write the
decorator, the fields and one method. You do not write `__init__`,
`__repr__` or `__eq__`.

## What the class must do

Mariam has a budget for each category of her spending. A budget is
the most that she plans to spend on one category in one month. For
food, her budget is 180.

Write a dataclass that holds one budget.

- The name of the class is `Budget`.

- It has two fields, in this order: `category`, which is a string,
  and `limit`, which is a `Decimal`. The limit is the amount of the
  budget.

- It has one method, `is_over`. The method has the parameters `self`
  and `spent`, where `spent` is the amount of money that was spent.
  The method returns `True` when `spent` is more than the limit of
  the budget. In every other case, it returns `False`.

- Under the class, make one object and give it the name
  `food_budget`: the category is `"food"` and the limit is
  `Decimal("180")`.

- The last two lines of the cell are `print(food_budget)` and
  `print(food_budget.is_over(Decimal("199.85")))`. In February,
  Mariam spent 199.85 on food.

Some examples for the object `food_budget`:

| Call | Return value |
|------|--------------|
| `food_budget.is_over(Decimal("199.85"))` | `True` |
| `food_budget.is_over(Decimal("138.15"))` | `False` |
| `food_budget.is_over(Decimal("180"))` | `False` |

When your code is correct, the output under the cell is:

```
Budget(category='food', limit=Decimal('180'))
True
```

You did not write the text of the first line. The decorator wrote
the method `__repr__` that gives it.

The names `dataclass` and `Decimal` already exist in your notebook,
so your cell does not need the two `import` lines again.

```{cell-insert}
:id: insert-budget-class
:title: Add a cell for my class
:path: {{ notebook }}
:tags: [budget-class]
:run: false
# Write the dataclass Budget on the lines below this one.

```

Click on the empty line under the comment, and type your class. Then
run the cell: hold `Shift` and press `Enter`. The check at the
bottom of this page makes objects of your class, and calls your
method with several amounts.

```{hint}
:title: Hint: the decorator and the fields
Look at the dataclass `Purchase` on the page **Python writes the
methods**. Your class has the same shape, with two fields.

The first line is `@dataclass`. The second line is `class Budget:`.
The two fields come next, and each begins with four spaces:
`category: str` and `limit: Decimal`.
```

```{hint}
:title: Hint: the method
Leave one empty line under the fields. The method begins with the
line `def is_over(self, spent):`, with four spaces before `def`.

The body is one line with eight spaces before it. It returns the
result of a comparison. Inside a method, the limit of this budget is
`self.limit`. The operator for "more than" is `>`.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first. It names the type of
the error.

A `NameError` for the name `dataclass` or `Decimal` means that the
kernel does not know the name. Run the cell on the page **Python
writes the methods** again, or add the lines
`from dataclasses import dataclass` and
`from decimal import Decimal` at the top of your cell.

A `NameError` for the name `limit` means that the method uses
`limit` where it must use `self.limit`.

A `TypeError` that says `Budget() takes no arguments` means that the
class is not a dataclass, so it has no method `__init__`. Check that
the line `@dataclass` is directly above the line `class Budget:`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: budget-not-started
:check: budget-class
:expect: The class Budget does not exist yet
```

````{attempt}
:id: budget-not-a-class
:check: budget-class
:expect: its value is not a class

```{cell-insert}
:path: {{ notebook }}
:run: true
Budget = {"food": Decimal("180")}
```
````

````{attempt}
:id: budget-no-decorator
:check: budget-class
:expect: is not a dataclass

```{cell-insert}
:path: {{ notebook }}
:run: true
class Budget:
    category: str
    limit: Decimal

    def is_over(self, spent):
        return spent > self.limit
```
````

````{attempt}
:id: budget-no-fields
:check: budget-class
:expect: has no fields yet

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    category = "food"
    limit = Decimal("180")
```
````

````{attempt}
:id: budget-fields-order
:check: budget-class
:expect: The fields of the class Budget are limit and category

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    limit: Decimal
    category: str
```
````

````{attempt}
:id: budget-by-hand
:check: budget-class
:expect: written by hand

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    category: str
    limit: Decimal

    def __repr__(self):
        return f"Budget for {self.category}"

    def is_over(self, spent):
        return spent > self.limit
```
````

````{attempt}
:id: budget-no-method
:check: budget-class
:expect: has no method is_over yet

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    category: str
    limit: Decimal
```
````

````{attempt}
:id: budget-method-outside
:check: budget-class
:expect: is outside the class

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    category: str
    limit: Decimal

def is_over(self, spent):
    return spent > self.limit
```
````

````{attempt}
:id: budget-no-self
:check: budget-class
:expect: must have exactly two parameters

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    category: str
    limit: Decimal

    def is_over(spent):
        return spent > 180
```
````

````{attempt}
:id: budget-stops
:check: budget-class
:expect: stopped with an error of the type NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    category: str
    limit: Decimal

    def is_over(self, spent):
        return spent > limit
```
````

````{attempt}
:id: budget-prints
:check: budget-class
:expect: shows the result with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    category: str
    limit: Decimal

    def is_over(self, spent):
        print(spent > self.limit)
```
````

````{attempt}
:id: budget-no-return
:check: budget-class
:expect: A method with no return line gives None

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    category: str
    limit: Decimal

    def is_over(self, spent):
        over = spent > self.limit
```
````

````{attempt}
:id: budget-not-a-boolean
:check: budget-class
:expect: but it must give True or False

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    category: str
    limit: Decimal

    def is_over(self, spent):
        return spent - self.limit
```
````

````{attempt}
:id: budget-reversed
:check: budget-class
:expect: but it must give True

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    category: str
    limit: Decimal

    def is_over(self, spent):
        return spent < self.limit
```
````

````{attempt}
:id: budget-fixed-limit
:check: budget-class
:expect: but it must give True

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    category: str
    limit: Decimal

    def is_over(self, spent):
        return spent > 180
```
````

````{attempt}
:id: budget-or-equal
:check: budget-class
:expect: is equal to the limit

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    category: str
    limit: Decimal

    def is_over(self, spent):
        return spent >= self.limit
```
````

````{attempt}
:id: budget-no-object
:check: budget-class
:expect: The name food_budget does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    category: str
    limit: Decimal

    def is_over(self, spent):
        return spent > self.limit
```
````

````{attempt}
:id: budget-other-object
:check: budget-class
:expect: The name food_budget must refer to

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    category: str
    limit: Decimal

    def is_over(self, spent):
        return spent > self.limit

food_budget = Budget("transport", Decimal("60"))
```
````

````{attempt}
:id: budget-with-if
:check: budget-class
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Budget:
    category: str
    limit: float

    def is_over(self, spent):
        if spent > self.limit:
            return True
        return False

food_budget = Budget("food", Decimal("180.00"))
print(food_budget.is_over(Decimal("199.85")))
```
````

````{hint}
:title: Show me a solution
:unlock: "budget-class" in failed_checks or "budget-class" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-budget-class-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [budget-class-solution]
:run: true
@dataclass
class Budget:
    category: str
    limit: Decimal

    def is_over(self, spent):
        return spent > self.limit

food_budget = Budget("food", Decimal("180"))
print(food_budget)
print(food_budget.is_over(Decimal("199.85")))
```
````

```{verify}
:id: budget-class
:label: Your dataclass Budget has two fields and the method is_over
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed budget-class; cell-executed budget-class-solution
def _workshop_check():
    import contextlib, dataclasses, decimal, inspect, io
    if "Budget" not in globals():
        print("The class Budget does not exist yet. Write it under the comment in the new cell, and check the spelling of its name, which begins with a capital letter. Then hold Shift and press Enter to run the cell.")
        return False
    cls = globals()["Budget"]
    if not isinstance(cls, type):
        print("The name Budget exists, but its value is not a class. Begin with the line @dataclass, and under it the line class Budget: and then the two fields. Then run the cell again.")
        return False
    if not dataclasses.is_dataclass(cls):
        print("The class Budget is not a dataclass. Write the line @dataclass directly above the line class Budget: with no empty line between them. Inside the class you need only the two fields and the method is_over. Then run the cell again.")
        return False
    names = [field.name for field in dataclasses.fields(cls)]
    if not names:
        print("The dataclass Budget has no fields yet. A field is a line with a name, a colon and a type. Inside the class, write the line category: str and under it the line limit: Decimal. Then run the cell again.")
        return False
    if names != ["category", "limit"]:
        print(f"The fields of the class Budget are {' and '.join(names)}, but they must be category and limit, in that order. Inside the class, write the line category: str and under it the line limit: Decimal. Then run the cell again.")
        return False
    shown = io.StringIO()
    try:
        with contextlib.redirect_stdout(shown):
            food = cls("food", decimal.Decimal("180"))
            food_again = cls("food", decimal.Decimal("180"))
            transport = cls("transport", decimal.Decimal("60"))
            usual = (
                getattr(food, "category", None) == "food"
                and getattr(food, "limit", None) == decimal.Decimal("180")
                and repr(food) == "Budget(category='food', limit=Decimal('180'))"
                and (food == food_again) is True
                and (food == transport) is False
            )
    except Exception:
        usual = False
    if not usual:
        print("An object of your class Budget does not behave as an object of a dataclass with these two fields does. This happens when the class also has a method __init__, __repr__ or __eq__ that is written by hand. Remove those methods from the class. The decorator @dataclass writes all three. Then run the cell again.")
        return False
    if "is_over" not in vars(cls) and callable(globals().get("is_over")):
        print("The function is_over is outside the class Budget, so it is not a method of the class. Begin the def line with four spaces, and the line under it with eight spaces, so that the method is inside the class. Then run the cell again.")
        return False
    method = getattr(cls, "is_over", None)
    if not callable(method):
        print("The class Budget has no method is_over yet. Under the two fields, leave one empty line, and write the method. Its first line is def is_over(self, spent): with four spaces before the word def. Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(method).parameters)
    except (TypeError, ValueError):
        count = 2
    if count != 2:
        found = "no parameter" if count == 0 else "1 parameter" if count == 1 else f"{count} parameters"
        print(f"The method is_over must have exactly two parameters, self and spent, but it has {found}. The first parameter of every method is self. Make the first line of the method def is_over(self, spent): and run the cell again.")
        return False
    cases = [
        (food, "Budget('food', Decimal('180'))", decimal.Decimal("199.85"), True),
        (food, "Budget('food', Decimal('180'))", decimal.Decimal("138.15"), False),
        (transport, "Budget('transport', Decimal('60'))", decimal.Decimal("82.10"), True),
        (food, "Budget('food', Decimal('180'))", decimal.Decimal("180"), False),
    ]
    for thing, made, spent, expected in cases:
        call = f"{made}.is_over({spent!r})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = method(thing, spent)
        except Exception as error:
            print(f"The method is_over stopped with an error of the type {type(error).__name__} when the check called {call}. A NameError often means that the method uses limit where it must use self.limit. Inside a method, an attribute is always written with self and a dot before its name. Correct the method, and run the cell again.")
            return False
        if result is None and shown.getvalue().strip():
            print("The method is_over shows the result with print(), but it does not return it. The code that calls the method gets None. Replace print() in the method with the word return, and run the cell again.")
            return False
        if result is None:
            print(f"{call} gives None but it must give {expected}. A method with no return line gives None. Make the line of the method return spent > self.limit and run the cell again.")
            return False
        if not isinstance(result, bool):
            print(f"{call} gives {result!r} but it must give True or False. A comparison gives a boolean. Make the line of the method return spent > self.limit and run the cell again.")
            return False
        if result != expected and spent == thing.limit:
            print(f"{call} gives True but it must give False. Here the amount that was spent is equal to the limit, and that is not over the limit. Use the operator > and not the operator >= in the method. Then run the cell again.")
            return False
        if result != expected:
            print(f"{call} gives {result} but it must give {expected}. The method returns True when spent is more than the limit of this budget, which is self.limit. Make the line of the method return spent > self.limit and run the cell again.")
            return False
    if "food_budget" not in globals():
        print("The class Budget is correct. The name food_budget does not exist yet. Under the class, add a line that begins without spaces: food_budget = Budget(\"food\", Decimal(\"180\")). Then run the cell again.")
        return False
    mine = globals()["food_budget"]
    if not isinstance(mine, cls) or getattr(mine, "category", None) != "food" or getattr(mine, "limit", None) != 180:
        print("The class Budget is correct. The name food_budget must refer to an object of the class with the category food and the limit 180. Under the class, write the line food_budget = Budget(\"food\", Decimal(\"180\")) and run the whole cell again, so that the object is made after the class.")
        return False
    print("Correct. Your dataclass Budget has two fields and a method of your own, and Python wrote __init__, __repr__ and __eq__ for it.")
    return True
globals().pop("_workshop_check")()
```

Your class has six lines of code, and its objects can be made, printed and
compared. The decorator saved you the three special methods, and you
know what each of them does, because you have written them yourself.
