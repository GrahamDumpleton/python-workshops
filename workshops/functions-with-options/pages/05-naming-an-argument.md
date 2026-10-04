---
title: Naming an argument
requires: [quiz:predict-positions, verify:sentence-fixed]
---

# Naming an argument

Until now, every call gave its arguments in order. Python gave the
first argument to the first parameter, and the second argument to the
second parameter. An argument that Python matches by its position in
the call is a **positional argument**.

Positional arguments have a problem. The person who writes the call
must remember the order of the parameters. Python cannot notice when
two arguments are in the wrong order, because it does not know what
the values mean.

Look at this code. Do not run it yet.

```python
def introduce(name, city):
    return f"{name} lives in {city}."

print(introduce("Nairobi", "Wanjiru"))
```

The call gives the city first and the name second, which is the wrong
order for this function.

```{quiz}
:id: predict-positions
:type: text
:title: Predict the output
question: "What does this code show when it runs? Type the line exactly."
answer: "Nairobi lives in Wanjiru."
wrong:
  - { text: "Wanjiru lives in Nairobi.", explanation: "Python does not know that Wanjiru is the name of a person and Nairobi is the name of a city. It gives the first argument to the first parameter." }
  - { text: "Nairobi lives in Wanjiru", explanation: "The words are correct. The f-string also has a full stop at its end, and Python keeps it." }
  - { text: "Wanjiru lives in Nairobi", explanation: "Python does not know that Wanjiru is the name of a person and Nairobi is the name of a city. It gives the first argument to the first parameter." }
  - { pattern: ".*Error.*", explanation: "Python shows no error here. Both arguments are strings, and the function accepts any two values." }
otherwise: "The first argument, `\"Nairobi\"`, goes to the first parameter, `name`. The second argument goes to `city`. Put those values in the f-string."
explanation: "The first argument goes to the first parameter, so `name` refers to `\"Nairobi\"` and `city` refers to `\"Wanjiru\"`. Python shows no error, but the sentence is wrong."
```

## A keyword argument

Python has a second way to give an argument. A **keyword argument**
is an argument that has the name of its parameter in front of it,
with the symbol `=` between them: `city="Nairobi"`. Python gives the
value to the parameter that has that name. The position does not
matter.

A paper form is a good comparison. Each empty place on a form has a
label, such as "Name" or "City". You can write in the places in any
order, because the label says what each value means.

The function `greet` from the earlier page shows how it works.

```python
def greet(name, greeting="Hello"):
    return f"{greeting}, {name}!"

print(greet("Aiko", greeting="Hi"))
print(greet(greeting="Hi", name="Aiko"))
```

The output of this code is:

```
Hi, Aiko!
Hi, Aiko!
```

## What happened

- The first call has one positional argument, `"Aiko"`, which goes to
  the first parameter, `name`. It also has one keyword argument,
  `greeting="Hi"`, which goes to the parameter `greeting`.

- The second call has two keyword arguments. They are in the other
  order, and the result is the same, because each argument names its
  parameter.

Keyword arguments have two rules:

- The name in front of the `=` must be the name of a parameter of
  the function. Any other name gives a `TypeError`.

- In a call, positional arguments come first, and keyword arguments
  come after them. Python does not accept
  `greet(greeting="Hi", "Aiko")`.

The symbol `=` in a call is not an assignment. The call
`greet("Aiko", greeting="Hi")` does not create a name `greeting` in
your notebook. It only says which parameter gets the value.

A call with keyword arguments is longer to write. But a person who
reads `introduce(name="Wanjiru", city="Nairobi")` knows what each
value means, and does not need to look at the function.

## Your task

The action below adds a cell that holds the function `introduce` and
the call with the wrong order. The action does not run the cell.

```{cell-insert}
:id: insert-sentence
:title: Add a cell with the call for me to change
:path: {{ notebook }}
:tags: [sentence]
:run: false
def introduce(name, city):
    return f"{name} lives in {city}."

sentence = introduce("Nairobi", "Wanjiru")
print(sentence)
```

Correct the call in the fourth line. Do not move the two values.
Make each value a keyword argument, by writing the name of its
parameter and the symbol `=` in front of it. Then run the cell. The
output must be:

```
Wanjiru lives in Nairobi.
```

```{hint}
:title: Hint: which name goes with which value?
`"Nairobi"` is a city, so it belongs to the parameter `city`.
`"Wanjiru"` is the name of a person, so it belongs to the parameter
`name`. Write `city=` in front of the first value, and `name=` in
front of the second value.
```

```{hint}
:title: Hint: I see a TypeError
A `TypeError` here means that the call does not fit the function. If
the last line of the error message contains the words
`unexpected keyword argument`, the name in front of an `=` is not the
name of a parameter. The parameters of this function are `name` and
`city`. Check the spelling.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: sentence-not-started
:check: sentence-fixed
:expect: The cell has not run yet
```

````{attempt}
:id: sentence-unchanged
:check: sentence-fixed
:expect: The name sentence still refers to the wrong text

```{cell-insert}
:path: {{ notebook }}
:run: true
def introduce(name, city):
    return f"{name} lives in {city}."

sentence = introduce("Nairobi", "Wanjiru")
print(sentence)
```
````

````{attempt}
:id: sentence-other-text
:check: sentence-fixed
:expect: but it must refer to 'Wanjiru lives in Nairobi.'

```{cell-insert}
:path: {{ notebook }}
:run: true
def introduce(name, city):
    return f"{name} lives in {city}."

sentence = introduce(city="Nairobi", name="Wanjiro")
print(sentence)
```
````

````{attempt}
:id: sentence-other-order
:check: sentence-fixed
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def introduce(name, city):
    return f"{name} lives in {city}."

sentence = introduce("Wanjiru", city="Nairobi")
print(sentence)
```
````

````{hint}
:title: Show me a solution
:unlock: "sentence-fixed" in failed_checks or "sentence-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-sentence-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [sentence-solution]
:run: true
def introduce(name, city):
    return f"{name} lives in {city}."

sentence = introduce(city="Nairobi", name="Wanjiru")
print(sentence)
```
````

```{verify}
:id: sentence-fixed
:label: The call gives each value to the right parameter
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed sentence; cell-executed sentence-solution
if "sentence" not in globals():
    print("The cell has not run yet. Add the names of the parameters to the call in the new cell. Then hold Shift and press Enter to run the cell.")
elif sentence == "Wanjiru lives in Nairobi.":
    print("Correct. The name sentence refers to 'Wanjiru lives in Nairobi.'. Each value went to the parameter that the call named.")
elif sentence == "Nairobi lives in Wanjiru.":
    print("The name sentence still refers to the wrong text, 'Nairobi lives in Wanjiru.'. Change the call so that each value names its parameter: introduce(city=\"Nairobi\", name=\"Wanjiru\"). Then run the cell again.")
else:
    print("The name sentence refers to " + repr(sentence) + " but it must refer to 'Wanjiru lives in Nairobi.'. Do not change the function or the two values. Change only the call, so that it is introduce(city=\"Nairobi\", name=\"Wanjiru\"). Then run the cell again.")
"sentence" in globals() and sentence == "Wanjiru lives in Nairobi."
```

A function does not need a default value for a call to use keyword
arguments. Every parameter can be named in a call.
