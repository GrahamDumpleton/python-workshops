---
title: Keys and values together
requires: [verify:menu-ran, verify:dishes-ran, verify:hot-cities]
---

# Keys and values together

Many loops over a dictionary need both parts of each pair: the key
and the value. A program that prints a menu needs the name of each
dish and its price.

You can do this with a loop over the keys, and get each value with
the square brackets. A dictionary also has a method that gives both
parts in each pass, named `.items()`. With `.items()`, the loop is
shorter and clearer.

Think again of a telephone list on paper. With `.items()`, you read
each complete line: the name and the number together.

## What .items() gives

The method `.items()` gives each pair of the dictionary as a
**tuple**. A tuple is a value that holds several values in order, in
the same way as a list, but a tuple cannot be changed. A tuple is
written with parentheses and commas, such as `("soup", 6)`.

Click the action below. It adds a cell that prints what `.items()`
gives in each pass, and runs it.

```{attempt}
:id: menu-not-run
:check: menu-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-menu
:title: Add a cell that prints each pair of a dictionary, and run it
:path: {{ notebook }}
:tags: [menu]
:run: true
menu = {"soup": 6, "rice": 4, "salad": 5}
for entry in menu.items():
    print(entry)
```

The output has three lines:

```
('soup', 6)
('rice', 4)
('salad', 5)
```

```{verify}
:id: menu-ran
:label: The loop printed each pair as a tuple
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed menu
if globals().get("menu") == {"soup": 6, "rice": 4, "salad": 5} and "entry" in globals():
    print("The cell ran. Each pass printed one tuple, which holds a key and its value.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("menu") == {"soup": 6, "rice": 4, "salad": 5} and "entry" in globals()
```

In each pass, the loop name `entry` refers to one tuple. The first
value in the tuple is the key, and the second value is the value that
belongs to the key. Python shows the strings with single quotes. That
is only how Python shows a string, and the string is the same.

## Two loop names

A tuple with two values is not convenient to use in the block. You
want one name for the key and one name for the value.

Python can give the values of a tuple to several names in one line.
This is called **unpacking**. For example, the line
`dish, price = ("soup", 6)` makes the name `dish` refer to `"soup"`,
and the name `price` refer to `6`.

A `for` loop can unpack too. Write two loop names, with a comma
between them. Before each pass, Python unpacks the tuple: the first
loop name refers to the key, and the second loop name refers to the
value.

```{attempt}
:id: dishes-not-run
:check: dishes-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-dishes
:title: Add a cell that uses two loop names, and run it
:path: {{ notebook }}
:tags: [dishes]
:run: true
menu = {"soup": 6, "rice": 4, "salad": 5}
for dish, price in menu.items():
    print(dish, "costs", price)
```

The output is:

```
soup costs 6
rice costs 4
salad costs 5
```

```{verify}
:id: dishes-ran
:label: The loop gave the key and the value to two names
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed dishes
if globals().get("menu") == {"soup": 6, "rice": 4, "salad": 5} and "dish" in globals() and "price" in globals():
    print("The cell ran. In each pass, the name dish referred to a key, and the name price referred to its value.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("menu") == {"soup": 6, "rice": 4, "salad": 5} and "dish" in globals() and "price" in globals()
```

## What happened

The line `for dish, price in menu.items():` has two loop names. Read
it as "for each dish and its price in the items of the menu".

| Pass | `dish` | `price` |
|------|--------|---------|
| 1 | `"soup"` | `6` |
| 2 | `"rice"` | `4` |
| 3 | `"salad"` | `5` |

The order of the two names matters. The key always comes first, and
the value always comes second. Choose loop names that say what the
key and the value are, such as `dish` and `price`.

You now know three loops over a dictionary:

- `for dish in menu:` gives the keys.

- `for price in menu.values():` gives the values.

- `for dish, price in menu.items():` gives each key together with its
  value.

## Your task

A dictionary holds the temperature at midday in four cities, in
degrees Celsius. Write a program that builds a list of the cities
where the temperature is above `30` degrees.

Your program must do these things, in this order:

1. Give the name `temperatures` to the dictionary
   `{"Cairo": 34, "Oslo": 12, "Lima": 19, "Delhi": 38}`.

2. Give the name `hot_cities` to an empty list: `[]`.

3. Use a `for` loop over `temperatures.items()`, with two loop names.
   Good loop names are `city` and `degrees`. In each pass, if the
   temperature is greater than `30`, add the city to the end of
   `hot_cities` with `.append()`.

4. After the loop, show `hot_cities` with `print()`.

When the program is correct, the output under the cell is:

```
['Cairo', 'Delhi']
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-temperatures
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [temperatures]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program. The
`if` line begins with four spaces, and the line under it begins with
eight spaces. Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
The first two lines are assignments: the dictionary, and then
`hot_cities = []`. The loop line is similar to the loop line in the
cell with the menu: `for city, degrees in temperatures.items():`.
```

```{hint}
:title: Hint: the block of the loop
The block has two lines. The first line begins with four spaces and
tests the value: `if degrees > 30:`. The second line begins with
eight spaces and adds the key to the list: `hot_cities.append(city)`.
```

```{hint}
:title: Hint: I see a ValueError
A `ValueError` on the loop line means that Python could not unpack.
That happens when the loop has two loop names but the loop is over
the dictionary and not over its items. Write
`temperatures.items()` in the loop line, with the parentheses.
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
:id: temperatures-not-started
:check: hot-cities
:expect: The name temperatures does not exist yet
```

````{attempt}
:id: temperatures-wrong-dictionary
:check: hot-cities
:expect: but it must refer to the dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
temperatures = {"Cairo": 34, "Oslo": 12}
```
````

````{attempt}
:id: temperatures-dictionary-only
:check: hot-cities
:expect: The name hot_cities does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
temperatures = {"Cairo": 34, "Oslo": 12, "Lima": 19, "Delhi": 38}
```
````

````{attempt}
:id: temperatures-not-a-list
:check: hot-cities
:expect: but it must refer to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
temperatures = {"Cairo": 34, "Oslo": 12, "Lima": 19, "Delhi": 38}
hot_cities = 0
for city, degrees in temperatures.items():
    if degrees > 30:
        hot_cities = hot_cities + 1
print(hot_cities)
```
````

````{attempt}
:id: temperatures-empty
:check: hot-cities
:expect: The list hot_cities is still empty

```{cell-insert}
:path: {{ notebook }}
:run: true
temperatures = {"Cairo": 34, "Oslo": 12, "Lima": 19, "Delhi": 38}
hot_cities = []
for city, degrees in temperatures.items():
    if degrees > 30:
        print(city)
print(hot_cities)
```
````

````{attempt}
:id: temperatures-appended-values
:check: hot-cities
:expect: The list holds the temperatures, not the cities

```{cell-insert}
:path: {{ notebook }}
:run: true
temperatures = {"Cairo": 34, "Oslo": 12, "Lima": 19, "Delhi": 38}
hot_cities = []
for city, degrees in temperatures.items():
    if degrees > 30:
        hot_cities.append(degrees)
print(hot_cities)
```
````

````{attempt}
:id: temperatures-every-city
:check: hot-cities
:expect: That is every city in the dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
temperatures = {"Cairo": 34, "Oslo": 12, "Lima": 19, "Delhi": 38}
hot_cities = []
for city, degrees in temperatures.items():
    if degrees > 30:
        print(city)
    hot_cities.append(city)
print(hot_cities)
```
````

````{attempt}
:id: temperatures-last-only
:check: hot-cities
:expect: That is only the last city

```{cell-insert}
:path: {{ notebook }}
:run: true
temperatures = {"Cairo": 34, "Oslo": 12, "Lima": 19, "Delhi": 38}
for city, degrees in temperatures.items():
    hot_cities = []
    if degrees > 30:
        hot_cities.append(city)
print(hot_cities)
```
````

````{attempt}
:id: temperatures-cold-cities
:check: hot-cities
:expect: Those are the cities where the temperature is 30 degrees or less

```{cell-insert}
:path: {{ notebook }}
:run: true
temperatures = {"Cairo": 34, "Oslo": 12, "Lima": 19, "Delhi": 38}
hot_cities = []
for city, degrees in temperatures.items():
    if degrees < 30:
        hot_cities.append(city)
print(hot_cities)
```
````

````{attempt}
:id: temperatures-wrong-limit
:check: hot-cities
:expect: but it must refer to ['Cairo', 'Delhi']

```{cell-insert}
:path: {{ notebook }}
:run: true
temperatures = {"Cairo": 34, "Oslo": 12, "Lima": 19, "Delhi": 38}
hot_cities = []
for city, degrees in temperatures.items():
    if degrees > 15:
        hot_cities.append(city)
print(hot_cities)
```
````

````{attempt}
:id: temperatures-with-keys
:check: hot-cities
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
temperatures = {"Cairo": 34, "Oslo": 12, "Lima": 19, "Delhi": 38}
hot_cities = []
for place_name in temperatures:
    if temperatures[place_name] > 30:
        hot_cities.append(place_name)
print(hot_cities)
```
````

````{hint}
:title: Show me a solution
:unlock: "hot-cities" in failed_checks or "hot-cities" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-temperatures-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [temperatures-solution]
:run: true
temperatures = {"Cairo": 34, "Oslo": 12, "Lima": 19, "Delhi": 38}
hot_cities = []
for city, degrees in temperatures.items():
    if degrees > 30:
        hot_cities.append(city)
print(hot_cities)
```
````

```{verify}
:id: hot-cities
:label: Your loop finds the cities above 30 degrees
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed temperatures; cell-executed temperatures-solution
if "temperatures" not in globals():
    print("The name temperatures does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the dictionary: temperatures = {\"Cairo\": 34, \"Oslo\": 12, \"Lima\": 19, \"Delhi\": 38}. Then hold Shift and press Enter to run the cell.")
elif temperatures != {"Cairo": 34, "Oslo": 12, "Lima": 19, "Delhi": 38}:
    print(f"The name temperatures refers to {temperatures!r}", "but it must refer to the dictionary {\"Cairo\": 34, \"Oslo\": 12, \"Lima\": 19, \"Delhi\": 38}. Correct the first line of your program. Then run the cell again.")
elif "hot_cities" not in globals():
    print("The name hot_cities does not exist yet. Add a line before the loop that makes an empty list: hot_cities = []. Check the spelling. Then run the cell again.")
elif not isinstance(hot_cities, list):
    print(f"The name hot_cities refers to {hot_cities!r} but it must refer to a list. Start with an empty list before the loop: hot_cities = []. Inside the loop, add each hot city to the list with hot_cities.append(city). Then run the cell again.")
elif hot_cities == ["Cairo", "Delhi"]:
    print("Correct. Your loop used each key together with its value, and built the list of hot cities: ['Cairo', 'Delhi'].")
elif hot_cities == []:
    print("The list hot_cities is still empty, so the loop does not add anything to it. Inside the loop, write if degrees > 30 with four spaces, and under it a line with eight spaces that adds the city: hot_cities.append(city). If the cell showed a ValueError, write temperatures.items() in the loop line. Then run the cell again.")
elif hot_cities == [34, 38]:
    print("The name hot_cities refers to [34, 38]. The list holds the temperatures, not the cities. The first loop name refers to the key, which is the city. Give that name to append: hot_cities.append(city). Then run the cell again.")
elif hot_cities == ["Cairo", "Oslo", "Lima", "Delhi"]:
    print("The name hot_cities refers to a list of all four cities. That is every city in the dictionary, so the line with append runs in every pass. It must be inside the block of the if: write if degrees > 30 with four spaces, and give the line with append eight spaces. Then run the cell again.")
elif hot_cities == ["Delhi"]:
    print("The name hot_cities refers to ['Delhi']. That is only the last city. There are two usual reasons. The line hot_cities = [] may be inside the loop: move it before the loop, so that it runs one time. Or the if may begin without spaces, so that it runs one time after the loop: give it four spaces. Then run the cell again.")
elif hot_cities == ["Oslo", "Lima"]:
    print("The name hot_cities refers to ['Oslo', 'Lima']. Those are the cities where the temperature is 30 degrees or less. The comparison must test whether the temperature is greater than 30: if degrees > 30. Then run the cell again.")
else:
    print(f"The name hot_cities refers to {hot_cities!r} but it must refer to ['Cairo', 'Delhi']. The if line must test whether the value is greater than 30, and the line under it must add the key: hot_cities.append(city). Then run the cell again.")
"temperatures" in globals() and "hot_cities" in globals() and temperatures == {"Cairo": 34, "Oslo": 12, "Lima": 19, "Delhi": 38} and hot_cities == ["Cairo", "Delhi"]
```
