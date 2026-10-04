---
title: A value for each key
requires: [quiz:predict-menu, verify:menu-ran]
---

# A value for each key

A **dictionary** is a value that holds other values, as a list does.
The difference is how you find one of them. In a list, you find a
value by its position: the first, the second, the third. In a
dictionary, you find a value by a **key**. A key is a value that you
choose to find another value with. Most keys are strings, such as the
name of a product.

## Why a position is not enough

Think of a small restaurant. One list holds the names of the dishes,
and another list holds the prices:

```python
dishes = ["soup", "rice", "tea"]
costs = [4, 3, 2]
```

To find the price of rice, you must first find the position of
`"rice"` in the first list, and then read the same position in the
second list. The two lists must always stay in the same order. If
someone adds a dish to one list and forgets the other list, every
price after it is wrong.

What you want to say is more direct: "give me the price of rice". A
dictionary lets you say that.

## A comparison

Think of a dictionary of a language, the book or the website where
you find the meaning of a word. You do not ask for "word number
5210". You find the word itself, and beside the word is its meaning.

A Python dictionary works in the same way. The key is like the word,
and the value is like the meaning. This is where the name
"dictionary" comes from.

## How a dictionary is written

This line makes a dictionary and gives it the name `menu`:

```python
menu = {"soup": 4, "rice": 3, "tea": 2}
```

- A dictionary begins with `{` and ends with `}`. These characters are
  called curly brackets.

- Inside the brackets, each key is followed by a colon `:` and then by
  its **value**. The value is what the dictionary keeps for that key.
  Here the key `"soup"` has the value `4`.

- A key together with its value is one **pair**. A comma separates
  each pair from the next pair.

```{quiz}
:id: predict-menu
:type: text
:title: Count the pairs
question: 'How many pairs does the dictionary `{"soup": 4, "rice": 3, "tea": 2}` hold? Type the number.'
answer: "3"
wrong:
  - { text: "6", explanation: "There are six things between the brackets, but a key and its value together are one pair. Count the colons." }
  - { text: "2", explanation: "A comma separates one pair from the next, so two commas separate three pairs." }
  - { text: "three", explanation: "That is correct, but type it as a number." }
otherwise: "Each pair has one colon. Count the colons between the curly brackets."
explanation: 'The dictionary holds three pairs: `"soup": 4`, `"rice": 3` and `"tea": 2`. Each pair has a key on the left of the colon and a value on the right.'
```

Click the action below. It adds a cell that makes this dictionary and
shows it, and runs the cell.

```{attempt}
:id: menu-not-run
:check: menu-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-menu
:title: Add a cell that makes a dictionary and shows it, and run it
:path: {{ notebook }}
:tags: [menu]
:run: true
menu = {"soup": 4, "rice": 3, "tea": 2}
print(menu)
```

The output is:

```
{'soup': 4, 'rice': 3, 'tea': 2}
```

```{verify}
:id: menu-ran
:label: The cell made a dictionary of three pairs
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed menu
if globals().get("menu") == {"soup": 4, "rice": 3, "tea": 2}:
    print("The cell ran. The name menu refers to a dictionary that holds three pairs.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("menu") == {"soup": 4, "rice": 3, "tea": 2}
```

## What happened

The first line made a dictionary of three pairs, and made the name
`menu` refer to it. The second line showed the dictionary.

Python shows the keys with single quotes, `'soup'`. Single quotes and
double quotes mean the same: both mark a string.

Three facts about a dictionary are useful to know now:

- A value can be of any type: a number, a string, a boolean, or a
  list.

- A key is usually a string. A number can also be a key.

- Each key appears only one time in a dictionary. Two pairs cannot
  have the same key, because Python could not know which value you
  want.

On the next page you use a key to find its value.
