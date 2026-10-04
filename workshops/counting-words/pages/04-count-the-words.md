---
title: "Part 2: count the words"
requires: [verify:count-words]
---

# Part 2: count the words

You have a function that gives a list of clean words. In this part you
count how many times each word is in such a list.

## The goal

Write a function named `count_words`. It takes a list of words, and it
gives back a dictionary. Each key of the dictionary is a word, and its
value is the number of times that the word is in the list.

A dictionary is the right kind of value for this work, because the
program must find the count that belongs to a word, and a dictionary
finds a value by its key.

## What your code must do

- The function `count_words` has one parameter, named `words`. The
  value that it receives is a list of strings.

- The function makes a dictionary. Every word of the list is a key of
  the dictionary, one time only.

- The value for each key is an integer: how many times that word is in
  the list.

- The function gives the dictionary back with `return`. It does not
  print the dictionary.

- The function does not clean the words. That is the work of
  `clean_words`. Each function does one thing.

- After the function, the cell has two more lines. They use both of
  your functions with one fable, and show how many times the word
  "hen" is in it:

  ```python
  hen_counts = count_words(clean_words(hen_fable))
  print(hen_counts["hen"])
  ```

For example, the call
`count_words(["the", "dog", "the", "hen", "the", "dog"])` must give
back this dictionary:

```
{'the': 3, 'dog': 2, 'hen': 1}
```

When your code is correct, the output under the cell is:

```
3
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-count
:title: Add a cell for part 2
:path: {{ notebook }}
:tags: [count]
:run: false
# Part 2: count the words. Write your code below this line.

```

Write your code under the comment, and run the cell. The check calls
your function with three short lists of its own.

## If you need help

```{hint}
:title: Hint: what to look at
The workshop **Looking things up** showed how to count with a
dictionary. The second question on the first page of this workshop has
an example.

An empty dictionary is written `{}`.

`counts.get(word, 0)` gives the value for the key `word`. When the
dictionary does not have that key yet, it gives 0. That is the count
of the word until now.

`counts[word] = ...` gives the key `word` a new value. When the
dictionary does not have that key yet, the assignment adds the key.
```

```{hint}
:title: Hint: the shape of the code
1. The first line defines the function: `def count_words(words):`.

2. In the body, make an empty dictionary: `counts = {}`.

3. Start a loop over the list: `for word in words:`. This line is in
   the body of the function, so it starts with four spaces.

4. The block of the loop has one line, which starts with eight spaces.
   It gives the key `word` a new value: the count until now, plus 1.
   The count until now is `counts.get(word, 0)`.

5. After the loop, with four spaces at the start of the line, give the
   dictionary back: `return counts`.

6. After the function, at the left side of the cell, write the two
   lines from the task.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: count-not-started
:check: count-words
:expect: The function count_words does not exist yet
```

````{attempt}
:id: count-not-a-function
:check: count-words
:expect: The name count_words is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
count_words = {}
```
````

````{attempt}
:id: count-two-parameters
:check: count-words
:expect: must have exactly one parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
def count_words(words, counts):
    for word in words:
        counts[word] = counts.get(word, 0) + 1
    return counts
```
````

````{attempt}
:id: count-key-error
:check: count-words
:expect: stopped with a KeyError

```{cell-insert}
:path: {{ notebook }}
:run: true
def count_words(words):
    counts = {}
    for word in words:
        counts[word] = counts[word] + 1
    return counts
```
````

````{attempt}
:id: count-other-error
:check: count-words
:expect: stopped with an error of the type NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def count_words(words):
    for word in words:
        tally[word] = tally.get(word, 0) + 1
    return tally
```
````

````{attempt}
:id: count-prints
:check: count-words
:expect: shows the dictionary with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def count_words(words):
    counts = {}
    for word in words:
        counts[word] = counts.get(word, 0) + 1
    print(counts)
```
````

````{attempt}
:id: count-no-return
:check: count-words
:expect: gives back None

```{cell-insert}
:path: {{ notebook }}
:run: true
def count_words(words):
    counts = {}
    for word in words:
        counts[word] = counts.get(word, 0) + 1
```
````

````{attempt}
:id: count-returns-number
:check: count-words
:expect: must give back a dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
def count_words(words):
    return len(words)
```
````

````{attempt}
:id: count-all-ones
:check: count-words
:expect: Every count in your dictionary is 1

```{cell-insert}
:path: {{ notebook }}
:run: true
def count_words(words):
    counts = {}
    for word in words:
        counts[word] = 1
    return counts
```
````

````{attempt}
:id: count-return-in-loop
:check: count-words
:expect: holds only the first word

```{cell-insert}
:path: {{ notebook }}
:run: true
def count_words(words):
    counts = {}
    for word in words:
        counts[word] = counts.get(word, 0) + 1
        return counts
```
````

````{attempt}
:id: count-wrong-numbers
:check: count-words
:expect: but it must give back

```{cell-insert}
:path: {{ notebook }}
:run: true
def count_words(words):
    counts = {}
    for word in words:
        counts[word] = counts.get(word, 1) + 1
    return counts
```
````

````{attempt}
:id: count-other-way
:check: count-words
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def count_words(words):
    counts = {}
    for word in words:
        if word in counts:
            counts[word] = counts[word] + 1
        else:
            counts[word] = 1
    return counts
hen_counts = count_words(clean_words(hen_fable))
print(hen_counts["hen"])
```
````

````{hint}
:title: Show me a solution
:unlock: "count-words" in failed_checks or "count-words" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-count-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [count-solution]
:run: true
def count_words(words):
    counts = {}
    for word in words:
        counts[word] = counts.get(word, 0) + 1
    return counts

hen_counts = count_words(clean_words(hen_fable))
print(hen_counts["hen"])
```
````

```{verify}
:id: count-words
:label: The function count_words gives back a dictionary of counts
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed count; cell-executed count-solution
def _workshop_check():
    import contextlib, io
    if "count_words" not in globals():
        print("The function count_words does not exist yet. Write it under the comment in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["count_words"]
    if not callable(function):
        print("The name count_words is not a function. It refers to another kind of value. Define the function with a line that starts with def count_words(words): and write the body under it. Then run the cell again.")
        return False
    tests = [
        (["the", "dog", "the", "hen", "the", "dog"], {"the": 3, "dog": 2, "hen": 1}),
        (["egg", "egg", "sea", "egg", "egg"], {"egg": 4, "sea": 1}),
        (["swan"], {"swan": 1}),
    ]
    for words, expected in tests:
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(list(words))
        except TypeError:
            print("The function count_words stopped with a TypeError when the check called it with one list of words. The function must have exactly one parameter: def count_words(words): and the body must use that parameter as a list. Correct the function, and run the cell again.")
            return False
        except KeyError:
            print("The function count_words stopped with a KeyError. That happens when the code reads counts[word] for a word that is not a key of the dictionary yet. Read the count with counts.get(word, 0) which gives 0 for a word that is not a key yet. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function count_words stopped with an error of the type {type(error).__name__} when the check called count_words({words!r}). Call the function in the same way in a cell of your own, and read the last line of the error message. Correct the function, and run the cell again.")
            return False
        if result is None and shown.getvalue().strip():
            print("The function count_words shows the dictionary with print(), but it does not return it. The code that calls the function then receives None. Replace print() in the last line of the body with return, so that the function gives the dictionary back. Then run the cell again.")
            return False
        if result is None:
            print("The function count_words gives back None. That happens when the body has no return line. After the loop, add a line that starts with four spaces and gives the dictionary back: return counts. Then run the cell again.")
            return False
        if not isinstance(result, dict):
            print(f"The function count_words must give back a dictionary, but count_words({words!r}) gives {result!r}. Make an empty dictionary before the loop, add each word to it inside the loop, and return the dictionary after the loop. Then run the cell again.")
            return False
        if result == expected:
            continue
        if len(words) > 1 and result == {words[0]: 1}:
            print(f"count_words({words!r}) gives {result!r}. The dictionary holds only the first word. That happens when the return line is inside the loop, so the function stops in the first pass. The return line must start with four spaces, and not with eight. Then run the cell again.")
            return False
        if len(words) > 1 and set(result) == set(expected) and all(count == 1 for count in result.values()):
            print(f"count_words({words!r}) gives {result!r}. Every count in your dictionary is 1. That happens when the line inside the loop gives each key the value 1. It must add 1 to the count until now: counts[word] = counts.get(word, 0) + 1. Then run the cell again.")
            return False
        print(f"count_words({words!r}) gives {result!r} but it must give back {expected!r}. Each key must be a word of the list, and its value must be the number of times that the word is in the list. Start each count at 0 with counts.get(word, 0) and add 1 in each pass of the loop. Then run the cell again.")
        return False
    print("Correct. The function count_words gives back a dictionary that holds each word and the number of times that it is in the list.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

You have two functions that work together. `clean_words` turns a text
into a list of words, and `count_words` turns a list of words into a
dictionary of counts. In the fable about the woman and her hen, the
word "hen" is there three times.
