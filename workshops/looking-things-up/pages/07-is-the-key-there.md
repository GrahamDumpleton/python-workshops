---
title: Is the key there?
requires: [quiz:predict-luggage, verify:luggage-ran, verify:visitors-counted]
---

# Is the key there?

A program often needs to ask two questions about a dictionary. Is
this key in the dictionary? How many pairs does the dictionary hold?
You already know the two tools that answer these questions, because
they also work with a list.

- The word `in` tests whether a key is in a dictionary. The result is
  a boolean: `True` or `False`.

- The function `len()` gives the number of pairs in a dictionary.

Why ask whether a key exists? Because the program can then decide
what to do, with an `if`. For example, a program can greet a customer
that it knows in one way, and a new customer in another way.

There is one thing to remember. With a dictionary, `in` looks at the
keys only. It does not look at the values. Think again of a
dictionary of a language: you can find a word quickly, because the
words are in order, but you cannot find a meaning without reading the
whole book. A dictionary is made for finding keys.

## Predict the value

Look at this cell. Do not run it yet. The dictionary holds the weight
of two pieces of luggage, in kilograms.

```python
luggage = {"suitcase": 18, "backpack": 6}
print("backpack" in luggage)
print(6 in luggage)
print(len(luggage))
```

The first line of output is `True`, because `"backpack"` is a key of
the dictionary.

```{quiz}
:id: predict-luggage
:type: text
:title: Predict the second line
question: "What is the second line of output, from `print(6 in luggage)`?"
answer: "False"
wrong:
  - { text: "True", explanation: "`6` is a value in the dictionary, but `in` looks at the keys only. The keys are `\"suitcase\"` and `\"backpack\"`." }
  - { text: "false", explanation: "That is the right idea, but Python writes it with a capital letter: `False`." }
  - { text: "backpack", explanation: "`in` does not give the key that has this value. It gives `True` or `False`, and it looks at the keys only." }
otherwise: "The word `in` gives `True` or `False`. It looks at the keys of the dictionary only. Is `6` one of the keys?"
explanation: 'The keys of the dictionary are `"suitcase"` and `"backpack"`. The number `6` is a value and not a key, so the result is `False`.'
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: luggage-not-run
:check: luggage-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-luggage
:title: Add the cell that tests for a key and counts the pairs, and run it
:path: {{ notebook }}
:tags: [luggage]
:run: true
luggage = {"suitcase": 18, "backpack": 6}
print("backpack" in luggage)
print(6 in luggage)
print(len(luggage))
```

The output is:

```
True
False
2
```

```{verify}
:id: luggage-ran
:label: The cell tested for a key and counted the pairs
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed luggage
if globals().get("luggage") == {"suitcase": 18, "backpack": 6}:
    print("The cell ran. The word in found the key backpack, it did not find the value 6, and len() counted 2 pairs.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("luggage") == {"suitcase": 18, "backpack": 6}
```

The last line shows `2`. The dictionary has two pairs, so `len()`
gives `2`. It counts the pairs, and not the keys and the values
separately.

## Deciding with a key

A test with `in` is a boolean, so it can be the test of an `if`. This
code looks up the key only when it exists, so it can never stop with a
`KeyError`:

```python
if "backpack" in luggage:
    print("The backpack weighs", luggage["backpack"])
else:
    print("There is no backpack")
```

## Your task

A hotel keeps a dictionary of its guests. Each key is the name of a
guest, and the value is the number of nights that the guest stays.
Write a program that tests whether Omar is a guest, and counts the
guests.

Your program must do these four things, in this order:

1. Give the name `visitors` to the dictionary
   `{"Sofia": 2, "Kwame": 4}`.

2. Test whether the key `"Omar"` is in `visitors`, and give the result
   the name `has_omar`.

3. Give the number of pairs in `visitors` the name `visitor_count`.

4. Show `has_omar` and `visitor_count` with `print()`, each on a line
   of its own.

When the program is correct, the output under the cell is:

```
False
2
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-visitors
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [visitors]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: the test
The test is `"Omar" in visitors`. It is an expression, so it can be
the right side of an assignment: `has_omar = "Omar" in visitors`.
```

```{hint}
:title: Hint: the count
The function `len()` gives the number of pairs:
`visitor_count = len(visitors)`. The program ends with two lines that
use `print()`, one for each name.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: visitors-not-started
:check: visitors-counted
:expect: The name visitors does not exist yet
```

````{attempt}
:id: visitors-wrong-dictionary
:check: visitors-counted
:expect: but it must refer to the dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
visitors = {"Sofia": 2, "Kwame": 4, "Omar": 1}
```
````

````{attempt}
:id: visitors-dictionary-only
:check: visitors-counted
:expect: The name has_omar does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
visitors = {"Sofia": 2, "Kwame": 4}
```
````

````{attempt}
:id: visitors-used-get
:check: visitors-counted
:expect: but it must refer to False

```{cell-insert}
:path: {{ notebook }}
:run: true
visitors = {"Sofia": 2, "Kwame": 4}
has_omar = visitors.get("Omar")
print(has_omar)
```
````

````{attempt}
:id: visitors-other-key
:check: visitors-counted
:expect: The name has_omar refers to True

```{cell-insert}
:path: {{ notebook }}
:run: true
visitors = {"Sofia": 2, "Kwame": 4}
has_omar = "Sofia" in visitors
print(has_omar)
```
````

````{attempt}
:id: visitors-no-count
:check: visitors-counted
:expect: The name visitor_count does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
visitors = {"Sofia": 2, "Kwame": 4}
has_omar = "Omar" in visitors
print(has_omar)
```
````

````{attempt}
:id: visitors-added-nights
:check: visitors-counted
:expect: but it must refer to 2

```{cell-insert}
:path: {{ notebook }}
:run: true
visitors = {"Sofia": 2, "Kwame": 4}
has_omar = "Omar" in visitors
visitor_count = 2 + 4
print(has_omar)
print(visitor_count)
```
````

````{hint}
:title: Show me a solution
:unlock: "visitors-counted" in failed_checks or "visitors-counted" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-visitors-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [visitors-solution]
:run: true
visitors = {"Sofia": 2, "Kwame": 4}
has_omar = "Omar" in visitors
visitor_count = len(visitors)
print(has_omar)
print(visitor_count)
```
````

```{verify}
:id: visitors-counted
:label: Your program tests for a key and counts the pairs
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed visitors; cell-executed visitors-solution
if "visitors" not in globals():
    print("The name visitors does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the dictionary. Then hold Shift and press Enter to run the cell.")
elif visitors != {"Sofia": 2, "Kwame": 4}:
    print(f"The name visitors refers to {visitors} but it must refer to the dictionary {{'Sofia': 2, 'Kwame': 4}}. Omar is not a guest, so the dictionary has no pair for him. Correct the first line of your program. Then run the cell again.")
elif "has_omar" not in globals():
    print("The name has_omar does not exist yet. Add a line that tests whether the key Omar is in the dictionary, and gives the result this name. Check the spelling of the name. Then run the cell again.")
elif has_omar is True:
    print("The name has_omar refers to True, but Omar is not a guest. The test must use the key Omar, with a capital letter at the start: \"Omar\" in visitors. Then run the cell again.")
elif has_omar is not False:
    print(f"The name has_omar refers to {has_omar!r} but it must refer to False. Use the word in, which gives True or False: \"Omar\" in visitors. The method get() gives a value or None, and not a boolean. Then run the cell again.")
elif "visitor_count" not in globals():
    print("The name visitor_count does not exist yet. Add a line that gives the number of pairs this name, with the function len(). Check the spelling of the name. Then run the cell again.")
elif visitor_count == 2 and type(visitor_count) is int:
    print("Correct. The name has_omar refers to False, because Omar is not a key, and the name visitor_count refers to 2.")
else:
    print(f"The name visitor_count refers to {visitor_count!r} but it must refer to 2. The dictionary holds two pairs. Use len(visitors), which counts the pairs. Then run the cell again.")
"visitors" in globals() and "has_omar" in globals() and "visitor_count" in globals() and visitors == {"Sofia": 2, "Kwame": 4} and has_omar is False and type(visitor_count) is int and visitor_count == 2
```
