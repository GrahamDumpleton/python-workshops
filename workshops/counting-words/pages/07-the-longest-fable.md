---
title: "Part 5: the longest fable"
requires: [verify:longest-fable]
---

# Part 5: the longest fable

The second question of this workshop is which fable is the longest. In
this part, the length of a fable is its number of words.

## The goal

Write a function named `longest_fable`. It takes a dictionary of
titles and texts, and it gives back the title of the text that has the
most words.

## What your code must do

- The function `longest_fable` has one parameter, named `stories`. The
  value that it receives is a dictionary such as `fables`: each key is
  a title, and each value is a text.

- The function counts the words of each text. `len()` of the list that
  `clean_words` gives back is the number of words of a text.

- The function gives back the title of the text that has the most
  words. The title is a string, and it is a key of the dictionary.

- The function gives the title back with `return`. It does not print
  the title.

- The function reads its data from the parameter `stories`, and not
  from the name `fables`, so that it works for every dictionary of
  this kind.

- After the function, the last line of the cell is
  `print(longest_fable(fables))`.

For example, when the name `sample` refers to this dictionary:

```python
sample = {
    "Sun": "Hot",
    "Moon": "Cold and far away",
    "Star": "Small light",
}
```

the call `longest_fable(sample)` must give back `'Moon'`, because that
text has four words and the other texts have fewer.

The check uses dictionaries in which one text has more words than
every other text. You do not need to think about two texts that have
the same number of words.

When your code is correct, the output under the cell is:

```
The Swan and the Goose
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-longest
:title: Add a cell for part 5
:path: {{ notebook }}
:tags: [longest]
:run: false
# Part 5: the longest fable. Write your code below this line.

```

Write your code under the comment, and run the cell. The check calls
your function with two small dictionaries of its own.

## If you need help

```{hint}
:title: Hint: what to look at
The workshop **Doing it again** showed how to find the largest value
with a loop. A name remembers the largest value that the loop has seen
until now. It starts at 0. In each pass, an `if` compares the new
value with it, and replaces it when the new value is larger.

Here the function must give back a title, and not a number. So it
needs two names: one for the largest number of words until now, and
one for the title that belongs to that number. When the `if` is true,
its block gives both names a new value.

`for title, text in stories.items():` gives each key and its value
together.
```

```{hint}
:title: Hint: the shape of the code
1. The first line defines the function: `def longest_fable(stories):`.

2. In the body, give two names their first values:
   `longest_title = ""` and `longest_length = 0`.

3. Start the loop: `for title, text in stories.items():`.

4. Inside the loop, count the words of this text:
   `length = len(clean_words(text))`.

5. Then write an `if` line that tests whether `length` is larger than
   `longest_length`. Its block has two lines, which start with twelve
   spaces. They give `longest_length` the value of `length`, and
   `longest_title` the value of `title`.

6. After the loop, with four spaces at the start of the line, give the
   title back: `return longest_title`.

7. After the function, at the left side of the cell, write
   `print(longest_fable(fables))`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: longest-not-started
:check: longest-fable
:expect: The function longest_fable does not exist yet
```

````{attempt}
:id: longest-not-a-function
:check: longest-fable
:expect: The name longest_fable is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
longest_fable = "The Swan and the Goose"
```
````

````{attempt}
:id: longest-no-parameter
:check: longest-fable
:expect: must have exactly one parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
def longest_fable():
    return "The Swan and the Goose"
```
````

````{attempt}
:id: longest-other-error
:check: longest-fable
:expect: uses a name that has no value yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def longest_fable(stories):
    for title, text in stories.items():
        if len(clean_words(text)) > longest_size:
            longest_size = len(clean_words(text))
            longest_name = title
    return longest_name
```
````

````{attempt}
:id: longest-index-error
:check: longest-fable
:expect: stopped with an error of the type IndexError

```{cell-insert}
:path: {{ notebook }}
:run: true
def longest_fable(stories):
    titles = sorted(stories)
    return titles[len(titles)]
```
````

````{attempt}
:id: longest-prints
:check: longest-fable
:expect: shows the title with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def longest_fable(stories):
    longest_title = ""
    longest_length = 0
    for title, text in stories.items():
        length = len(clean_words(text))
        if length > longest_length:
            longest_length = length
            longest_title = title
    print(longest_title)
```
````

````{attempt}
:id: longest-no-return
:check: longest-fable
:expect: gives back None

```{cell-insert}
:path: {{ notebook }}
:run: true
def longest_fable(stories):
    longest_title = ""
    longest_length = 0
    for title, text in stories.items():
        length = len(clean_words(text))
        if length > longest_length:
            longest_length = length
            longest_title = title
```
````

````{attempt}
:id: longest-returns-number
:check: longest-fable
:expect: That is a number of words

```{cell-insert}
:path: {{ notebook }}
:run: true
def longest_fable(stories):
    longest_title = ""
    longest_length = 0
    for title, text in stories.items():
        length = len(clean_words(text))
        if length > longest_length:
            longest_length = length
            longest_title = title
    return longest_length
```
````

````{attempt}
:id: longest-returns-text
:check: longest-fable
:expect: That is the text

```{cell-insert}
:path: {{ notebook }}
:run: true
def longest_fable(stories):
    longest_text = ""
    longest_length = 0
    for title, text in stories.items():
        length = len(clean_words(text))
        if length > longest_length:
            longest_length = length
            longest_text = text
    return longest_text
```
````

````{attempt}
:id: longest-characters
:check: longest-fable
:expect: has the most characters

```{cell-insert}
:path: {{ notebook }}
:run: true
def longest_fable(stories):
    longest_title = ""
    longest_length = 0
    for title, text in stories.items():
        length = len(text)
        if length > longest_length:
            longest_length = length
            longest_title = title
    return longest_title
```
````

````{attempt}
:id: longest-last-title
:check: longest-fable
:expect: That is the last title of the dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
def longest_fable(stories):
    longest_title = ""
    longest_length = 0
    for title, text in stories.items():
        length = len(clean_words(text))
        if length > longest_length:
            longest_length = length
        longest_title = title
    return longest_title
```
````

````{attempt}
:id: longest-shortest
:check: longest-fable
:expect: but it must give back

```{cell-insert}
:path: {{ notebook }}
:run: true
def longest_fable(stories):
    longest_title = ""
    longest_length = 1000
    for title, text in stories.items():
        length = len(clean_words(text))
        if length < longest_length:
            longest_length = length
            longest_title = title
    return longest_title
```
````

````{attempt}
:id: longest-other-way
:check: longest-fable
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def longest_fable(stories):
    best = ""
    for title in stories:
        if best == "" or len(stories[title].split()) > len(stories[best].split()):
            best = title
    return best
print(longest_fable(fables))
```
````

````{hint}
:title: Show me a solution
:unlock: "longest-fable" in failed_checks or "longest-fable" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-longest-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [longest-solution]
:run: true
def longest_fable(stories):
    longest_title = ""
    longest_length = 0
    for title, text in stories.items():
        length = len(clean_words(text))
        if length > longest_length:
            longest_length = length
            longest_title = title
    return longest_title

print(longest_fable(fables))
```
````

```{verify}
:id: longest-fable
:label: The function longest_fable gives back the title of the longest text
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed longest; cell-executed longest-solution
def _workshop_check():
    import contextlib, io
    if "longest_fable" not in globals():
        print("The function longest_fable does not exist yet. Write it under the comment in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["longest_fable"]
    if not callable(function):
        print("The name longest_fable is not a function. It refers to another kind of value. Define the function with a line that starts with def longest_fable(stories): and write the body under it. Then run the cell again.")
        return False
    first = {
        "Sun": "Hot",
        "Moon": "Cold and far away",
        "Star": "Small light",
    }
    second = {
        "One": "It is a hen, a dog and a fox.",
        "Two": "Extraordinarily magnificent birdcatchers",
        "Three": "Stop.",
        "Four": "The end of it",
    }
    for name, stories, expected in [("sample", first, "Moon"), ("sample", second, "One")]:
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(dict(stories))
        except TypeError:
            print("The function longest_fable stopped with a TypeError when the check called it with one dictionary. The function must have exactly one parameter: def longest_fable(stories): and the body must use that parameter as a dictionary of titles and texts. Correct the function, and run the cell again.")
            return False
        except NameError:
            print("The function longest_fable stopped because it uses a name that has no value yet. A name that the if line compares must have a first value before the loop, for example longest_length = 0. Check also the spelling of each name in the body, and that your function clean_words exists. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function longest_fable stopped with an error of the type {type(error).__name__} when the check called it with the dictionary {stories!r}. Call the function in a cell of your own, with longest_fable(fables), and read the last line of the error message. Correct the function, and run the cell again.")
            return False
        where = f"When {name} is {stories!r}, longest_fable({name})"
        if result is None and shown.getvalue().strip():
            print("The function longest_fable shows the title with print(), but it does not return it. The code that calls the function then receives None. Replace print() in the last line of the body with return, so that the function gives the title back. Then run the cell again.")
            return False
        if result is None:
            print("The function longest_fable gives back None. That happens when the body has no return line. After the loop, add a line that starts with four spaces and gives the title back. Then run the cell again.")
            return False
        if result == expected:
            continue
        if isinstance(result, (int, float)):
            print(f"{where} gives {result!r}. That is a number of words, but the function must give back the title of the text, which is {expected!r}. Remember the title in a second name when the if line finds a longer text, and return that name. Then run the cell again.")
            return False
        if result in stories.values():
            print(f"{where} gives {result!r}. That is the text, but the function must give back the title of the text, which is {expected!r}. The title is the key of the dictionary. Then run the cell again.")
            return False
        if stories is second and result == "Two":
            print(f"{where} gives {result!r} but it must give back {expected!r}. The text of {result!r} has the most characters, but it has only 3 words. len() of a string counts characters. Count the words: len(clean_words(text)). Then run the cell again.")
            return False
        if result == list(stories)[-1]:
            print(f"{where} gives {result!r} but it must give back {expected!r}. That is the last title of the dictionary. That happens when the line that remembers the title is not inside the block of the if line, so it runs in every pass. Then run the cell again.")
            return False
        print(f"{where} gives {result!r} but it must give back {expected!r}, which is the title of the text that has the most words. Check that the if line tests whether the new number of words is larger than the largest until now, and that its block remembers both the number and the title. Then run the cell again.")
        return False
    print("Correct. The function longest_fable gives back the title of the text that has the most words.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

The longest of the five fables is "The Swan and the Goose", which has
96 words. Your function found it with the same pattern that finds the
largest number in a list.
