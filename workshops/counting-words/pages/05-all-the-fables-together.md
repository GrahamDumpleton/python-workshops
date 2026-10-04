---
title: "Part 3: all the fables together"
requires: [verify:all-totals]
---

# Part 3: all the fables together

Your two functions work on one text. In this part you use them to
count the words of all five fables together. You write no new function
in this part: you call the two functions that you have.

## The goal

Make a list named `all_words` that holds the clean words of all five
fables. Then make a dictionary named `totals` that holds how many
times each word is in that list.

## What your code must do

- It reads the dictionary `fables`. Each value of that dictionary is
  the text of one fable.

- It makes a list named `all_words`. The list holds every clean word
  of every fable. A word that is in the fables many times is in the
  list many times. The order of the words in the list is not
  important.

- It makes a dictionary named `totals`. Each key is a word, and its
  value is the number of times that the word is in `all_words`.

- It uses your functions `clean_words` and `count_words`. Do not write
  their lines a second time.

- It does not name the five fables one by one. It reads them from
  `fables` with a loop, so that the code still works when the
  dictionary holds more fables.

- Its last three lines show how many words the fables have together,
  how many different words they have, and how many times the word
  "the" is in them:

  ```python
  print(len(all_words))
  print(len(totals))
  print(totals["the"])
  ```

When your code is correct, the output under the cell is:

```
346
171
28
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-totals
:title: Add a cell for part 3
:path: {{ notebook }}
:tags: [totals]
:run: false
# Part 3: all the fables together. Write your code below this line.

```

Write your code under the comment, and run the cell.

## If you need help

```{hint}
:title: Hint: what to look at
One way is to join the five texts into one long string, and then to
give that string to `clean_words`.

The workshop **Looping over anything** showed that
`for text in fables.values():` gives each value of a dictionary in
turn. Here each value is the text of one fable.

The workshop **Working with text** showed that the operator `+` joins
two strings. A string can grow in a loop in the same way as a total
grows in a loop: it starts as the empty string `""`, and each pass
adds one text to it.

Be careful where two texts meet. Without a space between them, the
last word of one fable and the first word of the next fable become one
word.
```

```{hint}
:title: Hint: the shape of the code
1. Start with an empty string: `all_text = ""`.

2. Start the loop: `for text in fables.values():`.

3. The block of the loop has one line. It gives `all_text` a new value
   that is its old value, then a space, then the text:
   `all_text = all_text + " " + text`.

4. After the loop, at the left side of the cell, call your first
   function with the long string, and give the name `all_words` to the
   result.

5. Call your second function with `all_words`, and give the name
   `totals` to the result.

6. Write the three lines with `print()` from the task.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: totals-not-started
:check: all-totals
:expect: The name all_words does not exist yet
```

````{attempt}
:id: totals-no-fables
:check: all-totals
:expect: The dictionary fables is missing

```{cell-insert}
:path: {{ notebook }}
:run: true
del fables
```
````

````{attempt}
:id: totals-not-a-list
:check: all-totals
:expect: must refer to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
fables = {
    "The Dog and the Shadow": dog_fable,
    "The Fisherman and His Nets": fisherman_fable,
    "The Woman and Her Hen": hen_fable,
    "The Geese and the Cranes": geese_fable,
    "The Swan and the Goose": swan_fable,
}
all_words = dog_fable.lower()
```
````

````{attempt}
:id: totals-empty
:check: all-totals
:expect: The list all_words is empty

```{cell-insert}
:path: {{ notebook }}
:run: true
all_words = []
```
````

````{attempt}
:id: totals-lists-inside
:check: all-totals
:expect: holds lists

```{cell-insert}
:path: {{ notebook }}
:run: true
all_words = []
for text in fables.values():
    all_words.append(clean_words(text))
```
````

````{attempt}
:id: totals-not-clean
:check: all-totals
:expect: is not a clean word

```{cell-insert}
:path: {{ notebook }}
:run: true
all_text = ""
for text in fables.values():
    all_text = all_text + " " + text
all_words = all_text.split()
```
````

````{attempt}
:id: totals-no-space
:check: all-totals
:expect: two words that are joined

```{cell-insert}
:path: {{ notebook }}
:run: true
all_text = ""
for text in fables.values():
    all_text = all_text + text
all_words = clean_words(all_text)
```
````

````{attempt}
:id: totals-last-fable
:check: all-totals
:expect: The list all_words holds 96 words

```{cell-insert}
:path: {{ notebook }}
:run: true
for text in fables.values():
    all_words = clean_words(text)
```
````

````{attempt}
:id: totals-other-words
:check: all-totals
:expect: does not hold the same words

```{cell-insert}
:path: {{ notebook }}
:run: true
all_text = ""
for text in fables.values():
    all_text = all_text + " " + text
all_words = clean_words(all_text)
all_words[0] = "zebra"
```
````

````{attempt}
:id: totals-no-totals
:check: all-totals
:expect: The name totals does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
all_text = ""
for text in fables.values():
    all_text = all_text + " " + text
all_words = clean_words(all_text)
print(len(all_words))
```
````

````{attempt}
:id: totals-not-a-dictionary
:check: all-totals
:expect: must refer to a dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
totals = len(all_words)
```
````

````{attempt}
:id: totals-one-fable
:check: all-totals
:expect: but the count of that word in the list all_words is

```{cell-insert}
:path: {{ notebook }}
:run: true
totals = count_words(clean_words(dog_fable))
```
````

````{attempt}
:id: totals-missing-key
:check: all-totals
:expect: does not have the key

```{cell-insert}
:path: {{ notebook }}
:run: true
totals = {"the": 28}
```
````

````{attempt}
:id: totals-extra-key
:check: all-totals
:expect: which is not a word in the list all_words

```{cell-insert}
:path: {{ notebook }}
:run: true
totals = count_words(all_words)
totals["zebra"] = 1
```
````

````{attempt}
:id: totals-other-way
:check: all-totals
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
all_words = []
for text in fables.values():
    for word in clean_words(text):
        all_words.append(word)
totals = count_words(all_words)
print(len(all_words))
print(len(totals))
print(totals["the"])
```
````

````{hint}
:title: Show me a solution
:unlock: "all-totals" in failed_checks or "all-totals" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-totals-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [totals-solution]
:run: true
all_text = ""
for text in fables.values():
    all_text = all_text + " " + text
all_words = clean_words(all_text)
totals = count_words(all_words)
print(len(all_words))
print(len(totals))
print(totals["the"])
```
````

```{verify}
:id: all-totals
:label: The dictionary totals counts the words of all the fables
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed totals; cell-executed totals-solution
def _workshop_check():
    def clean(text):
        text = text.lower()
        for mark in ".,;:":
            text = text.replace(mark, "")
        return text.split()
    data = globals().get("fables")
    if not (isinstance(data, dict) and len(data) > 0 and all(isinstance(text, str) for text in data.values())):
        print("The dictionary fables is missing, or it has changed so that its values are not texts. Return to the page The fables, and click the first action on that page again. It adds a new cell that holds the fables, and runs it. Then return to this page and run your cell again.")
        return False
    expected = clean(" ".join(data.values()))
    if "all_words" not in globals():
        print("The name all_words does not exist yet. Write your code under the comment in the new cell, and check the spelling of the name. Then hold Shift and press Enter to run the cell.")
        return False
    words = globals()["all_words"]
    if not isinstance(words, list):
        print("The name all_words must refer to a list, but it refers to another kind of value. Your function clean_words gives back a list, so give the name all_words to the result of a call of clean_words. Then run the cell again.")
        return False
    if len(words) == 0:
        print("The list all_words is empty. It must hold the clean words of every fable. Join the texts of the fables in a loop, and give the long string to clean_words. Then run the cell again.")
        return False
    if any(isinstance(word, list) for word in words):
        print(f"The list all_words holds lists, and not words. It has {len(words)} values, and each one is a list. That happens when append is given the complete list of the words of one fable. The second hint shows another way: join the texts into one string first, and call clean_words one time. Then run the cell again.")
        return False
    if not all(isinstance(word, str) for word in words):
        print("The list all_words must hold only strings, but it holds a value that is not a string. Give the name all_words to the list that clean_words gives back. Then run the cell again.")
        return False
    if sorted(words) != sorted(expected):
        dirty = [word for word in words if word != word.lower() or any(mark in word for mark in ".,;:")]
        joined = [word for word in words if word not in expected]
        if dirty:
            print(f"The list all_words holds {dirty[0]!r}, which is not a clean word. A clean word has small letters only and no punctuation marks. Use your function clean_words to make the list, and not split() alone. Then run the cell again.")
        elif sorted(words) == sorted(clean("".join(data.values()))):
            print(f"The list all_words holds {joined[0]!r}, which is two words that are joined. That happens when the texts are joined with no space between them. Add a space each time: all_text = all_text + \" \" + text. Then run the cell again.")
        elif len(words) != len(expected):
            print(f"The list all_words holds {len(words)} words, but the {len(data)} fables hold {len(expected)} words together. When the list is too short, check that the loop adds the text of every fable, and that it does not replace what the earlier passes added. When the list is too long, check that the line that makes the empty start value is in the same cell as the loop, above it. Then run the cell again.")
        else:
            print("The list all_words does not hold the same words as the fables. Do not change the list after clean_words has made it. Run your cell again from its first line.")
        return False
    if "totals" not in globals():
        print("The list all_words is correct. The name totals does not exist yet. Call your function count_words with the list all_words, and give the name totals to the result. Then run the cell again.")
        return False
    counts = globals()["totals"]
    if not isinstance(counts, dict):
        print(f"The name totals must refer to a dictionary, but it refers to the value {counts!r}. Your function count_words gives back a dictionary: totals = count_words(all_words). Then run the cell again.")
        return False
    expected_counts = {}
    for word in expected:
        expected_counts[word] = expected_counts.get(word, 0) + 1
    if counts == expected_counts:
        print(f"Correct. The {len(data)} fables hold {len(words)} words together, and {len(counts)} different words.")
        return True
    wrong = [word for word in expected_counts if counts.get(word) != expected_counts[word]]
    extra = [word for word in counts if word not in expected_counts]
    if wrong and wrong[0] not in counts:
        print(f"The dictionary totals does not have the key {wrong[0]!r}, but the count of that word in the list all_words is {expected_counts[wrong[0]]}. Make the dictionary with your function: totals = count_words(all_words). Then run the cell again.")
    elif wrong:
        print(f"The dictionary totals gives {counts[wrong[0]]!r} for the word {wrong[0]!r}, but the count of that word in the list all_words is {expected_counts[wrong[0]]}. Call count_words with the complete list: totals = count_words(all_words). Then run the cell again.")
    else:
        print(f"The dictionary totals has the key {extra[0]!r}, which is not a word in the list all_words. Make the dictionary with your function, and do not add other keys to it: totals = count_words(all_words). Then run the cell again.")
    return False
globals().pop("_workshop_check")()
```

## What you have now

The five fables hold 346 words together, but only 171 different words.
The dictionary `totals` knows how many times each of those 171 words
is in the fables. The next part uses it to find the most common words.
