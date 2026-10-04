---
title: "Part 1: a list of clean words"
requires: [verify:clean-words]
---

# Part 1: a list of clean words

From this page on, you write the code. Each page gives you one part of
the program: the goal, what the result must be, and a new cell to
write in. No page gives you the code, but every page has hints.

## The goal

Write a function named `clean_words`. It takes the text of a fable,
and it gives back a list of the words of that text. Every word in the
list has small letters only, and has no punctuation marks.

A function is a group of lines that has a name. You define it one
time with `def`, and you can then call it many times. Your program
needs these lines five times, one time for each fable, so you write
them one time as a function.

## What your code must do

- The function `clean_words` has one **parameter**, named `text`. A
  parameter is a name in the `def` line that receives the value given
  in the call. Here that value is a string.

- The function changes every capital letter to a small letter.

- The function removes these four punctuation marks: `.` and `,` and
  `;` and `:`.

- The function divides the text into words, at the spaces and at the
  ends of the lines.

- The function gives the list of words back with `return`. It does not
  print the list.

- The function must work for every text, and not only for the five
  fables. Do not use the names of the fables inside the function. Use
  the parameter `text`.

- After the function, the last line of the cell is
  `print(clean_words(geese_fable)[:8])`. It calls your function with
  one fable, and shows the first 8 words of the result.

For example, the call `clean_words("The Hen, the Dog; and THE end.")`
must give back this list:

```
['the', 'hen', 'the', 'dog', 'and', 'the', 'end']
```

When your code is correct, the output under the cell is:

```
['the', 'geese', 'and', 'the', 'cranes', 'were', 'feeding', 'in']
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-clean
:title: Add a cell for part 1
:path: {{ notebook }}
:tags: [clean]
:run: false
# Part 1: a list of clean words. Write your code below this line.

```

Click on the empty line under the comment, and write your code. Then
run the cell: hold `Shift` and press `Enter`. The check at the bottom
of this page runs each time you run the cell. It calls your function
with three short texts of its own, and it tells you what your function
gave back.

If you see an error message, or the check does not pass, change your
code and run the cell again. You can try as many times as you like.

## If you need help

```{hint}
:title: Hint: what to look at
You need three methods of a string. The workshop **Working with
text** taught all three. A method is a function that belongs to a
value. You write it after the value, with a dot.

- `text.lower()` gives a copy of the string with every letter small.

- `text.replace(",", "")` gives a copy of the string with every comma
  removed. It replaces each comma with `""`, which is a string that
  holds nothing.

- `text.split()` gives a list of the words.

Remember that a string never changes. Each of these methods gives back
a new string, or a new list. If you do not give a name to the result,
Python forgets it.
```

```{hint}
:title: Hint: the shape of the code
1. The first line defines the function: `def clean_words(text):`.
   Every line of the body starts with four spaces.

2. Give the name `text` a new value that has small letters only:
   `text = text.lower()`.

3. Remove one punctuation mark in the same way:
   `text = text.replace(".", "")`. Write a line like this one for each
   of the four marks.

4. The last line of the body gives back the list of words. It starts
   with `return`, and then it calls `split()` on `text`.

5. After the function, at the left side of the cell, write
   `print(clean_words(geese_fable)[:8])`.

There is a shorter way to write step 3. A `for` loop over a string
gives each character of the string in turn, so
`for mark in ".,;:":` repeats its block one time for each mark. The
block is then one line: `text = text.replace(mark, "")`.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first. It names the type of
the error.

An `IndentationError` means that the spaces at the start of a line are
wrong. Every line of the body of the function starts with four spaces.
The `def` line itself starts with no spaces and ends with a colon.

A `NameError` means that a name is spelled differently from the name
that exists. The parameter is named `text`, and the fable in the last
line is named `geese_fable`.

A `SyntaxError` often means that a quote, a parenthesis or the colon
at the end of the `def` line is missing.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.
Compare the solution with your own cell, and find what is different.

```{attempt}
:id: clean-not-started
:check: clean-words
:expect: The function clean_words does not exist yet
```

````{attempt}
:id: clean-not-a-function
:check: clean-words
:expect: The name clean_words is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
clean_words = geese_fable.lower().split()
```
````

````{attempt}
:id: clean-no-parameter
:check: clean-words
:expect: must have exactly one parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_words():
    return geese_fable.lower().split()
```
````

````{attempt}
:id: clean-other-error
:check: clean-words
:expect: stopped with an error of the type NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_words(text):
    text = text.lower()
    return words.split()
```
````

````{attempt}
:id: clean-prints
:check: clean-words
:expect: shows the list with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_words(text):
    text = text.lower()
    for mark in ".,;:":
        text = text.replace(mark, "")
    print(text.split())
```
````

````{attempt}
:id: clean-no-return
:check: clean-words
:expect: gives back None

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_words(text):
    text = text.lower()
    words = text.split()
```
````

````{attempt}
:id: clean-returns-string
:check: clean-words
:expect: gives back a string

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_words(text):
    text = text.lower()
    for mark in ".,;:":
        text = text.replace(mark, "")
    return text
```
````

````{attempt}
:id: clean-capitals
:check: clean-words
:expect: still has a capital letter

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_words(text):
    text.lower()
    for mark in ".,;:":
        text = text.replace(mark, "")
    return text.split()
```
````

````{attempt}
:id: clean-marks
:check: clean-words
:expect: still holds the punctuation mark ;

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_words(text):
    text = text.lower()
    text = text.replace(".", "")
    text = text.replace(",", "")
    return text.split()
```
````

````{attempt}
:id: clean-split-space
:check: clean-words
:expect: a text that has two lines

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_words(text):
    text = text.lower()
    for mark in ".,;:":
        text = text.replace(mark, "")
    return text.split(" ")
```
````

````{attempt}
:id: clean-other-list
:check: clean-words
:expect: but it must give back

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_words(text):
    text = text.lower()
    for mark in ".,;:":
        text = text.replace(mark, "")
    return sorted(text.split())
```
````

````{attempt}
:id: clean-other-way
:check: clean-words
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_words(text):
    words = []
    for word in text.split():
        words.append(word.strip(".,;:").lower())
    return words
print(clean_words(geese_fable)[:8])
```
````

````{hint}
:title: Show me a solution
:unlock: "clean-words" in failed_checks or "clean-words" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-clean-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [clean-solution]
:run: true
def clean_words(text):
    text = text.lower()
    text = text.replace(".", "")
    text = text.replace(",", "")
    text = text.replace(";", "")
    text = text.replace(":", "")
    return text.split()

print(clean_words(geese_fable)[:8])
```
````

```{verify}
:id: clean-words
:label: The function clean_words gives back a list of clean words
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed clean; cell-executed clean-solution
def _workshop_check():
    import contextlib, io
    if "clean_words" not in globals():
        print("The function clean_words does not exist yet. Write it under the comment in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["clean_words"]
    if not callable(function):
        print("The name clean_words is not a function. It refers to another kind of value. Define the function with a line that starts with def clean_words(text): and write the body under it. Then run the cell again.")
        return False
    tests = [
        ("The Hen, the Dog; and THE end.", ["the", "hen", "the", "dog", "and", "the", "end"]),
        ("One fox: two HENS.", ["one", "fox", "two", "hens"]),
        ("A dog and\na hen", ["a", "dog", "and", "a", "hen"]),
    ]
    for text, expected in tests:
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(text)
        except TypeError:
            print("The function clean_words stopped with a TypeError when the check called it with one string. The function must have exactly one parameter: def clean_words(text): and the body must use that parameter as a string. Correct the function, and run the cell again.")
            return False
        except Exception as error:
            print(f"The function clean_words stopped with an error of the type {type(error).__name__} when the check called clean_words({text!r}). Call the function in the same way in a cell of your own, and read the last line of the error message. Correct the function, and run the cell again.")
            return False
        if result is None and shown.getvalue().strip():
            print("The function clean_words shows the list with print(), but it does not return it. The code that calls the function then receives None. Replace print() in the last line of the body with return, so that the function gives the list back. Then run the cell again.")
            return False
        if result is None:
            print("The function clean_words gives back None. That happens when the body has no return line, or when Python never reaches it. The last line of the body must start with return and give back the list of words. Then run the cell again.")
            return False
        if isinstance(result, str):
            print(f"The function clean_words gives back a string, but it must give back a list of words. clean_words({text!r}) gives {result!r}. Call split() on the string in the return line, so that the function returns a list. Then run the cell again.")
            return False
        if not isinstance(result, list) or not all(isinstance(word, str) for word in result):
            print(f"The function clean_words must give back a list of strings, but clean_words({text!r}) gives {result!r}. Return the list that split() gives. Then run the cell again.")
            return False
        if result == expected:
            continue
        if "\n" in text:
            print(f"The check called clean_words with a text that has two lines. The first line is: A dog and. The second line is: a hen. Your function gives back {result!r} but it must give back {expected!r}. Python shows the end of a line as \\n. Use split() with nothing between the parentheses. It divides a text at the spaces and at the ends of the lines. Then run the cell again.")
            return False
        capitals = [word for word in result if word != word.lower()]
        if capitals:
            print(f"clean_words({text!r}) gives {result!r}. The word {capitals[0]!r} still has a capital letter. Use lower() to make every letter small. A string never changes, so give a name to the result: text = text.lower(). Then run the cell again.")
            return False
        marks = [(word, mark) for word in result for mark in ".,;:" if mark in word]
        if marks:
            print(f"clean_words({text!r}) gives {result!r}. The word {marks[0][0]!r} still holds the punctuation mark {marks[0][1]} which must be removed. Use replace() for each of the four marks. A string never changes, so give a name to the result each time: text = text.replace(\"{marks[0][1]}\", \"\"). Then run the cell again.")
            return False
        print(f"clean_words({text!r}) gives back {result!r} but it must give back {expected!r}. The words must be in the same order as in the text, and each word must be in the list one time for each time that it is in the text. Then run the cell again.")
        return False
    print("Correct. The function clean_words gives back a list of words that have small letters only and no punctuation marks.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

Your notebook now has a function that turns any text into a list of
clean words. The next part counts those words.
