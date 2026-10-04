---
title: What you have learned
---

# What you have learned

You have built a complete program. Nobody gave you the code: you had a
goal for each part, and you wrote the lines yourself. Your program
answers three questions about five fables:

- The most common words are "the", "a", "and", "his" and "of".

- The longest fable is "The Swan and the Goose".

- The words "a", "and", "of", "the" and "to" are in every fable.

## The ideas

- A large program is made from small functions. Each function does one
  thing, and has a name that says what it does. You wrote five
  functions, and you tested each one before you wrote the next one.

- A function that gives its result back with `return` can be used by
  other code. `count_words(clean_words(text))` works only because
  `clean_words` returns its list.

- A function that reads its data from its parameters works for every
  value of the same kind. Your functions work for these five fables,
  and for any other text.

- Text must be made clean before it is counted. For Python, `"The"`
  and `"the"` are different strings.

- A dictionary counts things: each key is a thing, and its value is
  the count.

- The pattern that finds the largest number in a list also finds the
  key that has the largest value in a dictionary.

- Sets and the operator `&` find the values that several groups share.

## The code

| Code | What it does |
|------|--------------|
| `"""..."""` | writes a string that continues over many lines |
| `text = text.lower()` | makes every letter of the text small |
| `text = text.replace(",", "")` | removes every comma from the text |
| `text.split()` | gives a list of the words of the text |
| `counts[word] = counts.get(word, 0) + 1` | adds 1 to the count of a word |
| `for text in fables.values():` | repeats its block one time for each value of the dictionary |
| `for word, count in counts.items():` | repeats its block one time for each key and its value |
| `sorted(words)` | gives a new list in alphabetical order |
| `set(clean_words(text))` | gives the set of the words of a text |
| `shared = shared & words` | keeps only the values that are in both sets |

## What comes next

The set **Python functions and data** is now complete. You can write
functions, and you can keep data in lists, dictionaries, tuples and
sets.

In this workshop, the text of the fables was written in a cell of the
notebook. Real data is almost never in the code. It is in files. The
next set of workshops, **Working with real data in Python**, begins
with the workshop **Reading and writing files**. It shows how a
program reads its data from a file, and how it saves its results in a
file.

Click `Finish` at the bottom of this panel.
