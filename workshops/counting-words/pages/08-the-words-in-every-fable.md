---
title: "Part 6: the words in every fable"
requires: [verify:shared-words]
---

# Part 6: the words in every fable

The last question of this workshop is which words are in every one of
the five fables. This part uses sets.

A **set** holds values with no duplicates and in no order. `set()`
with a list between the parentheses gives a set of the values of the
list, each one time only. The operator `&` takes two sets, and makes a
new set from the values that are in both.

## The goal

Write a function named `shared_words`. It takes a dictionary of titles
and texts, and it gives back a set of the words that are in every
text.

## What your code must do

- The function `shared_words` has one parameter, named `stories`. The
  value that it receives is a dictionary such as `fables`: each key is
  a title, and each value is a text.

- The function makes a set of the clean words of each text. Use your
  function `clean_words` to make the words clean.

- The function gives back a set. A word is in that set only when it is
  in every one of the texts.

- The function gives the set back with `return`. It does not print the
  set.

- After the function, the last line of the cell is
  `print(sorted(shared_words(fables)))`. A set has no order, so the
  line uses `sorted()` to show the words as a list in alphabetical
  order.

For example, when the name `sample` refers to this dictionary:

```python
sample = {
    "One": "The fox and THE hen.",
    "Two": "A hen; the dog, and a fox.",
    "Three": "The Hen, the dog and the fox: the end.",
}
```

the call `shared_words(sample)` must give back a set that holds these
four words: `'and'`, `'fox'`, `'hen'` and `'the'`. The word `'dog'` is
not in the set, because it is in two of the texts only.

When your code is correct, the output under the cell is:

```
['a', 'and', 'of', 'the', 'to']
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-shared
:title: Add a cell for part 6
:path: {{ notebook }}
:tags: [shared]
:run: false
# Part 6: the words in every fable. Write your code below this line.

```

Write your code under the comment, and run the cell. The check calls
your function with two small dictionaries of its own.

## If you need help

```{hint}
:title: Hint: what to look at
The workshop **Pairs and unique things** taught sets. The third
question on the first page of this workshop has an example of `&`.

`set(clean_words(text))` is the set of the words of one text.

With three sets, `first & second & third` gives the values that are in
all three. Your function does not know how many texts there are, so it
does the same work in a loop: a name refers to the words that every
text until now has shared, and each pass gives that name a new value
with `&`.

The difficult question is the first value of that name. An empty set
does not work, because nothing is in both an empty set and another
set. The first value must be the set of the words of one of the texts.
```

```{hint}
:title: Hint: the shape of the code
1. The first line defines the function: `def shared_words(stories):`.

2. In the body, make a list that holds one set for each text. Start
   with an empty list: `word_sets = []`.

3. Write a loop: `for text in stories.values():`. Its block has one
   line, which appends the set of the words of the text:
   `word_sets.append(set(clean_words(text)))`.

4. After that loop, give the name `shared` its first value, which is
   the first set of the list: `shared = word_sets[0]`.

5. Write a second loop: `for words in word_sets:`. Its block has one
   line, which keeps only the words that are also in this set:
   `shared = shared & words`.

6. After the second loop, with four spaces at the start of the line,
   give the set back: `return shared`.

7. After the function, at the left side of the cell, write
   `print(sorted(shared_words(fables)))`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: shared-not-started
:check: shared-words
:expect: The function shared_words does not exist yet
```

````{attempt}
:id: shared-not-a-function
:check: shared-words
:expect: The name shared_words is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
shared_words = set(clean_words(dog_fable)) & set(clean_words(hen_fable))
```
````

````{attempt}
:id: shared-no-parameter
:check: shared-words
:expect: must have exactly one parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
def shared_words():
    return set(clean_words(dog_fable)) & set(clean_words(hen_fable))
```
````

````{attempt}
:id: shared-name-error
:check: shared-words
:expect: uses a name that has no value yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def shared_words(stories):
    for text in stories.values():
        shared = shared & set(clean_words(text))
    return shared
```
````

````{attempt}
:id: shared-index-error
:check: shared-words
:expect: stopped with an error of the type IndexError

```{cell-insert}
:path: {{ notebook }}
:run: true
def shared_words(stories):
    word_sets = []
    for text in stories.values():
        word_sets.append(set(clean_words(text)))
    return word_sets[len(word_sets)]
```
````

````{attempt}
:id: shared-prints
:check: shared-words
:expect: shows the words with print(), but it does not return them

```{cell-insert}
:path: {{ notebook }}
:run: true
def shared_words(stories):
    word_sets = []
    for text in stories.values():
        word_sets.append(set(clean_words(text)))
    shared = word_sets[0]
    for words in word_sets:
        shared = shared & words
    print(sorted(shared))
```
````

````{attempt}
:id: shared-no-return
:check: shared-words
:expect: gives back None

```{cell-insert}
:path: {{ notebook }}
:run: true
def shared_words(stories):
    word_sets = []
    for text in stories.values():
        word_sets.append(set(clean_words(text)))
    shared = word_sets[0]
    for words in word_sets:
        shared = shared & words
```
````

````{attempt}
:id: shared-returns-list
:check: shared-words
:expect: These are the correct words, but the function must give back a set

```{cell-insert}
:path: {{ notebook }}
:run: true
def shared_words(stories):
    word_sets = []
    for text in stories.values():
        word_sets.append(set(clean_words(text)))
    shared = word_sets[0]
    for words in word_sets:
        shared = shared & words
    return sorted(shared)
```
````

````{attempt}
:id: shared-returns-number
:check: shared-words
:expect: must give back a set of words

```{cell-insert}
:path: {{ notebook }}
:run: true
def shared_words(stories):
    word_sets = []
    for text in stories.values():
        word_sets.append(set(clean_words(text)))
    shared = word_sets[0]
    for words in word_sets:
        shared = shared & words
    return len(shared)
```
````

````{attempt}
:id: shared-empty-start
:check: shared-words
:expect: gives back an empty set

```{cell-insert}
:path: {{ notebook }}
:run: true
def shared_words(stories):
    shared = set()
    for text in stories.values():
        shared = shared & set(clean_words(text))
    return shared
```
````

````{attempt}
:id: shared-not-clean
:check: shared-words
:expect: That happens when the words are not clean

```{cell-insert}
:path: {{ notebook }}
:run: true
def shared_words(stories):
    word_sets = []
    for text in stories.values():
        word_sets.append(set(text.split()))
    shared = word_sets[0]
    for words in word_sets:
        shared = shared & words
    return shared
```
````

````{attempt}
:id: shared-either
:check: shared-words
:expect: These are all the words of all the texts

```{cell-insert}
:path: {{ notebook }}
:run: true
def shared_words(stories):
    shared = set()
    for text in stories.values():
        shared = shared | set(clean_words(text))
    return shared
```
````

````{attempt}
:id: shared-last-two
:check: shared-words
:expect: is not in every text

```{cell-insert}
:path: {{ notebook }}
:run: true
def shared_words(stories):
    word_sets = []
    for text in stories.values():
        word_sets.append(set(clean_words(text)))
    return word_sets[-1] & word_sets[-2]
```
````

````{attempt}
:id: shared-too-few
:check: shared-words
:expect: is in every text, but it is missing

```{cell-insert}
:path: {{ notebook }}
:run: true
def shared_words(stories):
    word_sets = []
    for text in stories.values():
        word_sets.append(set(clean_words(text)))
    shared = word_sets[0]
    for words in word_sets:
        shared = shared & words
    return shared & {"and", "the"}
```
````

````{attempt}
:id: shared-other-way
:check: shared-words
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def shared_words(stories):
    all_text = ""
    for text in stories.values():
        all_text = all_text + " " + text
    shared = set(clean_words(all_text))
    for text in stories.values():
        shared = shared & set(clean_words(text))
    return shared
print(sorted(shared_words(fables)))
```
````

````{hint}
:title: Show me a solution
:unlock: "shared-words" in failed_checks or "shared-words" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-shared-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [shared-solution]
:run: true
def shared_words(stories):
    word_sets = []
    for text in stories.values():
        word_sets.append(set(clean_words(text)))
    shared = word_sets[0]
    for words in word_sets:
        shared = shared & words
    return shared

print(sorted(shared_words(fables)))
```
````

```{verify}
:id: shared-words
:label: The function shared_words gives back the words that are in every text
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed shared; cell-executed shared-solution
def _workshop_check():
    import contextlib, io
    if "shared_words" not in globals():
        print("The function shared_words does not exist yet. Write it under the comment in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["shared_words"]
    if not callable(function):
        print("The name shared_words is not a function. It refers to another kind of value. Define the function with a line that starts with def shared_words(stories): and write the body under it. Then run the cell again.")
        return False
    first = {
        "One": "The fox and THE hen.",
        "Two": "A hen; the dog, and a fox.",
        "Three": "The Hen, the dog and the fox: the end.",
    }
    second = {
        "Sun": "Hot and dry.",
        "Moon": "Cold and far.",
    }
    for stories, expected in [(first, {"and", "fox", "hen", "the"}), (second, {"and"})]:
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(dict(stories))
        except TypeError:
            print("The function shared_words stopped with a TypeError when the check called it with one dictionary. The function must have exactly one parameter: def shared_words(stories): and the operator & must have a set on each side. Correct the function, and run the cell again.")
            return False
        except NameError:
            print("The function shared_words stopped because it uses a name that has no value yet. The name that holds the shared words must have a first value before the loop that uses it with the operator &. Check also the spelling of each name in the body, and that your function clean_words exists. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function shared_words stopped with an error of the type {type(error).__name__} when the check called it with the dictionary {stories!r}. Call the function in a cell of your own, with shared_words(fables), and read the last line of the error message. Correct the function, and run the cell again.")
            return False
        where = f"When sample is {stories!r}, shared_words(sample)"
        if result is None and shown.getvalue().strip():
            print("The function shared_words shows the words with print(), but it does not return them. The code that calls the function then receives None. Replace print() in the last line of the body with return, so that the function gives the set back. Then run the cell again.")
            return False
        if result is None:
            print("The function shared_words gives back None. That happens when the body has no return line. After the loop, add a line that starts with four spaces and gives the set back. Then run the cell again.")
            return False
        if isinstance(result, (list, tuple)) and len(result) == len(expected) and all(word in expected for word in result):
            print(f"{where} gives {result!r}. These are the correct words, but the function must give back a set, and not a list. Return the set itself. Use sorted() only in the line with print(), after the function. Then run the cell again.")
            return False
        if not isinstance(result, set):
            print(f"The function shared_words must give back a set of words, but {where[0].lower() + where[1:]} gives {result!r}. Return the set that the operator & made. Then run the cell again.")
            return False
        if result == expected:
            continue
        found = sorted(result, key=repr)
        if len(result) == 0:
            print(f"{where} gives back an empty set, but it must give back a set that holds the words {sorted(expected)!r}. That happens when the first value of the name that holds the shared words is an empty set. Nothing is in both an empty set and another set. Start with the set of the words of one text. Then run the cell again.")
            return False
        raw = None
        union = set()
        for text in stories.values():
            raw = set(text.split()) if raw is None else raw & set(text.split())
            for mark in ".,;:":
                text = text.replace(mark, "")
            union = union | set(text.lower().split())
        if result == raw:
            print(f"{where} gives a set that holds the words {found!r}, but it must hold the words {sorted(expected)!r}. That happens when the words are not clean: for Python, the strings The and the are different words. Make each set from the list that clean_words gives back: set(clean_words(text)). Then run the cell again.")
            return False
        if result == union:
            print(f"{where} gives a set that holds the words {found!r}, but it must hold the words {sorted(expected)!r}. These are all the words of all the texts. The operator | gives the values that are in one set or in the other. Use the operator & which gives only the values that are in both. Then run the cell again.")
            return False
        extra = [word for word in found if word not in expected]
        missing = [word for word in sorted(expected) if word not in result]
        if extra:
            print(f"{where} gives a set that holds the words {found!r}, but it must hold the words {sorted(expected)!r}. The value {extra[0]!r} is not in every text. Check that the loop uses the operator & with the set of every text, and not only with some of the texts. Then run the cell again.")
            return False
        print(f"{where} gives a set that holds the words {found!r}, but it must hold the words {sorted(expected)!r}. The word {missing[0]!r} is in every text, but it is missing. Check that each set holds all the clean words of its text. Then run the cell again.")
        return False
    print("Correct. The function shared_words gives back a set of the words that are in every text.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

Only five words are in every one of the five fables: "a", "and", "of",
"the" and "to". They are small words that almost every text in English
uses. Your program has now answered all three questions.
