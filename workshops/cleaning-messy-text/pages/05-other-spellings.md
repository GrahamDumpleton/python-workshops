---
title: Other words for one category
requires: [verify:tidy-categories-shown, verify:spellings-made, quiz:predict-get, verify:clean-category]
---

# Other words for one category

Look at what `strip()` and `lower()` do to the 20 spellings together.
The cell below collects the categories in a set again, and this time
it strips each category and makes its letters small first.

```{attempt}
:id: tidy-categories-not-shown
:check: tidy-categories-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-tidy-categories
:title: Add a cell that collects the categories after strip() and lower(), and run it
:path: {{ notebook }}
:tags: [tidy-categories]
:run: true
tidy_categories = set()
for row in raw_rows[1:]:
    if len(row) == 4:
        tidy_categories.add(row[3].strip().lower())

print(len(tidy_categories))
print(sorted(tidy_categories))
```

The output is:

```
8
['clothes', 'food', 'groceries', 'hobbies', 'phone', 'rent', 'transport', 'travel']
```

```{verify}
:id: tidy-categories-shown
:label: The cell collected the categories after strip() and lower()
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed tidy-categories
if isinstance(globals().get("tidy_categories"), set) and len(globals().get("tidy_categories")) == 8:
    print("The cell ran. After strip() and lower(), 8 different categories are left.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("tidy_categories"), set) and len(globals().get("tidy_categories")) == 8
```

Two methods turned 20 spellings into 8. The clean data has 6
categories, so two spellings are still wrong: `groceries`, which
means `food`, and `travel`, which means `transport`.

## A dictionary of other spellings

No method of a string can know that `groceries` means `food`. That is
a fact about Mariam's habits, and your program must be told it. A
**dictionary** is the tool for this. A dictionary holds pairs of a
**key** and a **value**, and it finds a value by its key. Here each
key is another spelling, and its value is the correct category.

Think of the index at the back of a book about cooking. Under "groceries"
it says "see food". For most words the index has no such note, and
you use the word as it is.

The method `get()` of a dictionary works in that way. It takes two
arguments: the key to look up, and the **default**, which is the value
to give back when the key does not exist. The new idea on this page is
to give the same word two times: `spellings.get(word, word)`. This
means: "Look up `word`. If the dictionary has it as a key, give me the
value. If not, give me `word` itself."

```{attempt}
:id: spellings-not-made
:check: spellings-made
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-spellings
:title: Add a cell that makes the dictionary of other spellings and uses get, and run it
:path: {{ notebook }}
:tags: [spellings]
:run: true
spellings = {"groceries": "food", "travel": "transport"}

print(spellings.get("groceries", "groceries"))
print(spellings.get("rent", "rent"))
```

The output is:

```
food
rent
```

```{verify}
:id: spellings-made
:label: The dictionary of other spellings exists
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed spellings
if globals().get("spellings") == {"groceries": "food", "travel": "transport"}:
    print("The cell ran. The dictionary spellings gives food for groceries, and transport for travel.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("spellings") == {"groceries": "food", "travel": "transport"}
```

The key `"groceries"` exists, so `get()` gives its value, `food`. The
key `"rent"` does not exist, so `get()` gives the default. The default
is `"rent"`, the same word. A word that is correct already comes back
as it is.

Square brackets do not work here. `spellings["rent"]` stops with a
`KeyError`, because `"rent"` is not a key of the dictionary.

```{quiz}
:id: predict-get
:type: text
:title: Predict the result
question: "What does `print(spellings.get(\"travel\", \"travel\"))` show?"
answer: "transport"
wrong:
  - { text: "travel", explanation: "`get()` gives the default only when the key does not exist. The dictionary has the key `\"travel\"`, so `get()` gives its value." }
  - { text: "None", explanation: "`get()` gives `None` only when the key does not exist and there is no default. Here the key `\"travel\"` exists." }
  - { text: "\"transport\"", explanation: "The word is correct. `print()` shows a string without the quotes, so type it without the quotes." }
  - { text: "'transport'", explanation: "The word is correct. `print()` shows a string without the quotes, so type it without the quotes." }
otherwise: "Look at the dictionary `spellings` in the cell above. Is `\"travel\"` one of its keys? If it is, `get()` gives the value of that key."
explanation: "`\"travel\"` is a key of the dictionary, and its value is `\"transport\"`, so the output is `transport`."
```

## Your task

Write a function that cleans a category completely: it removes the
spaces, makes the letters small, and replaces another spelling with
the correct category.

Your function must be like this:

- Its name is `clean_category`.

- It has one parameter, `text`, which is a string.

- It returns the clean category: the string `text` without the spaces
  at its start and at its end, with small letters only, and with
  another spelling replaced by the correct category. It uses the
  dictionary `spellings` from the cell above for this.

- After the function, the last line of the cell is
  `print(clean_category("Groceries "))`.

Three examples:

| Call | Return value |
|------|--------------|
| `clean_category(" Food")` | `'food'` |
| `clean_category("Groceries ")` | `'food'` |
| `clean_category("TRAVEL")` | `'transport'` |

When your code is correct, the output under the cell is:

```
food
```

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-clean-category
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [clean-category]
:run: false
# Write the function clean_category on the lines below this one.

```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: the order of the steps
The order is important. The keys of the dictionary have small letters
and no spaces, so the word must be tidy before you look it up.
`"Groceries "` is not a key of the dictionary, and `"groceries"` is.

So the function has two steps: first make the word tidy, and then
look the tidy word up.
```

```{hint}
:title: Hint: the two lines
The first line of your function is `def clean_category(text):`.

For the first step, you can call your function from the last page, and
give the result a name: `word = tidy_word(text)`. You can also write
`word = text.strip().lower()`.

For the second step, look the word up with `get()`, and give the word
itself as the default: `return spellings.get(word, word)`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: clean-category-not-started
:check: clean-category
:expect: The function clean_category does not exist yet
```

````{attempt}
:id: clean-category-not-a-function
:check: clean-category
:expect: is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
clean_category = spellings.get("groceries", "groceries")
```
````

````{attempt}
:id: clean-category-no-parameter
:check: clean-category
:expect: but it has 0

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_category():
    return "food"
```
````

````{attempt}
:id: clean-category-key-error
:check: clean-category
:expect: stopped with a KeyError

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_category(text):
    word = text.strip().lower()
    return spellings[word]
```
````

````{attempt}
:id: clean-category-error
:check: clean-category
:expect: stopped with an error of the type NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_category(text):
    word = text.strip().lower()
    return other_words.get(word, word)
```
````

````{attempt}
:id: clean-category-prints
:check: clean-category
:expect: shows the category with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_category(text):
    word = text.strip().lower()
    print(spellings.get(word, word))
```
````

````{attempt}
:id: clean-category-no-return
:check: clean-category
:expect: A function with no return line gives None

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_category(text):
    word = text.strip().lower()
    word = spellings.get(word, word)
```
````

````{attempt}
:id: clean-category-no-default
:check: clean-category
:expect: Give get() a second argument

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_category(text):
    word = text.strip().lower()
    return spellings.get(word)
```
````

````{attempt}
:id: clean-category-not-a-string
:check: clean-category
:expect: but it must give the string

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_category(text):
    word = text.strip().lower()
    return [spellings.get(word, word)]
```
````

````{attempt}
:id: clean-category-spaces
:check: clean-category
:expect: still has a space at its start or at its end

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_category(text):
    word = text.lower()
    return spellings.get(word, word)
```
````

````{attempt}
:id: clean-category-capitals
:check: clean-category
:expect: still has a capital letter

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_category(text):
    word = text.strip()
    return spellings.get(word, word)
```
````

````{attempt}
:id: clean-category-wrong-order
:check: clean-category
:expect: is another spelling, and it was not replaced

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_category(text):
    word = spellings.get(text, text)
    return word.strip().lower()
```
````

````{attempt}
:id: clean-category-other
:check: clean-category
:expect: A category that is not a key of the dictionary must come back as it is

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_category(text):
    word = text.strip().lower()
    return spellings.get(word, "food")
```
````

````{attempt}
:id: clean-category-with-if
:check: clean-category
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_category(text):
    word = tidy_word(text)
    if word in spellings:
        return spellings[word]
    return word
```
````

````{hint}
:title: Show me a solution
:unlock: "clean-category" in failed_checks or "clean-category" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-clean-category-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [clean-category-solution]
:run: true
def clean_category(text):
    word = text.strip().lower()
    return spellings.get(word, word)

print(clean_category("Groceries "))
```
````

```{verify}
:id: clean-category
:label: Your function gives the clean category
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed clean-category; cell-executed clean-category-solution
def _workshop_check():
    import contextlib, inspect, io
    if "clean_category" not in globals():
        print("The function clean_category does not exist yet. Write it under the comment in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["clean_category"]
    if not callable(function):
        print("The name clean_category exists, but its value is not a function. Begin your cell with the line def clean_category(text): and write the body under it. Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(function).parameters)
    except (TypeError, ValueError):
        count = 1
    if count != 1:
        print(f"The function clean_category must have one parameter, the string, but it has {count}. Make the first line def clean_category(text): and use the name text inside the function. Then run the cell again.")
        return False
    cases = [
        (" Food", "food"),
        ("Groceries ", "food"),
        ("TRAVEL", "transport"),
        ("rent", "rent"),
        (" Hobbies", "hobbies"),
        ("travel", "transport"),
    ]
    results = []
    printed = False
    for text, expected in cases:
        call = f"clean_category({text!r})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                results.append(function(text))
        except KeyError:
            print(f"The function clean_category stopped with a KeyError when the check called {call}. Square brackets cannot look up a key that does not exist, and most categories are not keys of the dictionary spellings. Use get() and give the word itself as the default: spellings.get(word, word). Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function clean_category stopped with an error of the type {type(error).__name__} when the check called {call}. Run the same call in a cell of your own, and read the error message from the last line. A NameError means that a name is spelled differently from the name that exists. The dictionary has the name spellings. Then correct the function and run the cell again.")
            return False
        if shown.getvalue().strip():
            printed = True
    if all(result is None for result in results):
        if printed:
            print("The function clean_category shows the category with print(), but it does not return it. The code that calls the function gets None. Replace print() in the function with return. Then run the cell again.")
        else:
            print("clean_category(' Food') gives None but it must give 'food'. A function with no return line gives None. Add a line that begins with return and gives the clean category back. Then run the cell again.")
        return False
    for index in range(len(cases)):
        text, expected = cases[index]
        result = results[index]
        call = f"clean_category({text!r})"
        if result == expected:
            continue
        if result is None:
            print(f"{call} gives None but it must give {expected!r}. The word is not a key of the dictionary, and get() with one argument gives None for a key that does not exist. Give get() a second argument, the word itself: spellings.get(word, word). Then run the cell again.")
            return False
        if not isinstance(result, str):
            print(f"{call} gives {result!r} but it must give the string {expected!r}. Return the string that get() gives, and nothing around it. Then run the cell again.")
            return False
        if result != result.strip():
            print(f"{call} gives {result!r}. The string still has a space at its start or at its end. Call strip() on the string before you look it up in the dictionary. Then run the cell again.")
            return False
        if result != result.lower():
            print(f"{call} gives {result!r}. The string still has a capital letter. Call lower() on the string before you look it up in the dictionary. Then run the cell again.")
            return False
        if result in ("groceries", "travel"):
            print(f"{call} gives {result!r} but it must give {expected!r}. The word {result!r} is another spelling, and it was not replaced. The keys of the dictionary have small letters and no spaces. Make the word tidy first with strip() and lower(), and look the tidy word up after that. Then run the cell again.")
            return False
        print(f"{call} gives {result!r} but it must give {expected!r}. A category that is not a key of the dictionary must come back as it is. Give the tidy word itself as the default: spellings.get(word, word). Then run the cell again.")
        return False
    print("Correct. Your function gives back the clean category: no spaces around it, small letters only, and one word for each category.")
    return True
globals().pop("_workshop_check")()
```

Every category of the file is now one of six words. The first, second
and fourth field of a row are clean. The third field, the amount, is
the subject of the next two pages.
