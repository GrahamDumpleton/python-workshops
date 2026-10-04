---
title: A row that stops the program
requires: [quiz:stop-type, quiz:stop-rows]
---

# A row that stops the program

Mariam wants to know how much she spent in the three months. The
program for that is short. It reads each row, gets the amount, and
adds the amount to a total.

This page shows what happens when that program meets a row that
cannot be read.

## The program

The action below adds the program to your notebook. The action does
not run the cell.

```{cell-insert}
:id: insert-first-total
:title: Add the cell that adds up the amounts, without running it
:path: {{ notebook }}
:tags: [first-total]
:run: false
rows_added = 0
first_total = 0
with open("spending-raw.csv") as file:
    header = file.readline()
    for line in file:
        fields = line.strip().split(",")
        amount = float(fields[2])
        first_total = first_total + amount
        rows_added = rows_added + 1
print(f"Rows: {rows_added}")
print(f"Total: {first_total:.2f}")
```

One line of the cell is new. `file.readline()` reads one line of the
file. Here it reads the first line, which is the header. The header
is not a purchase, so the program must not use it. The `for` loop
then starts at the second line of the file.

The other lines use what the last page repeated. In each pass of the
loop, the program makes a list of the fields, makes a float from the
third field, and adds it to the total.

Run the cell: click inside it, hold `Shift` and press `Enter`.

## Python stops

The cell does not show a total. It shows an error message. The
workshop **When things go wrong** showed how to read one: start at
the last line, which holds the type of the error and a short message.

```{quiz}
:id: stop-type
:type: text
:case: false
:title: The type of the error
question: "Look at the last line of the error message under your cell. What is the type of the error? Type the one word that comes before the colon."
answer: "ValueError"
wrong:
  - { text: "Traceback", explanation: "`Traceback` is the name of this kind of message, and it is in the first line. The type of the error is the first word of the last line." }
  - { text: "unknown", explanation: "`'unknown'` is the string that Python could not use. The type of the error is the word before the colon, at the start of the last line." }
  - { text: "float", explanation: "`float` is the function that could not do its work. The type of the error is the word before the colon, at the start of the last line." }
otherwise: "Type one word only. It is the first word of the last line of the error message, and it ends with the letters `Error`."
explanation: "The last line is `ValueError: could not convert string to float: 'unknown'`. The type of the error is `ValueError`."
```

The last line of the error message is:

```
ValueError: could not convert string to float: 'unknown'
```

- `ValueError` is the type of the error. A `ValueError` means that a
  function received a value of the right type, but it cannot use that
  value. `float()` needs a string, and it received a string. But the
  string does not hold a number.

- The message says which string it was: `'unknown'`. To convert a
  value means to make a value of another type from it.

Above the last line, an arrow marks the line where Python stopped:

```
----> 7         amount = float(fields[2])
```

The string `'unknown'` is the amount of the gift for Chidi, in line 9
of the file. Mariam did not know the amount when she typed the row.

## An exception

Python has a word for an error of this kind. An **exception** is an
error that stops a program while it runs. A `ValueError` is one type
of exception. The `NameError` and the `IndexError` that you know from
earlier workshops are other types.

An exception stops the program at once. Python does not run the rest
of the block, and it does not continue with the next row.

```{quiz}
:id: stop-rows
:type: text
:title: How far the program went
question: "The row that stopped the program is line 9 of the file. Line 1 is the header. How many purchases did the program add to the total before it stopped?"
answer: "7"
wrong:
  - { text: "8", explanation: "There are 8 lines before line 9, but the first of them is the header. `file.readline()` read the header, and the loop did not add it." }
  - { text: "9", explanation: "Line 9 is the row that stopped the program. Python stopped at `float()`, so the lines that add to the total did not run for this row." }
  - { text: "0", explanation: "The rows before line 9 have amounts that `float()` can read. The program added each of them before it reached line 9." }
  - { text: "37", explanation: "`37` is the number of rows that can be read in the whole file. The program stopped at line 9, and never reached the rows after it." }
  - { text: "40", explanation: "`40` is the number of rows in the whole file. The program stopped at line 9, and never reached the rows after it." }
otherwise: "Count the lines of the file from line 2 to line 8. Those are the rows that the program added."
explanation: "The program added the rows in lines 2 to 8 of the file, which are 7 purchases. Then it stopped. The other 32 rows were never read."
```

## Why this is a problem

One row of 40 has a mistake, and because of it Mariam gets no total
at all. The two lines with `print()` at the end of the cell never
ran.

The code of the program is correct. The mistake is in the data. You
cannot correct the program by changing the line with the arrow,
because nothing is wrong with that line.

Mariam could correct the file by hand. But a program that reads data
from people will meet mistakes many times. A better program
expects that some rows cannot be read. It leaves those rows out,
counts them, and continues with the others. The next page shows how.
