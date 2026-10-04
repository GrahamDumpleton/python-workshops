---
title: Two parameters
requires: [verify:trip-defined, quiz:predict-trip, verify:trip-swapped]
---

# Two parameters

Some functions need more than one value. A function that describes a
journey needs the name of the city and the number of days.

A function can have several parameters. You write them between the
parentheses of the `def` line, with a comma between them. The call
then gives several arguments, also with a comma between them.

Python connects the arguments to the parameters by their position. The
first argument goes to the first parameter. The second argument goes
to the second parameter.

Think of a paper form that has two empty spaces: the first for a city
and the second for a number of days. The form does not know what you
write. It only has a first space and a second space. If you write the
values in the wrong spaces, the form says something that you did not
mean.

Click the action below. It adds a cell that defines a function with
two parameters and calls it, and runs the cell.

```{attempt}
:id: trip-not-defined
:check: trip-defined
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-trip
:title: Add a cell that defines a function with two parameters and calls it, and run it
:path: {{ notebook }}
:tags: [trip]
:run: true
def describe_trip(city, days):
    print(f"{days} days in {city}")

describe_trip("Lima", 5)
```

The output is:

```
5 days in Lima
```

```{verify}
:id: trip-defined
:label: Python knows the function describe_trip
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed trip
if callable(globals().get("describe_trip")):
    print("The cell ran. The function describe_trip received two arguments and used both of them.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
callable(globals().get("describe_trip"))
```

## What happened

The `def` line has two parameters: first `city`, then `days`.

The call `describe_trip("Lima", 5)` has two arguments: first `"Lima"`,
then `5`.

Python made the first parameter, `city`, refer to the first argument,
`"Lima"`. It made the second parameter, `days`, refer to the second
argument, `5`. Then it ran the body. The f-string uses `days` first
and `city` second, so the output is `5 days in Lima`.

## The order of the arguments

Python uses only the position of each argument. It does not look at
what the values mean. Look at this call. Do not run it yet. The two
arguments are in the other order.

```python
describe_trip(5, "Lima")
```

Type the line that you predict the notebook shows, exactly as it
appears.

```{quiz}
:id: predict-trip
:type: text
:title: Predict the output
question: 'What does the notebook show when the call `describe_trip(5, "Lima")` runs?'
answer: "Lima days in 5"
wrong:
  - { text: "5 days in Lima", explanation: "That is the output when `\"Lima\"` is the first argument. In this call, the first argument is `5`, so the first parameter, `city`, refers to `5`." }
  - { text: "days days in city", explanation: "Python replaces each parameter in the f-string with the value that the parameter refers to during this call." }
  - { pattern: ".*[Ee]rror.*", explanation: "Python shows no error message here. An f-string can show a number or a string in each place, so the body runs. But the output is not what the writer of the call wanted." }
otherwise: "The first argument, `5`, goes to the first parameter, `city`. The second argument, `\"Lima\"`, goes to the second parameter, `days`. The f-string is `{days} days in {city}`."
explanation: "The parameter `city` refers to `5`, and the parameter `days` refers to `\"Lima\"`. The f-string shows `days` first, so the output is `Lima days in 5`. Python shows no error message, but the output is wrong."
```

Run the call, and compare the output with your prediction.

```{attempt}
:id: trip-swapped-not-run
:check: trip-swapped
:expect: The cell has not run yet. Click the action above
```

```{cell-insert}
:id: insert-trip-swapped
:title: Add a cell that calls the function with the arguments in the other order, and run it
:path: {{ notebook }}
:tags: [trip-swapped]
:run: true
describe_trip(5, "Lima")
```

```{verify}
:id: trip-swapped
:label: The cell with the arguments in the other order has run
:substrate: contents
:trigger: cell-executed trip-swapped
:message: The cell has not run yet. Click the action above to add the cell and run it.
cell-executed {{ notebook }} trip-swapped
```

Python did what the call said, and the result has no meaning. When
you call a function, give the arguments in the same order as the
parameters in the `def` line.

## The number of arguments

The number of arguments in the call must be the same as the number of
parameters in the `def` line. The call `describe_trip("Lima")` gives
only one argument to a function that has two parameters. Python stops
that call with a `TypeError`, and the last line of the error message
is:

```
TypeError: describe_trip() missing 1 required positional argument: 'days'
```

The message says which parameter did not receive a value. The words
"positional argument" are explained in the next workshop. For now,
read them as "argument". When you see this message, count the
arguments in your call and the parameters in the `def` line.

On the next page, you write a function with two parameters yourself.
