---
title: "Part 4: the most common words"
requires: [verify:common-words]
---

# Part 4: the most common words

The dictionary `totals` holds 171 words and their counts. That is too
much to read. In this part you find the words that have a large count.

## The goal

Write a function named `common_words`. It takes a dictionary of counts
and a number, and it gives back a list of the words whose count is at
least that number. The list is in alphabetical order.

## What your code must do

- The function `common_words` has two parameters, in this order:
  `counts` and `minimum`. The value of `counts` is a dictionary such
  as the one that `count_words` gives back. The value of `minimum` is
  an integer.

- The function gives back a list. The list holds every key of the
  dictionary whose value is at least `minimum`. It holds the words
  only, and not the counts.

- "At least 3" means 3 or more. A word whose count is exactly
  `minimum` is in the list.

- The words in the list are in alphabetical order. A dictionary does
  not keep its keys in alphabetical order, so the function must sort
  the words.

- The function gives the list back with `return`. It does not print
  the list.

- After the function, the cell has two more lines. They show each word
  that is in the fables at least 8 times, and its count:

  ```python
  for word in common_words(totals, 8):
      print(word, totals[word])
  ```

For example, when the name `sample` refers to the dictionary
`{"the": 5, "pear": 2, "a": 3, "fig": 1, "of": 3}`, the call
`common_words(sample, 3)` must give back this list:

```
['a', 'of', 'the']
```

The call `common_words(sample, 4)` must give back `['the']`.

When your code is correct, the output under the cell is:

```
a 17
and 15
he 8
his 14
in 9
of 13
the 28
to 9
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-common
:title: Add a cell for part 4
:path: {{ notebook }}
:tags: [common]
:run: false
# Part 4: the most common words. Write your code below this line.

```

Write your code under the comment, and run the cell. The check calls
your function with two small dictionaries of its own.

## If you need help

```{hint}
:title: Hint: what to look at
The function builds a list in a loop: it starts with an empty list,
and it appends a word only when an `if` is true. The workshop **Doing
it again** used an `if` inside a loop in this way.

The workshop **Looping over anything** showed how to read the keys and
the values of a dictionary together:
`for word, count in counts.items():`. In each pass, `word` is one key
and `count` is its value.

The comparison operator for "at least" is `>=`.

`sorted()` takes a list and gives back a new list in order. For
strings with small letters, that is alphabetical order.
```

```{hint}
:title: Hint: the shape of the code
1. The first line defines the function:
   `def common_words(counts, minimum):`.

2. In the body, make an empty list: `words = []`.

3. Start the loop: `for word, count in counts.items():`.

4. Inside the loop, write an `if` line that compares `count` with
   `minimum`, using `>=`. The block under it appends `word` to the
   list `words`.

5. After the loop, with four spaces at the start of the line, give
   back the sorted list: `return sorted(words)`.

6. After the function, at the left side of the cell, write the two
   lines from the task.

Steps 2 to 4 can also be one line, as the workshop **Building lists in
one line** showed: `words = [word for word in counts if counts[word] >= minimum]`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: common-not-started
:check: common-words
:expect: The function common_words does not exist yet
```

````{attempt}
:id: common-not-a-function
:check: common-words
:expect: The name common_words is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
common_words = ["the", "a"]
```
````

````{attempt}
:id: common-one-parameter
:check: common-words
:expect: must have exactly two parameters

```{cell-insert}
:path: {{ notebook }}
:run: true
def common_words(counts):
    return sorted(counts)
```
````

````{attempt}
:id: common-other-error
:check: common-words
:expect: stopped with an error of the type NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def common_words(counts, minimum):
    for word, count in counts.items():
        if count >= minimum:
            chosen.append(word)
    return sorted(chosen)
```
````

````{attempt}
:id: common-prints
:check: common-words
:expect: shows its result with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def common_words(counts, minimum):
    words = []
    for word, count in counts.items():
        if count >= minimum:
            words.append(word)
    print(sorted(words))
```
````

````{attempt}
:id: common-sort-method
:check: common-words
:expect: gives back None

```{cell-insert}
:path: {{ notebook }}
:run: true
def common_words(counts, minimum):
    words = []
    for word, count in counts.items():
        if count >= minimum:
            words.append(word)
    return words.sort()
```
````

````{attempt}
:id: common-returns-dictionary
:check: common-words
:expect: must give back a list

```{cell-insert}
:path: {{ notebook }}
:run: true
def common_words(counts, minimum):
    words = {}
    for word, count in counts.items():
        if count >= minimum:
            words[word] = count
    return words
```
````

````{attempt}
:id: common-returns-counts
:check: common-words
:expect: holds a value that is not a string

```{cell-insert}
:path: {{ notebook }}
:run: true
def common_words(counts, minimum):
    words = []
    for word, count in counts.items():
        if count >= minimum:
            words.append(count)
    return sorted(words)
```
````

````{attempt}
:id: common-larger-than
:check: common-words
:expect: A word whose count is exactly 3 is missing

```{cell-insert}
:path: {{ notebook }}
:run: true
def common_words(counts, minimum):
    words = []
    for word, count in counts.items():
        if count > minimum:
            words.append(word)
    return sorted(words)
```
````

````{attempt}
:id: common-not-sorted
:check: common-words
:expect: but they are not in alphabetical order

```{cell-insert}
:path: {{ notebook }}
:run: true
def common_words(counts, minimum):
    words = []
    for word, count in counts.items():
        if count >= minimum:
            words.append(word)
    return words
```
````

````{attempt}
:id: common-every-word
:check: common-words
:expect: holds every word of the dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
def common_words(counts, minimum):
    words = []
    for word, count in counts.items():
        words.append(word)
    return sorted(words)
```
````

````{attempt}
:id: common-smaller-than
:check: common-words
:expect: but it must give back

```{cell-insert}
:path: {{ notebook }}
:run: true
def common_words(counts, minimum):
    words = []
    for word, count in counts.items():
        if count <= minimum:
            words.append(word)
    return sorted(words)
```
````

````{attempt}
:id: common-other-way
:check: common-words
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def common_words(counts, minimum):
    return sorted([word for word in counts if counts[word] >= minimum])
for word in common_words(totals, 8):
    print(word, totals[word])
```
````

````{hint}
:title: Show me a solution
:unlock: "common-words" in failed_checks or "common-words" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-common-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [common-solution]
:run: true
def common_words(counts, minimum):
    words = []
    for word, count in counts.items():
        if count >= minimum:
            words.append(word)
    return sorted(words)

for word in common_words(totals, 8):
    print(word, totals[word])
```
````

```{verify}
:id: common-words
:label: The function common_words gives back the words with a large count
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed common; cell-executed common-solution
def _workshop_check():
    import contextlib, io
    if "common_words" not in globals():
        print("The function common_words does not exist yet. Write it under the comment in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["common_words"]
    if not callable(function):
        print("The name common_words is not a function. It refers to another kind of value. Define the function with a line that starts with def common_words(counts, minimum): and write the body under it. Then run the cell again.")
        return False
    sample = {"the": 5, "pear": 2, "a": 3, "fig": 1, "of": 3}
    other = {"zebra": 2, "moth": 1, "ant": 2, "crow": 7}
    tests = [
        ("sample", sample, 3, ["a", "of", "the"]),
        ("sample", sample, 4, ["the"]),
        ("other", other, 2, ["ant", "crow", "zebra"]),
        ("other", other, 8, []),
    ]
    for name, counts, minimum, expected in tests:
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(dict(counts), minimum)
        except TypeError:
            print("The function common_words stopped with a TypeError when the check called it with a dictionary and a number. The function must have exactly two parameters, in this order: def common_words(counts, minimum): and the body must use counts as a dictionary and minimum as a number. Correct the function, and run the cell again.")
            return False
        except Exception as error:
            print(f"The function common_words stopped with an error of the type {type(error).__name__} when the check called it with the dictionary {counts!r} and the number {minimum}. Call the function in the same way in a cell of your own, and read the last line of the error message. Correct the function, and run the cell again.")
            return False
        where = f"When {name} is {counts!r}, common_words({name}, {minimum})"
        if result is None and shown.getvalue().strip():
            print("The function common_words shows its result with print(), but it does not return it. The code that calls the function then receives None. Replace print() in the last line of the body with return, so that the function gives the list back. Then run the cell again.")
            return False
        if result is None:
            print("The function common_words gives back None. That happens when the body has no return line. It also happens with return words.sort() because the method sort() changes the list and gives back None. Use return sorted(words) which gives back the sorted list. Then run the cell again.")
            return False
        if not isinstance(result, list):
            print(f"The function common_words must give back a list of words. {where} gives {result!r}. Make an empty list before the loop, append each word that has a large count, and return the sorted list. Then run the cell again.")
            return False
        if not all(isinstance(word, str) for word in result):
            print(f"{where} gives {result!r}. The list holds a value that is not a string. Append the word, which is the key of the dictionary, and not its count. Then run the cell again.")
            return False
        if result == expected:
            continue
        if sorted(result) == sorted(word for word in counts if counts[word] > minimum):
            print(f"{where} gives {result!r} but it must give back {expected!r}. A word whose count is exactly {minimum} is missing. At least {minimum} means {minimum} or more, so compare with >= and not with >. Then run the cell again.")
            return False
        if sorted(result) == expected:
            print(f"{where} gives {result!r}. These are the correct words, but they are not in alphabetical order. Give back the result of sorted() with the list between the parentheses. Then run the cell again.")
            return False
        if sorted(result) == sorted(counts):
            print(f"{where} gives {result!r}. The list holds every word of the dictionary. It must hold only the words whose count is at least {minimum}. Append a word only when an if line finds that its count is large enough: if count >= minimum. Then run the cell again.")
            return False
        print(f"{where} gives {result!r} but it must give back {expected!r}. The list must hold each word whose count is at least {minimum}, in alphabetical order. Check the comparison in your if line: count >= minimum. Then run the cell again.")
        return False
    print("Correct. The function common_words gives back the words whose count is at least the minimum, in alphabetical order.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

Eight words are in the fables at least 8 times. The most common word
is "the", with a count of 28. None of the eight words is about a dog,
a hen or a swan. The most common words of a text in English are
almost always small words such as "the", "a" and "and".
