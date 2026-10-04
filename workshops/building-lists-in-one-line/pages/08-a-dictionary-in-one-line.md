---
title: A dictionary in one line
requires: [verify:pet-letters-ran, quiz:predict-menu, verify:menu-ran, verify:first-letters-dictionary]
---

# A dictionary in one line

A **dictionary** is a value that holds pairs. Each pair has a **key**
and a **value**, and you use the key to find the value. For example,
in the dictionary `{"soup": 4, "rice": 3}` the key `"soup"` has the
value `4`, so `menu["soup"]` is `4` when `menu` refers to this
dictionary.

A **dictionary comprehension** is one line of code that builds a new
dictionary. It has the same form as a list comprehension, with two
differences. It has curly brackets around it, and not square brackets.
Its first part is a key and a value with a colon between them, and
not one expression.

A dictionary comprehension exists for the same reason as a list
comprehension. A loop that builds a dictionary always starts with an
empty dictionary, `{}`, and adds one pair in each pass. The
dictionary comprehension does not have the parts that are always the
same.

Think of a person at a post office who has a row of parcels. The
person weighs each parcel, and writes one line in a table: the name on
the parcel, and its weight. The row of parcels is the list. The table
holds pairs, and each pair is made from one parcel.

Here is a loop that builds a dictionary from a list of animals. Each
key is the name of an animal, and each value is the number of letters
in that name. The line `letter_counts[pet] = len(pet)` adds one pair
to the dictionary: the key is in the square brackets, and the value
is after the equals sign.

```python
pets = ["cat", "horse", "ox"]
letter_counts = {}
for pet in pets:
    letter_counts[pet] = len(pet)
print(letter_counts)
```

Click the action below. It adds a cell that does the same work with a
dictionary comprehension, and runs it.

```{attempt}
:id: pet-letters-not-run
:check: pet-letters-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-pet-letters
:title: Add a cell that builds a dictionary with a dictionary comprehension, and run it
:path: {{ notebook }}
:tags: [pet-letters]
:run: true
pets = ["cat", "horse", "ox"]
pet_letters = {pet: len(pet) for pet in pets}
print(pet_letters)
```

The output is:

```
{'cat': 3, 'horse': 5, 'ox': 2}
```

```{verify}
:id: pet-letters-ran
:label: The dictionary comprehension built the dictionary
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed pet-letters
if globals().get("pet_letters") == {"cat": 3, "horse": 5, "ox": 2}:
    print("The cell ran. The name pet_letters refers to a new dictionary with three pairs.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("pet_letters") == {"cat": 3, "horse": 5, "ox": 2}
```

## What happened

Look at the dictionary comprehension from the left to the right:

```python
{pet: len(pet) for pet in pets}
```

- The curly brackets `{` and `}` say that the result is a dictionary.

- `pet: len(pet)` says what each new pair is. The expression before
  the colon is the key. The expression after the colon is the value.

- `for pet in pets` says where the items come from, as in a list
  comprehension.

Python makes one pass for each item of `pets`, and adds one pair to
the new dictionary in each pass.

## From a dictionary to a dictionary

A dictionary comprehension can also take its items from another
dictionary. For this you need both the key and the value of each
pair. The method `.items()` of a dictionary gives the pairs one after
another, and a `for` loop can give two names to each pair: the first
name refers to the key, and the second name refers to the value.

This loop doubles every price of a menu:

```python
menu = {"soup": 4, "rice": 3}
menu_double = {}
for dish, cost in menu.items():
    menu_double[dish] = cost * 2
print(menu_double["rice"])
```

Here is the same work with a dictionary comprehension. Look at this
cell. Do not run it yet.

```python
menu = {"soup": 4, "rice": 3}
menu_double = {dish: cost * 2 for dish, cost in menu.items()}
print(menu_double["rice"])
```

```{quiz}
:id: predict-menu
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "6"
wrong:
  - { text: "3", explanation: "`3` is the value of the key `\"rice\"` in the dictionary `menu`. The cell shows the value from the new dictionary `menu_double`, where each value is `cost * 2`." }
  - { text: "8", explanation: "`8` is the new value of the key `\"soup\"`. The last line shows the value of the key `\"rice\"`." }
  - { text: "rice", explanation: "`\"rice\"` is the key. The square brackets with a key give the value that belongs to that key." }
  - { pattern: '\{.*\}', explanation: "The last line does not show the whole dictionary. It shows only the value that belongs to the key `\"rice\"`." }
otherwise: "The new dictionary has the same keys as `menu`. Each value is the old value multiplied by 2. Which value belongs to the key `\"rice\"`?"
explanation: "The dictionary comprehension makes one pair for each pair of `menu`. The key stays the same, and the value is `cost * 2`. So `menu_double` is `{'soup': 8, 'rice': 6}`, and the key `\"rice\"` has the value `6`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: menu-not-run
:check: menu-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-menu
:title: Add the cell that doubles every price of the menu, and run it
:path: {{ notebook }}
:tags: [menu]
:run: true
menu = {"soup": 4, "rice": 3}
menu_double = {dish: cost * 2 for dish, cost in menu.items()}
print(menu_double["rice"])
```

```{verify}
:id: menu-ran
:label: The dictionary comprehension doubled every price
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed menu
if globals().get("menu_double") == {"soup": 8, "rice": 6}:
    print("The cell ran. The name menu_double refers to a new dictionary, in which every price is doubled.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("menu_double") == {"soup": 8, "rice": 6}
```

The dictionary `menu` did not change. As with a list comprehension,
the result is a new value. A dictionary comprehension can also have a
condition at its end, with the word `if`, and it works in the same
way as in a list comprehension.

## Your task

A language school teaches Hindi, Thai and Swahili. The school wants a
dictionary that gives the first letter of the name of each language,
to print on the doors of the classrooms.

This loop does the work. Remember that `language[0]` is the first
character of the string `language`, because Python counts from 0.

```python
languages = ["Hindi", "Thai", "Swahili"]
first_letters = {}
for language in languages:
    first_letters[language] = language[0]
print(first_letters)
```

Write a program that does the same work with a dictionary
comprehension. Your program must do these three things, in this
order:

1. Give the name `languages` to the list
   `["Hindi", "Thai", "Swahili"]`.

2. Give the name `first_letters` to a dictionary comprehension. Each
   key is an item of `languages`. Each value is the first character of
   that item. You can choose the loop name. A good loop name is
   `language`.

3. Show the value of `first_letters` with `print()`.

When the program is correct, the output under the cell is:

```
{'Hindi': 'H', 'Thai': 'T', 'Swahili': 'S'}
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-first-letters
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [first-letters]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Look at the cell with the animals. Your program has the same three
lines: the list, the dictionary comprehension, and the `print()`
line. The dictionary comprehension has curly brackets around it.
```

```{hint}
:title: Hint: the key and the value
The key is the loop name: `language`. The value is the first
character: `language[0]`. Write the key, a colon, and the value. Then
write the `for` part:
`first_letters = {language: ... for language in languages}`. Replace
the three dots with the value.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: first-letters-not-started
:check: first-letters-dictionary
:expect: The name languages does not exist yet
```

````{attempt}
:id: first-letters-wrong-languages
:check: first-letters-dictionary
:expect: The name languages refers to ['Hindi', 'Thai']

```{cell-insert}
:path: {{ notebook }}
:run: true
languages = ["Hindi", "Thai"]
```
````

````{attempt}
:id: first-letters-languages-only
:check: first-letters-dictionary
:expect: The name first_letters does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
languages = ["Hindi", "Thai", "Swahili"]
```
````

````{attempt}
:id: first-letters-a-list
:check: first-letters-dictionary
:expect: which is a list

```{cell-insert}
:path: {{ notebook }}
:run: true
languages = ["Hindi", "Thai", "Swahili"]
first_letters = [language[0] for language in languages]
print(first_letters)
```
````

````{attempt}
:id: first-letters-a-set
:check: first-letters-dictionary
:expect: The name first_letters refers to a set

```{cell-insert}
:path: {{ notebook }}
:run: true
languages = ["Hindi", "Thai", "Swahili"]
first_letters = {language[0] for language in languages}
print(sorted(first_letters))
```
````

````{attempt}
:id: first-letters-a-string
:check: first-letters-dictionary
:expect: which is not a dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
languages = ["Hindi", "Thai", "Swahili"]
first_letters = languages[0][0]
print(first_letters)
```
````

````{attempt}
:id: first-letters-swapped
:check: first-letters-dictionary
:expect: The keys and the values are in the wrong places

```{cell-insert}
:path: {{ notebook }}
:run: true
languages = ["Hindi", "Thai", "Swahili"]
first_letters = {language[0]: language for language in languages}
print(first_letters)
```
````

````{attempt}
:id: first-letters-wrong-keys
:check: first-letters-dictionary
:expect: The keys of first_letters are

```{cell-insert}
:path: {{ notebook }}
:run: true
languages = ["Hindi", "Thai", "Swahili"]
first_letters = {language.lower(): language[0] for language in languages}
print(first_letters)
```
````

````{attempt}
:id: first-letters-wrong-values
:check: first-letters-dictionary
:expect: The keys of first_letters are correct, but the dictionary is {'Hindi': 'i'

```{cell-insert}
:path: {{ notebook }}
:run: true
languages = ["Hindi", "Thai", "Swahili"]
first_letters = {language: language[1] for language in languages}
print(first_letters)
```
````

````{attempt}
:id: first-letters-other-way
:check: first-letters-dictionary
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
languages = ["Hindi", "Thai", "Swahili"]
first_letters = {name: name[:1] for name in languages}
print(first_letters)
```
````

````{hint}
:title: Show me a solution
:unlock: "first-letters-dictionary" in failed_checks or "first-letters-dictionary" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-first-letters-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [first-letters-solution]
:run: true
languages = ["Hindi", "Thai", "Swahili"]
first_letters = {language: language[0] for language in languages}
print(first_letters)
```
````

```{verify}
:id: first-letters-dictionary
:label: Your dictionary comprehension gives the first letter of each language
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed first-letters; cell-executed first-letters-solution
if "languages" not in globals():
    print('The name languages does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the list: languages = ["Hindi", "Thai", "Swahili"]. Then hold Shift and press Enter to run the cell.')
elif languages != ["Hindi", "Thai", "Swahili"]:
    print(f'The name languages refers to {languages!r} but it must refer to the list ["Hindi", "Thai", "Swahili"]. Correct the first line of your program. Then run the cell again.')
elif "first_letters" not in globals():
    print("The name first_letters does not exist yet. Add a line that gives the name first_letters to a dictionary comprehension. Check the spelling. Then run the cell again.")
elif type(first_letters) is list:
    print(f"The name first_letters refers to {first_letters!r}, which is a list. Square brackets make a list comprehension. A dictionary comprehension has curly brackets around it, and a key, a colon and a value at its start: language: language[0]. Then run the cell again.")
elif type(first_letters) is set:
    print("The name first_letters refers to a set, and not to a dictionary. A set is another kind of value that uses curly brackets. Curly brackets with one expression at the start make a set. A dictionary comprehension needs a key, a colon and a value at its start: language: language[0]. Then run the cell again.")
elif type(first_letters) is not dict:
    print(f"The name first_letters refers to {first_letters!r}, which is not a dictionary. A dictionary comprehension has curly brackets around it, and the words for and in inside the brackets. Then run the cell again.")
elif first_letters == {"Hindi": "H", "Thai": "T", "Swahili": "S"}:
    print("Correct. The name first_letters refers to a dictionary with three pairs. Each key is a language, and each value is its first letter.")
elif first_letters == {"H": "Hindi", "T": "Thai", "S": "Swahili"}:
    print("The keys and the values are in the wrong places. The key is before the colon, and the value is after the colon. The key must be the language, and the value must be its first letter: language: language[0]. Then run the cell again.")
elif sorted(first_letters, key=str) != ["Hindi", "Swahili", "Thai"]:
    print(f"The keys of first_letters are {list(first_letters)!r} but they must be the three items of languages. The key is the expression before the colon. Write the loop name there, without a change. Then run the cell again.")
else:
    print(f"The keys of first_letters are correct, but the dictionary is {first_letters!r}, and each value must be the first letter of its key. The value is the expression after the colon. Write language[0] there, which is the first character of the string. Then run the cell again.")
"languages" in globals() and "first_letters" in globals() and languages == ["Hindi", "Thai", "Swahili"] and type(first_letters) is dict and first_letters == {"Hindi": "H", "Thai": "T", "Swahili": "S"}
```
