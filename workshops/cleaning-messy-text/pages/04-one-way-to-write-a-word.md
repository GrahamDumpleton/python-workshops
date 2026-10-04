---
title: One way to write a word
requires: [verify:raw-categories-shown, quiz:predict-lower, verify:tidy-word]
---

# One way to write a word

The clean data has six categories: `clothes`, `food`, `hobbies`,
`phone`, `rent` and `transport`. Now count how many different
categories the untidy file has.

The cell below collects the category of every row in a **set**. A set
is a group of values that keeps each value one time only, so it is a
good tool to find every different spelling. The category is the fourth
field of a row, which is `row[3]`. The slice `raw_rows[1:]` gives
every row except the header. The test `len(row) == 4` leaves out line
22 of the file, which has two fields only and so has no `row[3]`.

```{attempt}
:id: raw-categories-not-shown
:check: raw-categories-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-raw-categories
:title: Add a cell that collects every spelling of a category, and run it
:path: {{ notebook }}
:tags: [raw-categories]
:run: true
raw_categories = set()
for row in raw_rows[1:]:
    if len(row) == 4:
        raw_categories.add(row[3])

print(len(raw_categories))
print(sorted(raw_categories))
```

The output is:

```
20
[' Food', ' clothes', 'Clothes', 'FOOD', 'Food', 'HOBBIES', 'Hobbies', 'Phone', 'Rent', 'TRANSPORT', 'Transport', 'clothes', 'food', 'food ', 'groceries', 'hobbies', 'phone', 'rent', 'transport', 'travel']
```

```{verify}
:id: raw-categories-shown
:label: The cell collected every spelling of a category
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed raw-categories
if isinstance(globals().get("raw_categories"), set) and len(globals().get("raw_categories")) == 20:
    print("The cell ran. The untidy file writes its categories in 20 different ways.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("raw_categories"), set) and len(globals().get("raw_categories")) == 20
```

Six categories are written in 20 different ways. Food alone is
written as `' Food'`, `'FOOD'`, `'Food'`, `'food'` and `'food '`, and
also as `'groceries'`.

## Small letters only

Some of these strings differ only in their capital letters. For
Python, a capital letter and a small letter are different characters,
so `"Food" == "food"` is `False`.

Think of the names in a list of telephone numbers. The list is useful
only when everyone writes a name in one way. The rule itself is not
important. What is important is that there is one rule, and that
every name follows it.

The rule in this workshop is: small letters only. The method
`lower()` of a string gives back a new string in which every capital
letter is a small letter. Letters that are small already stay as they
are. So these three lines all show `food`:

```python
print("FOOD".lower())
print("Food".lower())
print("food".lower())
```

After `lower()`, the three spellings are one spelling.

```{quiz}
:id: predict-lower
:type: text
:title: Predict the result
question: "What does `print(\"Monthly BUS pass\".lower())` show? Type the output exactly."
answer: "monthly bus pass"
wrong:
  - { text: "Monthly bus pass", explanation: "`lower()` changes every capital letter, and the `M` at the start is a capital letter too." }
  - { text: "monthlybuspass", explanation: "`lower()` changes letters only. It keeps the spaces between the words." }
  - { text: "\"monthly bus pass\"", explanation: "The letters are correct. `print()` shows a string without the quotes, so type it without the quotes." }
  - { text: "'monthly bus pass'", explanation: "The letters are correct. `print()` shows a string without the quotes, so type it without the quotes." }
  - { text: "MONTHLY BUS PASS", explanation: "That is the result of `upper()`, which makes every letter a capital letter. `lower()` makes every letter small." }
otherwise: "`lower()` makes every capital letter small, and changes nothing else. Type the three words with small letters only, and with one space between them."
explanation: "`lower()` gives back `monthly bus pass`. Every capital letter is now a small letter. The spaces and the letters that were small already are the same as before."
```

## Your task

Write a function that makes one word tidy: no spaces around it, and
small letters only.

Your function must be like this:

- Its name is `tidy_word`.

- It has one parameter, `text`, which is a string.

- It returns a new string: the string `text` without the spaces at its
  start and at its end, and with small letters only.

- After the function, the last line of the cell is
  `print(tidy_word(" Food"))`.

Two examples:

| Call | Return value |
|------|--------------|
| `tidy_word(" Food")` | `'food'` |
| `tidy_word("TRANSPORT")` | `'transport'` |

When your code is correct, the output under the cell is:

```
food
```

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-tidy-word
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [tidy-word]
:run: false
# Write the function tidy_word on the lines below this one.

```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
The first line of your function is `def tidy_word(text):`. The
function needs two methods of a string: `strip()` from the last page,
and `lower()` from this page.
```

```{hint}
:title: Hint: two methods, one after the other
A string never changes, so each method gives back a new string. You
can give each new string a name:

`text = text.strip()` and then `text = text.lower()`, and then
`return text`.

You can also call the second method on the result of the first method,
in one line: `return text.strip().lower()`. Python runs `strip()`
first, and then runs `lower()` on the string that `strip()` gave back.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: tidy-word-not-started
:check: tidy-word
:expect: The function tidy_word does not exist yet
```

````{attempt}
:id: tidy-word-not-a-function
:check: tidy-word
:expect: is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
tidy_word = " Food".strip().lower()
```
````

````{attempt}
:id: tidy-word-no-parameter
:check: tidy-word
:expect: but it has 0

```{cell-insert}
:path: {{ notebook }}
:run: true
def tidy_word():
    return "food"
```
````

````{attempt}
:id: tidy-word-error
:check: tidy-word
:expect: stopped with an error of the type AttributeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def tidy_word(text):
    return text.strip().small()
```
````

````{attempt}
:id: tidy-word-prints
:check: tidy-word
:expect: shows the string with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def tidy_word(text):
    print(text.strip().lower())
```
````

````{attempt}
:id: tidy-word-no-return
:check: tidy-word
:expect: A function with no return line gives None

```{cell-insert}
:path: {{ notebook }}
:run: true
def tidy_word(text):
    text = text.strip().lower()
```
````

````{attempt}
:id: tidy-word-not-a-string
:check: tidy-word
:expect: but it must give the string

```{cell-insert}
:path: {{ notebook }}
:run: true
def tidy_word(text):
    return [text.strip().lower()]
```
````

````{attempt}
:id: tidy-word-spaces
:check: tidy-word
:expect: still has a space at its start or at its end

```{cell-insert}
:path: {{ notebook }}
:run: true
def tidy_word(text):
    return text.lower()
```
````

````{attempt}
:id: tidy-word-capitals
:check: tidy-word
:expect: still has a capital letter

```{cell-insert}
:path: {{ notebook }}
:run: true
def tidy_word(text):
    text = text.strip()
    text.lower()
    return text
```
````

````{attempt}
:id: tidy-word-other
:check: tidy-word
:expect: Change nothing else in the string

```{cell-insert}
:path: {{ notebook }}
:run: true
def tidy_word(text):
    return text.lower().replace(" ", "")
```
````

````{attempt}
:id: tidy-word-other-order
:check: tidy-word
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def tidy_word(text):
    small = text.lower()
    return small.strip()
```
````

````{hint}
:title: Show me a solution
:unlock: "tidy-word" in failed_checks or "tidy-word" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-tidy-word-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [tidy-word-solution]
:run: true
def tidy_word(text):
    return text.strip().lower()

print(tidy_word(" Food"))
```
````

```{verify}
:id: tidy-word
:label: Your function gives a word with no spaces around it and small letters only
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed tidy-word; cell-executed tidy-word-solution
def _workshop_check():
    import contextlib, inspect, io
    if "tidy_word" not in globals():
        print("The function tidy_word does not exist yet. Write it under the comment in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["tidy_word"]
    if not callable(function):
        print("The name tidy_word exists, but its value is not a function. Begin your cell with the line def tidy_word(text): and write the body under it. Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(function).parameters)
    except (TypeError, ValueError):
        count = 1
    if count != 1:
        print(f"The function tidy_word must have one parameter, the string, but it has {count}. Make the first line def tidy_word(text): and use the name text inside the function. Then run the cell again.")
        return False
    cases = [
        (" Food", "food"),
        ("TRANSPORT", "transport"),
        ("hobbies ", "hobbies"),
        (" Dry Cleaning ", "dry cleaning"),
    ]
    for text, expected in cases:
        call = f"tidy_word({text!r})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(text)
        except Exception as error:
            print(f"The function tidy_word stopped with an error of the type {type(error).__name__} when the check called {call}. Run the same call in a cell of your own, and read the error message from the last line. The two methods that you need are strip() and lower(). Then correct the function and run the cell again.")
            return False
        if result is None and shown.getvalue().strip():
            print("The function tidy_word shows the string with print(), but it does not return it. The code that calls the function gets None. Replace print() in the function with return. Then run the cell again.")
            return False
        if result is None:
            print(f"{call} gives None but it must give {expected!r}. A function with no return line gives None. Add a line that begins with return and gives the new string back. Then run the cell again.")
            return False
        if not isinstance(result, str):
            print(f"{call} gives {result!r} but it must give the string {expected!r}. Return the string that strip() and lower() give, and nothing around it. Then run the cell again.")
            return False
        if result == expected:
            continue
        if result != result.strip():
            print(f"{call} gives {result!r}. The string still has a space at its start or at its end. Call strip() on the string as well as lower(): return text.strip().lower(). Then run the cell again.")
            return False
        if result != result.lower():
            print(f"{call} gives {result!r}. The string still has a capital letter. A string never changes, so lower() gives back a new string. Return that new string, or give it a name: text = text.lower(). Then run the cell again.")
            return False
        print(f"{call} gives {result!r} but it must give {expected!r}. Remove the spaces at the start and at the end with strip(), and make the letters small with lower(). Change nothing else in the string. Then run the cell again.")
        return False
    print("Correct. Your function gives back the word with no spaces around it and with small letters only.")
    return True
globals().pop("_workshop_check")()
```

On the next page you use `tidy_word` on every category of the file,
and you see how many spellings are left.
