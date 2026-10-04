---
title: Values that do not fit together
requires: [quiz:guests-which-line, verify:guests-fixed]
---

# Values that do not fit together

Every value in Python has a **type**: the kind of value that it is.
You already know three types. `12` is an integer, `2.5` is a float,
and `"hello"` is a string.

The type of a value decides what you can do with the value. The
operator `+` adds two numbers, and it joins two strings. But it cannot
work with one string and one number. Should the result be a number or
a string? Python does not guess. It stops, and it shows a `TypeError`.

A `TypeError` means that a value has the wrong type for what the code
tries to do with it.

Imagine that someone asks you to add 5 and the word "blue". You
cannot give an answer, because the question has no meaning. That is
how Python sees a string plus a number.

## Predict the line

Look at this cell. Do not run it yet. It is meant to show the message
`Guests: 12`.

```python
guest_count = 12
guest_message = "Guests: " + guest_count
print(guest_message)
```

One line of this cell uses the operator `+` with a string and a
number.

```{quiz}
:id: guests-which-line
:type: text
:title: Predict the line
question: "At which line of the cell does Python stop with a `TypeError`? Type the number."
answer: "2"
wrong:
  - { text: "1", explanation: "Line 1 is an assignment that gives the name `guest_count` to the integer 12. Nothing is wrong with it." }
  - { text: "3", explanation: "Line 3 only shows a value. Python stops before it reaches line 3. Which line uses the operator `+`?" }
otherwise: "Type one number only. Which line uses the operator `+` with a string on one side and a number on the other side?"
explanation: "Line 2 has the string `\"Guests: \"` on the left of the operator `+`, and the name `guest_count`, which refers to an integer, on the right."
```

## A cell with a mistake

The action below adds the cell to your notebook, and does not run it.

```{cell-insert}
:id: insert-guests
:title: Add a cell that has a mistake in it, without running it
:path: {{ notebook }}
:tags: [guests]
:run: false
guest_count = 12
guest_message = "Guests: " + guest_count
print(guest_message)
```

Run the cell: click inside it, hold `Shift` and press `Enter`.

Read the error message in the same order as before.

1. The last line begins with `TypeError`. That is the type of the
   error.

2. The arrow `---->` points at line 2. Compare it with your
   prediction.

3. The message is the text after the colon:

```
TypeError: can only concatenate str (not "int") to str
```

This message uses three words that you may not know. "Concatenate"
means to join. `str` is the short name that Python uses for a string.
`int` is the short name that Python uses for an integer. So the
message says: "I can only join a string to a string, and not an
integer to a string."

You did not need all of those words. The type, `TypeError`, and the
line, 2, already say enough: on line 2, a value has the wrong type.
Line 2 has a string and a number around the operator `+`.

## Your task

Correct line 2, so that the cell shows `Guests: 12`. Then run the cell
again.

The best way to put a number inside a string is an f-string. An
f-string has the letter `f` before its first quote. Python replaces
each name in braces `{` `}` with the value of the name.

```{hint}
:title: Hint: what does an f-string look like?
This is an f-string that uses a name: `f"Total: {total}"`. If `total`
refers to `36`, the result is the string `Total: 36`. Write line 2 in
the same form, with the text `Guests: ` and the name `guest_count`.
```

```{hint}
:title: Hint: how to correct it
Change the second line to `guest_message = f"Guests: {guest_count}"`.
The line no longer needs the operator `+`. Then run the cell again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run the cell, or after you have clicked `Check`.

```{attempt}
:id: guests-not-fixed
:check: guests-fixed
:expect: The name guest_message does not exist yet
```

````{attempt}
:id: guests-name-in-quotes
:check: guests-fixed
:expect: That happens when the name is inside the quotes

```{cell-insert}
:path: {{ notebook }}
:run: true
guest_count = 12
guest_message = "Guests: guest_count"
print(guest_message)
```
````

````{attempt}
:id: guests-no-f
:check: guests-fixed
:expect: That happens when the letter f is missing

```{cell-insert}
:path: {{ notebook }}
:run: true
guest_count = 12
guest_message = "Guests: {guest_count}"
print(guest_message)
```
````

````{attempt}
:id: guests-no-space
:check: guests-fixed
:expect: but it must refer to the text Guests: 12

```{cell-insert}
:path: {{ notebook }}
:run: true
guest_count = 12
guest_message = f"Guests:{guest_count}"
print(guest_message)
```
````

````{attempt}
:id: guests-number-as-string
:check: guests-fixed
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
guest_count = "12"
guest_message = "Guests: " + guest_count
print(guest_message)
```
````

````{hint}
:title: Show me a solution
:unlock: "guests-fixed" in failed_checks or "guests-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-guests-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [guests-solution]
:run: true
guest_count = 12
guest_message = f"Guests: {guest_count}"
print(guest_message)
```
````

```{verify}
:id: guests-fixed
:label: The cell runs without an error and shows Guests: 12
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed guests; cell-executed guests-solution
if "guest_message" not in globals():
    print("The name guest_message does not exist yet. That means Python has not performed the second line of the cell without an error. Change the second line into an f-string that holds the name guest_count in braces. Then run the cell.")
elif guest_message == "Guests: 12":
    print("Correct. The cell runs without an error, and the name guest_message refers to the text Guests: 12.")
elif guest_message == "Guests: guest_count":
    print("The name guest_message refers to the text Guests: guest_count. That happens when the name is inside the quotes of an ordinary string. Python then reads the name as text. Write the letter f before the first quote, and put braces around the name. Then run the cell again.")
elif guest_message == "Guests: {guest_count}":
    print("The name guest_message refers to text that still shows the braces. That happens when the letter f is missing. Write the letter f immediately before the first quote of the string. Then run the cell again.")
else:
    print(f"The name guest_message refers to the text {guest_message} but it must refer to the text Guests: 12. Check that the string has one space after the colon, and that the first line is still guest_count = 12. Then run the cell again.")
"guest_message" in globals() and guest_message == "Guests: 12"
```

## Another way to correct it

There is a second way to correct this cell. If the first line is
`guest_count = "12"`, with quotes, then the value is a string, and the
operator `+` joins two strings. This works, but the value is then
text, and you cannot calculate with it. An f-string keeps the number
as a number, so it is usually the better choice.
