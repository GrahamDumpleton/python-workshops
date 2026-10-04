---
title: Values that can change
requires: [quiz:predict-word, verify:word-ran, quiz:predict-menu, verify:menu-ran, quiz:which-mutable]
---

# Values that can change

The surprise of this workshop needs two things at the same time: two
names that refer to one value, and a value that can change. This page
is about the second thing.

Python has two kinds of values.

- A **mutable** value is a value that can change after it is made. A
  list is mutable: `append` adds an item to the list, and it is still
  the same list.

- An **immutable** value is a value that can never change after it is
  made. A number is immutable, and a string is immutable. The
  workshop **Working with text** showed this for strings: a method
  such as `upper()` gives back a new string, and leaves the first
  string as it was.

The word "mutable" means "able to change". These two words are common
in books and web pages about Python, so it is useful to know them.

Compare a piece of paper with a printed book. You can write one more
line on the paper. You cannot change the printed book: to have other
words, you need another book.

## Two things that look similar

There are two different actions in a program, and they are not the
same thing.

- **Changing a value.** `tuesday.append("rice")` changes the list
  itself. Every name that refers to the list shows the change. This
  is possible only for a mutable value.

- **Moving a label.** `old_price = 50` ties the name `old_price` to
  another value. The value that it referred to before does not
  change, and other names that refer to that value do not move.

A line that begins with a name and `=` moves a label. It never
changes a value.

## Predict: two names and one string

Look at this cell. Do not run it yet. Remember that `+` joins two
strings and gives a new string.

```python
first_word = "tea"
second_word = first_word
second_word = second_word + "pot"
print(first_word)
```

```{quiz}
:id: predict-word
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "tea"
wrong:
  - { text: "teapot", explanation: "That is the value of `second_word`. The third line does not change the string `\"tea\"`, because a string can never change. It makes a new string, and moves the label `second_word` to the new string. The label `first_word` does not move." }
  - { text: "\"tea\"", explanation: "The value is right. But `print()` shows a string without its quotes. Type the answer without quotes." }
  - { text: "'tea'", explanation: "The value is right. But `print()` shows a string without its quotes. Type the answer without quotes." }
otherwise: "The last line shows the string that `first_word` refers to. Does any line move the label `first_word`? Can a string change? Type the text as `print()` shows it, without quotes."
explanation: "After the second line, two names refer to one string. The third line makes a new string, `\"teapot\"`, and moves the label `second_word` to it. The string `\"tea\"` did not change, and `first_word` still refers to it."
```

Run the cell, and compare the output with your prediction. The cell
in your notebook also shows the value of `second_word`.

```{attempt}
:id: word-not-run
:check: word-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-word
:title: Add the cell with two names for one string, and run it
:path: {{ notebook }}
:tags: [word]
:run: true
first_word = "tea"
second_word = first_word
second_word = second_word + "pot"
print(first_word)
print(second_word)
```

The output is:

```
tea
teapot
```

```{verify}
:id: word-ran
:label: The string under the first name did not change
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed word
if globals().get("first_word") == "tea" and globals().get("second_word") == "teapot":
    print("The cell ran. The name first_word still refers to the string tea, and the name second_word refers to the new string teapot.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("first_word") == "tea" and globals().get("second_word") == "teapot"
```

Two names referred to one string, and nothing surprising happened.
With an immutable value, it does not matter how many names refer to
it, because nothing can change it.

## Predict: two names and one dictionary

A list is not the only mutable value. The workshop **Looking things
up** taught the dictionary, which holds values that you look up by a
key. The line `menu["coffee"] = 4` adds the key `"coffee"` with the
value `4` to the dictionary `menu`, and `len()` gives the number of
keys.

Look at this cell. Do not run it yet.

```python
prices = {"tea": 3}
menu = prices
menu["coffee"] = 4
print(len(prices))
```

```{quiz}
:id: predict-menu
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "2"
wrong:
  - { text: "1", explanation: "The line `menu = prices` makes no copy. Both names refer to one dictionary. The third line does not move a label: it changes the dictionary itself, so the change appears under both names." }
  - { text: "4", explanation: "`4` is the value for the key `\"coffee\"`. The last line shows the number of keys in the dictionary, which `len()` gives." }
otherwise: "The last line shows the number of keys of the dictionary that `prices` refers to. How many dictionaries does this cell make? Type one whole number."
explanation: "A dictionary is mutable, like a list. The line `menu = prices` ties a second name to the same dictionary. The line `menu[\"coffee\"] = 4` changes that dictionary, so it has 2 keys under both names."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: menu-not-run
:check: menu-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-menu
:title: Add the cell with two names for one dictionary, and run it
:path: {{ notebook }}
:tags: [menu]
:run: true
prices = {"tea": 3}
menu = prices
menu["coffee"] = 4
print(len(prices))
print(prices)
```

The output is:

```
2
{'tea': 3, 'coffee': 4}
```

```{verify}
:id: menu-ran
:label: The change to the dictionary appears under both names
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed menu
if globals().get("prices") == {"tea": 3, "coffee": 4} and globals().get("menu") is globals().get("prices"):
    print("The cell ran. The names prices and menu refer to one dictionary, which now has 2 keys.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("prices") == {"tea": 3, "coffee": 4} and globals().get("menu") is globals().get("prices")
```

The third line of this cell has an `=` in it, but it does not begin
with a name alone. It begins with `menu["coffee"]`, which is a place
inside the dictionary. So it changes the dictionary, and it does not
move the label `menu`. The same is true for a list. The line
`monday[0] = "eggs"` changes the first item of the list `monday`. It
does not move the label `monday`.

## Which values are mutable

| Kind of value | Example | Can it change? |
|---------------|---------|----------------|
| integer, float | `40`, `2.5` | No, it is immutable |
| string | `"tea"` | No, it is immutable |
| boolean | `True` | No, it is immutable |
| tuple | `(3, 4)` | No, it is immutable |
| list | `["bread", "milk"]` | Yes, it is mutable |
| dictionary | `{"tea": 3}` | Yes, it is mutable |
| set | `{1, 2, 3}` | Yes, it is mutable |

```{quiz}
:id: which-mutable
:title: When to be careful
question: "A cell has the line `b = a`. For which value of `a` can a later change that uses the name `b` also appear under the name `a`?"
options:
  - { text: "The string `\"bread\"`", explanation: "A string is immutable. No line can change it, so a second name for it causes no surprise." }
  - { text: "The list `[\"bread\", \"milk\"]`", correct: true }
  - { text: "The integer `40`", explanation: "An integer is immutable. No line can change it, so a second name for it causes no surprise." }
explanation: "A list is mutable. After `b = a`, both names refer to one list, and a change such as `b.append(\"rice\")` appears under both names. When you want two separate lists, use `b = a.copy()`."
```
