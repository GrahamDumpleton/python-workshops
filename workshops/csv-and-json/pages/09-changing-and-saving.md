---
title: Changing and saving
requires: [verify:trip-written, verify:new-budgets-file]
---

# Changing and saving

A program that has read data from a JSON file can change the data,
and then save it. The values are ordinary Python dictionaries and
lists, so you change them in the ways that you already know. To save
them, the program writes them to a file as JSON.

The function for this is `json.dump()`. You give it two things: the
value to save, and a file that is open for writing. It writes the
value to the file as JSON text. It is the reverse of `json.load()`:
`json.load()` takes text from a file and gives Python values, and
`json.dump()` takes Python values and puts text into a file.

Think of a notebook where you keep a list of telephone numbers. You
read the list, you correct a number, and you write the list down
again so that the correction is not lost.

Click the action below. It adds a cell that makes a dictionary and
saves it in a JSON file, and runs it.

```{attempt}
:id: trip-not-run
:check: trip-written
:expect: The file trip.json does not exist yet
```

```{cell-insert}
:id: insert-trip
:title: Add a cell that writes a JSON file, and run it
:path: {{ notebook }}
:tags: [trip]
:run: true
trip = {"city": "Nairobi", "days": 4, "places": ["museum", "market"], "booked": True}
with open("trip.json", "w") as file:
    json.dump(trip, file, indent=2)
print("The file trip.json is written.")
```

The output is:

```
The file trip.json is written.
```

```{verify}
:id: trip-written
:label: The cell wrote the file trip.json
:substrate: contents
:trigger: cell-executed trip
:message: The file trip.json does not exist yet. Click the action above to add the cell and run it.
contains trip.json "city": "Nairobi"
```

Click the action below to see the file under your notebook.

```{file-open}
:id: open-trip
:title: Show the file trip.json
:path: trip.json
:area: data
```

The file holds this text:

```json
{
  "city": "Nairobi",
  "days": 4,
  "places": [
    "museum",
    "market"
  ],
  "booked": true
}
```

## What happened

| Line | What Python did |
|------|-----------------|
| `trip = {...}` | made a dictionary that holds a string, a number, a list and a boolean |
| `with open("trip.json", "w") as file:` | made the file, opened it for writing, and gave the open file the name `file` |
| `json.dump(trip, file, indent=2)` | wrote the dictionary to the file as JSON text |

Compare the file with the dictionary in the cell:

- The number `4` is still a number, and the list is still a list
  inside the dictionary. JSON kept the form of the data.

- The Python value `True` became `true`, which is how JSON writes it.
  `json.dump()` made that change.

The call of `json.dump()` has a third argument, `indent=2`. It is a
keyword argument: an argument that you give by its name. It tells
`json.dump()` to write each pair on a line of its own, and to begin
each line that is inside a pair of brackets with two more spaces.
Without `indent=2`, the function writes everything on one line:

```
{"city": "Nairobi", "days": 4, "places": ["museum", "market"], "booked": true}
```

Both forms hold the same data, and a program reads both in the same
way. A person reads the form with `indent=2` more quickly.

## Your task

Mariam finds that her budget for food is too small. She also wants to
save some money each month. She changes her budgets in two ways:

- The budget for `food` becomes `200`.

- There is a new category, `savings`, with a budget of `100`.

Write a program that reads the budgets, makes the two changes, and
saves the result in a new file with the name `budgets-new.json`.

The program must not write to the file `budgets.json`. That file
stays as it is, so that every cell of your notebook gives the same
result when you run it again. A program that changes data often
saves it under a new name, so that the old data is not lost when
something goes wrong.

Your program must do these things:

1. Open the file `budgets.json` in a `with` block, and read it with
   `json.load()`. Give the name `new_budgets` to the dictionary.

2. Change the value of the key `"food"` to `200`.

3. Add the key `"savings"` with the value `100`.

4. Open the file `budgets-new.json` for writing, with `"w"`, in a
   second `with` block. Inside the block, save the dictionary with
   `json.dump()` and `indent=2`.

5. Show the dictionary with `print(new_budgets)`.

When the program is correct, the output under the cell is:

```
{'rent': 650, 'food': 200, 'transport': 60, 'phone': 20, 'clothes': 50, 'hobbies': 30, 'savings': 100}
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-new-budgets
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [new-budgets]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
The first two lines read the file:
`with open("budgets.json") as file:` and, with four spaces at its
start, `new_budgets = json.load(file)`. The next two lines begin
without spaces. Each one is an assignment that has the dictionary and
a key on its left side, such as `new_budgets["food"] = 200`.
```

```{hint}
:title: Hint: saving the dictionary
The lines that save have the same form as the cell above that writes
`trip.json`: `with open("budgets-new.json", "w") as file:` and, with
four spaces at its start,
`json.dump(new_budgets, file, indent=2)`. Check the name of the file:
it must be `budgets-new.json`.
```

````{hint}
:title: I wrote to budgets.json by mistake
If your program opened `budgets.json` with `"w"`, the file has
changed. The action below runs a few lines of Python that write the file
again as it was at the start. Click it, correct the name of the file in your program, and
run your cell again.

```{kernel-execute}
:id: restore-budgets
:title: Put the file budgets.json back as it was
:path: {{ notebook }}
with open("budgets.json", "w") as file:
    file.write("""{
  "rent": 650,
  "food": 180,
  "transport": 60,
  "phone": 20,
  "clothes": 50,
  "hobbies": 30
}
""")
```
````

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: new-budgets-not-started
:check: new-budgets-file
:expect: The file budgets-new.json does not exist yet
```

````{attempt}
:id: new-budgets-old-file
:check: new-budgets-file
:expect: The file budgets.json has changed

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("budgets.json") as file:
    new_budgets = json.load(file)
new_budgets["food"] = 200
new_budgets["savings"] = 100
with open("budgets.json", "w") as file:
    json.dump(new_budgets, file, indent=2)
print(new_budgets)
```
````

````{attempt}
:id: new-budgets-not-json
:check: new-budgets-file
:expect: does not hold JSON

```{kernel-execute}
:path: {{ notebook }}
with open("budgets.json", "w") as file:
    file.write("""{
  "rent": 650,
  "food": 180,
  "transport": 60,
  "phone": 20,
  "clothes": 50,
  "hobbies": 30
}
""")
```

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("budgets.json") as file:
    new_budgets = json.load(file)
new_budgets["food"] = 200
new_budgets["savings"] = 100
with open("budgets-new.json", "w") as file:
    file.write(f"{new_budgets}")
print(new_budgets)
```
````

````{attempt}
:id: new-budgets-a-list
:check: new-budgets-file
:expect: does not hold a dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("budgets-new.json", "w") as file:
    json.dump(["food", 200, "savings", 100], file, indent=2)
```
````

````{attempt}
:id: new-budgets-unchanged
:check: new-budgets-file
:expect: holds the same budgets as the file budgets.json

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("budgets.json") as file:
    new_budgets = json.load(file)
with open("budgets-new.json", "w") as file:
    json.dump(new_budgets, file, indent=2)
new_budgets["food"] = 200
new_budgets["savings"] = 100
print(new_budgets)
```
````

````{attempt}
:id: new-budgets-food-old
:check: new-budgets-file
:expect: the budget for food is 180

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("budgets.json") as file:
    new_budgets = json.load(file)
new_budgets["savings"] = 100
with open("budgets-new.json", "w") as file:
    json.dump(new_budgets, file, indent=2)
print(new_budgets)
```
````

````{attempt}
:id: new-budgets-no-savings
:check: new-budgets-file
:expect: has no key savings

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("budgets.json") as file:
    new_budgets = json.load(file)
new_budgets["food"] = 200
new_budgets["Savings"] = 100
with open("budgets-new.json", "w") as file:
    json.dump(new_budgets, file, indent=2)
print(new_budgets)
```
````

````{attempt}
:id: new-budgets-savings-text
:check: new-budgets-file
:expect: the budget for savings is '100'

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("budgets.json") as file:
    new_budgets = json.load(file)
new_budgets["food"] = 200
new_budgets["savings"] = "100"
with open("budgets-new.json", "w") as file:
    json.dump(new_budgets, file, indent=2)
print(new_budgets)
```
````

````{attempt}
:id: new-budgets-other-change
:check: new-budgets-file
:expect: the budget for rent is 700

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("budgets.json") as file:
    new_budgets = json.load(file)
new_budgets["food"] = 200
new_budgets["savings"] = 100
new_budgets["rent"] = 700
with open("budgets-new.json", "w") as file:
    json.dump(new_budgets, file, indent=2)
print(new_budgets)
```
````

````{attempt}
:id: new-budgets-extra-key
:check: new-budgets-file
:expect: has a key that the task does not ask for

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("budgets.json") as file:
    new_budgets = json.load(file)
new_budgets["food"] = 200
new_budgets["savings"] = 100
new_budgets["travel"] = 40
with open("budgets-new.json", "w") as file:
    json.dump(new_budgets, file, indent=2)
print(new_budgets)
```
````

````{attempt}
:id: new-budgets-one-line
:check: new-budgets-file
:expect: is all on one line

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("budgets.json") as file:
    new_budgets = json.load(file)
new_budgets["food"] = 200
new_budgets["savings"] = 100
with open("budgets-new.json", "w") as file:
    json.dump(new_budgets, file)
print(new_budgets)
```
````

````{hint}
:title: Show me a solution
:unlock: "new-budgets-file" in failed_checks or "new-budgets-file" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-new-budgets-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [new-budgets-solution]
:run: true
with open("budgets.json") as file:
    new_budgets = json.load(file)
new_budgets["food"] = 200
new_budgets["savings"] = 100
with open("budgets-new.json", "w") as file:
    json.dump(new_budgets, file, indent=2)
print(new_budgets)
```
````

```{verify}
:id: new-budgets-file
:label: Your program saved the changed budgets in budgets-new.json
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed new-budgets; cell-executed new-budgets-solution
def _workshop_check():
    import json
    original = {"rent": 650, "food": 180, "transport": 60, "phone": 20, "clothes": 50, "hobbies": 30}
    try:
        with open("budgets.json") as file:
            shipped = json.load(file)
    except (OSError, ValueError):
        shipped = None
    if shipped != original:
        print("The file budgets.json has changed. Your program must read that file, but it must not write to it. Open the box with the title I wrote to budgets.json by mistake, and click the action in it to put the file back. Then open the file budgets-new.json for writing in your program: with open(\"budgets-new.json\", \"w\") as file: Then run the cell again.")
        return False
    try:
        with open("budgets-new.json") as file:
            text = file.read()
    except OSError:
        print("The file budgets-new.json does not exist yet. Write your program under the comment in the new cell. The lines that save the dictionary are with open(\"budgets-new.json\", \"w\") as file: and under it json.dump(new_budgets, file, indent=2). Check the spelling of the name of the file. Then hold Shift and press Enter to run the cell.")
        return False
    try:
        saved = json.loads(text)
    except ValueError:
        print("The file budgets-new.json exists, but it does not hold JSON. Do not write the dictionary with write(). Save it with the function of the module json, inside the with block: json.dump(new_budgets, file, indent=2). Then run the cell again.")
        return False
    if type(saved) is not dict:
        print("The file budgets-new.json does not hold a dictionary. The first argument of json.dump() must be the dictionary of the budgets: json.dump(new_budgets, file, indent=2). Then run the cell again.")
        return False
    if saved == original:
        print("The file budgets-new.json holds the same budgets as the file budgets.json. Make the two changes before the lines that save the dictionary: new_budgets[\"food\"] = 200 and new_budgets[\"savings\"] = 100. Then run the cell again.")
        return False
    if "savings" not in saved:
        print("The dictionary in the file budgets-new.json has no key savings. Add the new category before the lines that save the dictionary, with the key in small letters: new_budgets[\"savings\"] = 100. Then run the cell again.")
        return False
    expected = dict(original)
    expected["food"] = 200
    expected["savings"] = 100
    for key in expected:
        if key not in saved:
            print(f"The dictionary in the file budgets-new.json has no key {key}. The program must keep every budget that it read from budgets.json. Read the file into new_budgets, change only the two values, and save new_budgets. Then run the cell again.")
            return False
        if saved[key] != expected[key] or type(saved[key]) is not int:
            print(f"In the file budgets-new.json, the budget for {key} is {saved[key]!r} but it must be the number {expected[key]}. The program must change only two values, each with a number: new_budgets[\"food\"] = 200 and new_budgets[\"savings\"] = 100. Then run the cell again.")
            return False
    if len(saved) != len(expected):
        print("The dictionary in the file budgets-new.json has a key that the task does not ask for. The keys must be the six categories of budgets.json and the new key savings. A key with a different spelling is a different key. Then run the cell again.")
        return False
    if "\n" not in text.strip():
        print("The file budgets-new.json holds the right budgets, but the text is all on one line. Add the keyword argument indent=2 to the call, so that a person can read the file: json.dump(new_budgets, file, indent=2). Then run the cell again.")
        return False
    print("Correct. The file budgets-new.json holds the seven budgets, with 200 for food and 100 for savings. The file budgets.json is not changed.")
    return True
globals().pop("_workshop_check")()
```

Click the action below to see the file that your program wrote.

```{file-open}
:id: open-new-budgets
:title: Show the file budgets-new.json
:path: budgets-new.json
:area: data
```

The file has seven pairs, each on a line of its own. The file
`budgets.json` still holds the six budgets from the start.
