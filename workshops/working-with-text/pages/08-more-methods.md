---
title: Three more methods
requires: [verify:strip-ran, verify:replace-ran, quiz:predict-replace, verify:banana-ran, verify:split-ran, verify:city-tidied]
---

# Three more methods

Text that comes from people is often untidy. A person types a space
by accident before a name. A date uses the wrong symbol between its
parts. A program must clean such text before it uses it.

Strings have many methods for this work. This page shows three of
them: `strip()`, `replace()` and `split()`. Each one follows the rule
of the last page: a **method** is a function that belongs to a value,
and a string method never changes the string. It gives back a new
value.

## Remove spaces at the ends: `strip()`

The method `strip()` gives back a new string without the spaces at
its beginning and at its end. To strip something means to remove its
outer layer.

Click the action below. It adds a cell that uses `strip()`, and runs
it. The two `print()` lines show each string between square brackets,
so that you can see the spaces.

```{attempt}
:id: strip-not-run
:check: strip-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-strip
:title: Add a cell that removes the spaces at the ends of a string, and run it
:path: {{ notebook }}
:tags: [strip]
:run: true
typed_name = "  Fatima  "
clean_name = typed_name.strip()
print(f"[{typed_name}]")
print(f"[{clean_name}]")
```

The first line of the output is `[  Fatima  ]`, with two spaces on
each side of the name. The second line is `[Fatima]`. The method gave
back a new string without those spaces, and the name `typed_name`
still refers to the old string.

`strip()` removes spaces only at the two ends. Spaces between words
stay where they are.

```{verify}
:id: strip-ran
:label: The method strip() gave back a string without the spaces at the ends
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed strip
if globals().get("clean_name") == "Fatima":
    print("The cell ran. The name clean_name refers to the string Fatima, with no spaces at its ends.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("clean_name") == "Fatima"
```

## Replace one text with another: `replace()`

Some methods need more information to do their work. You write that
information between the parentheses.

The method `replace()` needs two strings, with a comma between them:
the text to find, and the text to put in its place. It gives back a
new string in which the first text is replaced by the second text.

```{attempt}
:id: replace-not-run
:check: replace-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-replace
:title: Add a cell that replaces one symbol with another, and run it
:path: {{ notebook }}
:tags: [replace]
:run: true
date_text = "2026/03/14"
iso_date = date_text.replace("/", "-")
print(iso_date)
```

The output is `2026-03-14`. The string has the symbol `/` in two
places, and the method replaced both.

```{verify}
:id: replace-ran
:label: The method replace() gave back a string with new symbols
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed replace
if globals().get("iso_date") == "2026-03-14":
    print("The cell ran. The name iso_date refers to the string 2026-03-14.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("iso_date") == "2026-03-14"
```

Look at this cell. Do not run it yet.

```python
fruit_word = "banana"
changed_word = fruit_word.replace("a", "o")
print(changed_word)
```

```{quiz}
:id: predict-replace
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "bonono"
wrong:
  - { text: "bonana", explanation: "The method does not stop after the first `a`. It replaces every `a` in the string." }
  - { text: "banana", explanation: "`banana` is the old string. The last line shows the new string that the method gave back." }
  - { text: "banano", explanation: "The method replaces every `a` in the string, not only the last one." }
  - { text: "\"bonono\"", explanation: "The characters are correct. But `print()` shows a string without its quotes: type only the characters." }
otherwise: "The method replaces every `a` in the string with `o`. Change the letters of `banana` one by one."
explanation: "The method `replace()` replaces every `a` in the string. The string `banana` has three, so the result is `bonono`."
```

```{attempt}
:id: banana-not-run
:check: banana-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-banana
:title: Add the cell that replaces a letter, and run it
:path: {{ notebook }}
:tags: [banana]
:run: true
fruit_word = "banana"
changed_word = fruit_word.replace("a", "o")
print(changed_word)
```

```{verify}
:id: banana-ran
:label: The method replace() replaced every a
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed banana
if globals().get("changed_word") == "bonono":
    print("The cell ran. The method replaced every a, and the name changed_word refers to the string bonono.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("changed_word") == "bonono"
```

## Divide a string into words: `split()`

The method `split()` divides a string at its spaces. It gives back
the words, each one as a string of its own.

```{attempt}
:id: split-not-run
:check: split-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-split
:title: Add a cell that divides a string into words, and run it
:path: {{ notebook }}
:tags: [split]
:run: true
shopping = "rice beans salt"
shopping_words = shopping.split()
print(shopping_words)
```

The output is different from everything that you have seen:

```
['rice', 'beans', 'salt']
```

The result is not one string. It is three strings together, in one
value. This kind of value is called a **list**: a value that holds
several values in order. Python shows a list between square brackets,
with commas between the values. It shows each string in the list with
single quotes.

You do not need to know more about lists now. A later workshop,
**Keeping a list**, teaches them. For now, remember that `split()`
gives back a list of the words.

```{verify}
:id: split-ran
:label: The method split() gave back a list of three words
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed split
if globals().get("shopping_words") == ["rice", "beans", "salt"]:
    print("The cell ran. The name shopping_words refers to a list that holds three strings.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("shopping_words") == ["rice", "beans", "salt"]
```

## Your task

A person typed the name of a city into a form, with spaces before and
after it. The action below adds a cell that must clean the text. The
action does not run the cell.

```{cell-insert}
:id: insert-tidy
:title: Add a cell with an untidy text for me to change
:path: {{ notebook }}
:tags: [tidy]
:run: false
raw_city = "  Accra "
tidy_city = raw_city
print(f"[{tidy_city}]")
```

When this cell runs, the output is `[  Accra ]`, with the spaces
inside the square brackets. Change the second line so that the name
`tidy_city` refers to a string without the spaces at its ends. Use a
method. Do not change the first line. Then run the cell. The output
must be:

```
[Accra]
```

```{hint}
:title: Hint: which method do I need?
The method `strip()` gives back a string without the spaces at its
ends. Look at the cell with the name `Fatima`, and at its second
line.
```

```{hint}
:title: Hint: what does the line look like?
Write a dot, the name of the method and two parentheses after the
name `raw_city`: `tidy_city = raw_city.strip()`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: tidy-not-started
:check: city-tidied
:expect: The cell has not run yet
```

````{attempt}
:id: tidy-unchanged
:check: city-tidied
:expect: still has spaces at its ends

```{cell-insert}
:path: {{ notebook }}
:run: true
raw_city = "  Accra "
tidy_city = raw_city
print(f"[{tidy_city}]")
```
````

````{attempt}
:id: tidy-no-parentheses
:check: city-tidied
:expect: the parentheses after the name of the method are missing

```{cell-insert}
:path: {{ notebook }}
:run: true
raw_city = "  Accra "
tidy_city = raw_city.strip
print(f"[{tidy_city}]")
```
````

````{attempt}
:id: tidy-upper
:check: city-tidied
:expect: but it must refer to the string Accra

```{cell-insert}
:path: {{ notebook }}
:run: true
raw_city = "  Accra "
tidy_city = raw_city.strip().upper()
print(f"[{tidy_city}]")
```
````

````{attempt}
:id: tidy-with-replace
:check: city-tidied
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
raw_city = "  Accra "
tidy_city = raw_city.replace(" ", "")
print(f"[{tidy_city}]")
```
````

````{hint}
:title: Show me a solution
:unlock: "city-tidied" in failed_checks or "city-tidied" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-tidy-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [tidy-solution]
:run: true
raw_city = "  Accra "
tidy_city = raw_city.strip()
print(f"[{tidy_city}]")
```
````

```{verify}
:id: city-tidied
:label: The name tidy_city refers to the city without spaces at the ends
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed tidy; cell-executed tidy-solution
if "tidy_city" not in globals():
    print("The cell has not run yet. Change the second line of the new cell. Then hold Shift and press Enter to run the cell.")
elif not isinstance(tidy_city, str):
    print("The name tidy_city does not refer to a string. That happens when the parentheses after the name of the method are missing. Write tidy_city = raw_city.strip() in the second line, with the two parentheses at the end. Then run the cell again.")
elif tidy_city == "Accra":
    print("Correct. The name tidy_city refers to the string Accra, with no spaces at its ends.")
elif tidy_city.strip() == "Accra":
    print(f"The name tidy_city refers to [{tidy_city}], which still has spaces at its ends. The square brackets show where the value begins and ends. Use the method strip() in the second line: tidy_city = raw_city.strip(). Then run the cell again.")
else:
    print(f"The name tidy_city refers to [{tidy_city}] but it must refer to the string Accra. The square brackets show where the value begins and ends. The first line must stay as it was, and the second line must be tidy_city = raw_city.strip(). Then run the cell again.")
"tidy_city" in globals() and tidy_city == "Accra"
```
