---
title: The fables
requires: [verify:fables-ran, verify:raw-ran, quiz:predict-spelling, verify:spelling-ran]
---

# The fables

A program that counts words needs a text. On this page you add the
five fables to your notebook, and you see why the words cannot be
counted yet. You write no code on this page.

## Five strings and one dictionary

A **string** is a value that holds text. Until now, every string in
these workshops was on one line. A fable has several lines, so the
next cell writes each string with three double quotes at the start and
three at the end: `"""`. A string that is written in this way can
continue over many lines. In every other way it is a normal string.

A **dictionary** holds pairs. Each pair has a **key** and a **value**,
and you use the key to find the value. The cell makes a dictionary
named `fables`. Each key is the title of a fable, and each value is
the text of that fable.

Click the action below. It adds a cell that creates the five strings
and the dictionary, and runs it.

```{attempt}
:id: fables-not-run
:check: fables-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-fables
:title: Add a cell that holds the five fables, and run it
:path: {{ notebook }}
:tags: [fables]
:run: true
dog_fable = """A DOG, crossing a bridge over a stream with a piece of flesh in his
mouth, saw his own shadow in the water and took it for that of another
Dog, with a piece of meat double his own in size. He immediately let go
of his own, and fiercely attacked the other Dog to get his larger piece
from him. He thus lost both: that which he grasped at in the water,
because it was a shadow; and his own, because the stream swept it away."""

fisherman_fable = """A FISHERMAN, engaged in his calling, made a very successful cast and
captured a great haul of fish. He managed by a skillful handling of his
net to retain all the large fish and to draw them to the shore; but he
could not prevent the smaller fish from falling back through the meshes
of the net into the sea."""

hen_fable = """A WOMAN possessed a Hen that gave her an egg every day. She often
pondered how she might obtain two eggs daily instead of one, and at
last, to gain her purpose, determined to give the Hen a double
allowance of barley. From that day the Hen became fat and sleek, and
never once laid another egg."""

geese_fable = """THE GEESE and the Cranes were feeding in the same meadow, when a
birdcatcher came to ensnare them in his nets. The Cranes, being light
of wing, fled away at his approach; while the Geese, being slower of
flight and heavier in their bodies, were captured."""

swan_fable = """A CERTAIN rich man bought in the market a Goose and a Swan. He fed the
one for his table and kept the other for the sake of its song. When the
time came for killing the Goose, the cook went to get him at night,
when it was dark, and he was not able to distinguish one bird from the
other. By mistake he caught the Swan instead of the Goose. The Swan,
threatened with death, burst forth into song and thus made himself
known by his voice, and preserved his life by his melody."""

fables = {
    "The Dog and the Shadow": dog_fable,
    "The Fisherman and His Nets": fisherman_fable,
    "The Woman and Her Hen": hen_fable,
    "The Geese and the Cranes": geese_fable,
    "The Swan and the Goose": swan_fable,
}
```

The cell shows nothing, because each line is an assignment. Python now
remembers the five strings and the dictionary.

The English of these fables is more than one hundred years old, and
some of its words are rare today. You do not need to understand every
word. Your program counts the words. It does not need to know what
they mean.

```{verify}
:id: fables-ran
:label: The dictionary fables holds five fables
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed fables
if isinstance(globals().get("fables"), dict) and len(fables) == 5 and all(isinstance(text, str) for text in fables.values()) and isinstance(globals().get("geese_fable"), str):
    print("The cell ran. The dictionary fables holds the titles and the texts of 5 fables.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("fables"), dict) and len(fables) == 5 and all(isinstance(text, str) for text in fables.values()) and isinstance(globals().get("geese_fable"), str)
```

## The words of one fable

The method `split()` divides a string into words. It divides the
string at every space and at the end of every line, and it gives back
a **list**: a value that holds many values in order.

The next cell divides the shortest fable into words, and shows the
first 12 of them. The slice `[:12]` gives the first 12 values of a
list.

```{attempt}
:id: raw-not-run
:check: raw-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-raw
:title: Add a cell that divides one fable into words, and run it
:path: {{ notebook }}
:tags: [raw]
:run: true
raw_words = geese_fable.split()
print(raw_words[:12])
```

The output is:

```
['THE', 'GEESE', 'and', 'the', 'Cranes', 'were', 'feeding', 'in', 'the', 'same', 'meadow,', 'when']
```

```{verify}
:id: raw-ran
:label: The cell divided one fable into words
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed raw
if isinstance(globals().get("raw_words"), list) and len(raw_words) == 46:
    print("The cell ran. The fable has 46 words, and the cell showed the first 12 of them.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("raw_words"), list) and len(raw_words) == 46
```

## Why these words cannot be counted yet

Look at the list. It has two problems.

- The word "the" is in the list three times, but one of the three is
  written `'THE'`, with capital letters. In other parts of the text it
  is written `'The'`.

- The word "meadow" has a comma at its end: `'meadow,'`. A comma, a
  full stop, a semicolon and a colon are **punctuation marks**: marks
  that divide a sentence into parts. They are not part of a word.

A program compares strings character by character. Look at this cell.
Do not run it yet. The operator `==` tests whether two values are
equal, and gives `True` or `False`.

```python
first_spelling = "The"
second_spelling = "the"
print(first_spelling == second_spelling)
```

```{quiz}
:id: predict-spelling
:type: text
:title: Predict the output
question: "What does this cell show?"
answer: "False"
wrong:
  - { text: "True", explanation: "A person reads these as the same word. Python compares each character, and the capital letter `T` is a different character from the small letter `t`." }
  - { text: "false", explanation: "The answer is correct, but Python writes this value with a capital letter: `False`." }
  - { text: "true", explanation: "Python writes this value with a capital letter: `True`. But it is not the answer here. Compare the first letter of each string." }
otherwise: "The operator `==` gives `True` or `False`. Compare the two strings character by character, and type one of those two values."
explanation: "For Python, `\"The\"` and `\"the\"` are different strings, because `T` and `t` are different characters. In the same way, `\"meadow,\"` and `\"meadow\"` are different strings."
```

```{attempt}
:id: spelling-not-run
:check: spelling-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-spelling
:title: Add the cell that compares the two strings, and run it
:path: {{ notebook }}
:tags: [spelling]
:run: true
first_spelling = "The"
second_spelling = "the"
print(first_spelling == second_spelling)
```

```{verify}
:id: spelling-ran
:label: The cell compared the two strings
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed spelling
if globals().get("first_spelling") == "The" and globals().get("second_spelling") == "the":
    print("The cell ran. For Python, the two strings are different.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("first_spelling") == "The" and globals().get("second_spelling") == "the"
```

A program that counted these words would count `'THE'`, `'The'` and
`'the'` as three different words, and `'meadow,'` and `'meadow'` as
two different words. So the first part of your program makes the words
clean: every letter small, and no punctuation marks.

The five fables use four punctuation marks: the full stop `.`, the
comma `,`, the semicolon `;` and the colon `:`. They use no other
marks.
