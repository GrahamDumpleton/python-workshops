---
title: A line of text of your own
requires: [verify:ticket-line]
---

# A line of text of your own

On this page you write a small program yourself, from nothing. It
uses the ideas of this workshop: strings, an f-string, a number with
two decimal places, and a method.

## The problem

A theatre prints one line of text on each ticket. The line holds the
name of the visitor and the price that the visitor paid. The theatre
writes the family name in capital letters, so that it is clear which
name is the family name.

Amina Okafor paid 12.5 for a ticket. The line on the ticket of Amina
must be exactly this:

```
Ticket for Amina OKAFOR: 12.50
```

Read the line carefully, character by character:

- the words `Ticket for`, with a capital `T`, and then one space

- the first name, and then one space

- the family name in capital letters

- a colon, and then one space

- the price, with two digits after the decimal point

## What the program must do

Your program must have these five lines, in this order:

1. Give the name `first_name` to the string `"Amina"`.

2. Give the name `family_name` to the string `"Okafor"`. Write it
   with small letters after the `O`, as it is here. Your program
   makes the capital letters later.

3. Give the name `ticket_cost` to the number `12.5`.

4. Build the line of text from the three names, and give the result
   the name `ticket_line`. Use the names, and do not type the words
   `Amina`, `OKAFOR` or `12.50` in this line.

5. Show the value of `ticket_line` with `print()`.

The check compares your string with the expected line exactly. One
missing space, or one letter that is a capital letter in one and a
small letter in the other, makes the strings different.

## Where to write it

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-ticket
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [ticket]
:run: false
# Write your program on the lines below this one.

```

The first line of the cell begins with the symbol `#`, so it is a
comment: a note for the reader, which Python ignores. Click on the
empty line under the comment, and type the first line of your program. Press `Enter` at the end of each line to start the next
line. When you have written all five lines, run the cell: hold
`Shift` and press `Enter`.

If you see an error message, or the output is not what you expected,
change the program and run the cell again. You can try as many times
as you like.

## If you need help

```{hint}
:title: Hint: how to begin
The first three lines are assignments. Each has the name on the left,
then the symbol `=`, then the value on the right. The two strings
need quotes: `first_name = "Amina"`. The number needs no quotes:
`ticket_cost = 12.5`.
```

```{hint}
:title: Hint: the line of text
Use an f-string for the fourth line. Write the letter `f`, then a
quote, then the text, then a quote. The fixed parts are ordinary
text: `Ticket for `, the spaces and the colon. Each value is a pair
of braces: `{first_name}` for the first name.
```

```{hint}
:title: Hint: the capital letters and the price
Braces can hold an expression. For the family name in capital
letters, write `{family_name.upper()}`. For the price with two digits
after the decimal point, write `{ticket_cost:.2f}`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.
Compare the solution with your own cell, and find what is different.

```{attempt}
:id: ticket-not-started
:check: ticket-line
:expect: The name first_name does not exist yet
```

````{attempt}
:id: ticket-one-name
:check: ticket-line
:expect: The name family_name does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
first_name = "Amina"
```
````

````{attempt}
:id: ticket-two-names
:check: ticket-line
:expect: The name ticket_cost does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
first_name = "Amina"
family_name = "Okafor"
```
````

````{attempt}
:id: ticket-no-line
:check: ticket-line
:expect: The name ticket_line does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
first_name = "Amina"
family_name = "Okafor"
ticket_cost = 12.5
print(f"Ticket for {first_name} {family_name.upper()}: {ticket_cost:.2f}")
```
````

````{attempt}
:id: ticket-first-small
:check: ticket-line
:expect: The name first_name refers to amina

```{cell-insert}
:path: {{ notebook }}
:run: true
first_name = "amina"
family_name = "Okafor"
ticket_cost = 12.5
ticket_line = f"Ticket for {first_name} {family_name.upper()}: {ticket_cost:.2f}"
print(ticket_line)
```
````

````{attempt}
:id: ticket-family-capitals
:check: ticket-line
:expect: The name family_name refers to OKAFOR

```{cell-insert}
:path: {{ notebook }}
:run: true
first_name = "Amina"
family_name = "OKAFOR"
ticket_cost = 12.5
ticket_line = f"Ticket for {first_name} {family_name.upper()}: {ticket_cost:.2f}"
print(ticket_line)
```
````

````{attempt}
:id: ticket-cost-string
:check: ticket-line
:expect: The name ticket_cost must refer to the number 12.5

```{cell-insert}
:path: {{ notebook }}
:run: true
first_name = "Amina"
family_name = "Okafor"
ticket_cost = "12.5"
ticket_line = f"Ticket for {first_name} {family_name.upper()}: {ticket_cost}0"
print(ticket_line)
```
````

````{attempt}
:id: ticket-line-number
:check: ticket-line
:expect: The name ticket_line does not refer to a string

```{cell-insert}
:path: {{ notebook }}
:run: true
first_name = "Amina"
family_name = "Okafor"
ticket_cost = 12.5
ticket_line = ticket_cost
print(ticket_line)
```
````

````{attempt}
:id: ticket-no-f
:check: ticket-line
:expect: The letter f before the first quote is missing

```{cell-insert}
:path: {{ notebook }}
:run: true
first_name = "Amina"
family_name = "Okafor"
ticket_cost = 12.5
ticket_line = "Ticket for {first_name} {family_name.upper()}: {ticket_cost:.2f}"
print(ticket_line)
```
````

````{attempt}
:id: ticket-one-decimal
:check: ticket-line
:expect: The price has only one digit after the decimal point

```{cell-insert}
:path: {{ notebook }}
:run: true
first_name = "Amina"
family_name = "Okafor"
ticket_cost = 12.5
ticket_line = f"Ticket for {first_name} {family_name.upper()}: {ticket_cost}"
print(ticket_line)
```
````

````{attempt}
:id: ticket-no-upper
:check: ticket-line
:expect: The family name is not in capital letters

```{cell-insert}
:path: {{ notebook }}
:run: true
first_name = "Amina"
family_name = "Okafor"
ticket_cost = 12.5
ticket_line = f"Ticket for {first_name} {family_name}: {ticket_cost:.2f}"
print(ticket_line)
```
````

````{attempt}
:id: ticket-no-space
:check: ticket-line
:expect: The spaces are different

```{cell-insert}
:path: {{ notebook }}
:run: true
first_name = "Amina"
family_name = "Okafor"
ticket_cost = 12.5
ticket_line = f"Ticket for {first_name} {family_name.upper()}:{ticket_cost:.2f}"
print(ticket_line)
```
````

````{attempt}
:id: ticket-small-t
:check: ticket-line
:expect: The capital letters and the small letters are different

```{cell-insert}
:path: {{ notebook }}
:run: true
first_name = "Amina"
family_name = "Okafor"
ticket_cost = 12.5
ticket_line = f"ticket for {first_name} {family_name.upper()}: {ticket_cost:.2f}"
print(ticket_line)
```
````

````{attempt}
:id: ticket-other-words
:check: ticket-line
:expect: Compare the two lines character by character

```{cell-insert}
:path: {{ notebook }}
:run: true
first_name = "Amina"
family_name = "Okafor"
ticket_cost = 12.5
ticket_line = f"Ticket: {first_name} {family_name.upper()} {ticket_cost:.2f}"
print(ticket_line)
```
````

````{attempt}
:id: ticket-joined-with-plus
:check: ticket-line
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
first_name = "Amina"
family_name = "Okafor"
ticket_cost = 12.5
ticket_line = "Ticket for " + first_name + " " + family_name.upper() + ": " + f"{ticket_cost:.2f}"
print(ticket_line)
```
````

````{hint}
:title: Show me a solution
:unlock: "ticket-line" in failed_checks or "ticket-line" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-ticket-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [ticket-solution]
:run: true
first_name = "Amina"
family_name = "Okafor"
ticket_cost = 12.5
ticket_line = f"Ticket for {first_name} {family_name.upper()}: {ticket_cost:.2f}"
print(ticket_line)
```
````

```{verify}
:id: ticket-line
:label: Your program builds the line of text for the ticket
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed ticket; cell-executed ticket-solution
if "first_name" not in globals():
    print("The name first_name does not exist yet. Write your program under the comment in the new cell, and begin with the line that gives this name the string Amina. Check the spelling. Then hold Shift and press Enter to run the cell.")
elif "family_name" not in globals():
    print("The name family_name does not exist yet. Add a line that gives the name family_name the string Okafor. Then run the cell again.")
elif "ticket_cost" not in globals():
    print("The name ticket_cost does not exist yet. Add a line that gives the name ticket_cost the number 12.5. Then run the cell again.")
elif "ticket_line" not in globals():
    print("The name ticket_line does not exist yet. Add a line that builds the line of text from the three names, and gives the result the name ticket_line. Check the spelling. Then run the cell again.")
elif first_name != "Amina":
    print(f"The name first_name refers to {first_name} but it must refer to the string Amina, with a capital A, between quotes. Change the first line. Then run the cell again.")
elif family_name != "Okafor":
    print(f"The name family_name refers to {family_name} but it must refer to the string Okafor, with a capital O and then small letters, between quotes. Your program makes the capital letters in the fourth line. Change the second line. Then run the cell again.")
elif isinstance(ticket_cost, str) or ticket_cost != 12.5:
    print("The name ticket_cost must refer to the number 12.5. Write the number in the third line without quotes, with a point between the 12 and the 5. Then run the cell again.")
elif not isinstance(ticket_line, str):
    print("The name ticket_line does not refer to a string. The fourth line must build a text. Use an f-string: the letter f, then a quote, then the text with the names between braces, then a quote. Then run the cell again.")
elif ticket_line == "Ticket for Amina OKAFOR: 12.50":
    print("Correct. The name ticket_line refers to the string Ticket for Amina OKAFOR: 12.50. Your cell also shows that line under it if your last line is print(ticket_line).")
elif "{" in ticket_line:
    print("The name ticket_line refers to a string that still contains braces. The letter f before the first quote is missing, so Python did not fill the places. Write the letter f directly before the first quote of the string. Then run the cell again.")
elif ticket_line.endswith("12.5"):
    print("The line ends with 12.5. The price has only one digit after the decimal point. Add :.2f after the name ticket_cost, inside the braces. Then run the cell again.")
elif "Okafor" in ticket_line:
    print("The line contains Okafor. The family name is not in capital letters. Use the method upper() inside the braces: family_name.upper(), with the parentheses. Then run the cell again.")
elif ticket_line.replace(" ", "") == "TicketforAminaOKAFOR:12.50":
    print(f"The name ticket_line refers to [{ticket_line}] but it must refer to [Ticket for Amina OKAFOR: 12.50]. The square brackets show where each value begins and ends. The characters are correct. The spaces are different. The line needs one space after the word for, one space between the two names, and one space after the colon. Then run the cell again.")
elif ticket_line.lower() == "ticket for amina okafor: 12.50":
    print(f"The name ticket_line refers to [{ticket_line}] but it must refer to [Ticket for Amina OKAFOR: 12.50]. The capital letters and the small letters are different. The line begins with a capital T, and only the family name is completely in capital letters. Then run the cell again.")
else:
    print(f"The name ticket_line refers to [{ticket_line}] but it must refer to [Ticket for Amina OKAFOR: 12.50]. The square brackets show where each value begins and ends. Compare the two lines character by character: the words, the spaces, the colon and the price. Then run the cell again.")
all(name in globals() for name in ("first_name", "family_name", "ticket_cost", "ticket_line")) and first_name == "Amina" and family_name == "Okafor" and not isinstance(ticket_cost, str) and ticket_cost == 12.5 and ticket_line == "Ticket for Amina OKAFOR: 12.50"
```
