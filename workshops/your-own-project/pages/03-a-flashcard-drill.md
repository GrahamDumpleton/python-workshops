---
title: A flashcard drill
when: track == "flashcard-drill"
requires: [verify:drill-asks, verify:drill-again]
---

# A flashcard drill

A **flashcard** is a small card with a question on one side and its
answer on the other. People use flashcards to learn words of another
language, dates or numbers: they read the question, say the answer,
and turn the card to see whether they were right. The cards that they
got wrong are asked again later.

Your program does this in the terminal. It reads the cards from a
file, asks each question, waits for you to type the answer, and asks
the cards that you got wrong again, until every answer is right.

## A program that asks: `input()`

Every program until now took its data from a file or from the command
line, before it started. A program that asks a question must stop in
the middle, wait for a person to type, and then continue with what the
person typed.

The function `input()` does this. It shows the text that you give it,
and then it waits. The person types a line and presses `Enter`.
`input()` then gives back what the person typed, as a string, without
the `Enter` at its end. It is like a clerk at a counter who asks you a
question, and writes down your answer before doing anything else.

Here is a small program, `ask.py`:

```python
name = input("What is your name? ")
print(f"Hello, {name}.")
```

When you run `python ask.py` and type `Asha`, the terminal shows:

```
What is your name? Asha
Hello, Asha.
```

What happened:

1. `input()` showed the text `What is your name? ` in the terminal.
   The text ends with a space, so that the answer does not touch the
   question mark.

2. The program stopped and waited. You typed `Asha` and pressed
   `Enter`.

3. `input()` gave back the string `"Asha"`, and the program gave it
   the name `name`.

4. `print()` showed the greeting.

`input()` always gives back a string. If you type `7`, it gives back
`"7"`, and not the integer `7`.

A program that waits for an answer does not stop by itself. If your
program keeps asking and you want to stop it, click in the terminal,
hold `Ctrl` and press `C`.

## What the program does

The program is a script named `drill.py`, in your work directory. You
run it with one **command line argument**, which is a word after the
name of the program in a command. The word is the name of the file of
cards:

```
python drill.py cards.csv
```

The file `cards.csv` is a CSV file: its first line is the header
`question,answer`, and each other line is one card. These are the
first two cards:

```
question,answer
How many days are in a week?,7
How many minutes are in an hour?,60
```

The program does this:

- It reads all the cards. `csv.DictReader` gives each card as a
  dictionary with the keys `question` and `answer`.

- It asks the questions in the order of the file. For each card, it
  shows the question, followed by one space, and waits for the answer.

- An answer is right when it is the same as the answer of the card,
  after the spaces at its start and its end are removed, and with no
  difference between small and capital letters. So `april` is a right
  answer for `April`. For a right answer, the program shows
  `Correct.`

- For a wrong answer, it shows `Wrong. The answer is 56.`, with the
  answer of the card in place of `56`.

- After it has asked every card, if some answers were wrong, it shows
  `Cards to ask again: 1`, with the number of those cards. Then it
  asks those cards again, in the same order. It continues in this way
  until there are no wrong answers.

- Its last line is `Finished: 5 cards, 6 answers.`, with the number of
  cards in the file, and the number of answers that you typed.

With `cards.csv`, if you type `7`, `60`, `54`, `april`, `3` and then
`56`, the terminal shows:

```
How many days are in a week? 7
Correct.
How many minutes are in an hour? 60
Correct.
What is 7 * 8? 54
Wrong. The answer is 56.
Which month comes after March? april
Correct.
How many sides does a triangle have? 3
Correct.
Cards to ask again: 1
What is 7 * 8? 56
Correct.
Finished: 5 cards, 6 answers.
```

## Part 1: ask each card one time

In this part the program asks each card one time, says whether the
answer is right, and shows the last line. It does not ask the wrong
cards again yet, so it shows no line `Cards to ask again:`, and the
number of answers is the number of cards.

First make the file. Click the action below, so that the file browser
shows your work directory.

```{file-browser-reveal}
:id: drill-show-files
:title: Show your work directory in the file browser
:path: cards.csv
```

In the file browser, click the empty space under the names of the
files with the right button of the mouse. On a Mac with one button,
hold `Ctrl` and click. Click `New File`, type the name `drill.py`, and
press `Enter`. Then double-click `drill.py` to open it in the editor.

Write the program in the editor. Save the file, and run it in the
terminal:

```
python drill.py cards.csv
```

Answer the five questions. Give one wrong answer on purpose, to see
the line `Wrong.`. When the program works, click `Check`. The check
runs your program with a file of three cards of its own,
`_check_asks.csv`. It gives the program all the answers in advance, so
it does not wait for you.

````{hint}
:title: "Hint: what to look at"
The workshop **CSV and JSON** read a CSV file with `csv.DictReader`:

```python
with open(sys.argv[1], newline="") as file:
    for row in csv.DictReader(file):
        cards.append(row)
```

After this, `cards` is a list of dictionaries, and `card["question"]`
and `card["answer"]` are the two parts of one card.

`input(card["question"] + " ")` shows the question and one space, and
gives back what the person typed. To compare two strings with no
difference between small and capital letters and with no spaces at the
ends, compare `reply.strip().lower()` with `card["answer"].lower()`.
````

```{hint}
:title: "Hint: the shape of the code"
1. At the top of the file, import `csv` and `sys`.

2. Write a function `main()`. In it, make an empty list `cards`, and
   fill it from the file named by `sys.argv[1]`, as the first hint
   shows.

3. Make a name `answers` with the value `0`, to count the answers.

4. Loop over the cards with `for card in cards:`. In the loop, ask the
   question with `input()`, add 1 to `answers`, and show `Correct.` or
   the line `Wrong.` with an `if` and an `else`.

5. After the loop, show
   `f"Finished: {len(cards)} cards, {answers} answers."`.

6. At the end of the file, at the left side, write
   `if __name__ == "__main__":` and, under it with four spaces,
   `main()`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have clicked `Check` one time.

```{attempt}
:id: asks-no-file
:check: drill-asks
:expect: There is no file drill.py in your work directory
```

````{attempt}
:id: asks-empty
:check: drill-asks
:expect: Your program showed nothing

```{file-write}
:path: drill.py
```
````

````{attempt}
:id: asks-error
:check: drill-asks
:expect: Its last line is: NameError

```{file-write}
:path: drill.py
print(cards)
```
````

````{attempt}
:id: asks-too-many
:check: drill-asks
:expect: Your program asked for more answers than there are cards

```{file-write}
:path: drill.py
while True:
    input("Your answer? ")
```
````

````{attempt}
:id: asks-no-question
:check: drill-asks
:expect: does not show the question

```{file-write}
:path: drill.py
import csv
import sys

with open(sys.argv[1], newline="") as file:
    cards = list(csv.DictReader(file))
for card in cards:
    reply = input()
    print("Correct.")
print(f"Finished: {len(cards)} cards, {len(cards)} answers.")
```
````

````{attempt}
:id: asks-never-correct
:check: drill-asks
:expect: showed Correct. 0 times

```{file-write}
:path: drill.py
import csv
import sys

with open(sys.argv[1], newline="") as file:
    cards = list(csv.DictReader(file))
for card in cards:
    reply = input(card["question"] + " ")
    if reply == card["answer"] + "\n":
        print("Correct.")
    else:
        print(f"Wrong. The answer is {card['answer']}.")
print(f"Finished: {len(cards)} cards, {len(cards)} answers.")
```
````

````{attempt}
:id: asks-no-finish
:check: drill-asks
:expect: The first missing line is: Finished: 3 cards, 3 answers.

```{file-write}
:path: drill.py
import csv
import sys

with open(sys.argv[1], newline="") as file:
    cards = list(csv.DictReader(file))
for card in cards:
    reply = input(card["question"] + " ")
    if reply.strip().lower() == card["answer"].lower():
        print("Correct.")
    else:
        print(f"Wrong. The answer is {card['answer']}.")
```
````

````{attempt}
:id: asks-short-wrong
:check: drill-asks
:expect: For a wrong answer, your program must show

```{file-write}
:path: drill.py
import csv
import sys

with open(sys.argv[1], newline="") as file:
    cards = list(csv.DictReader(file))
for card in cards:
    reply = input(card["question"] + " ")
    if reply.strip().lower() == card["answer"].lower():
        print("Correct.")
    else:
        print("Wrong.")
print(f"Finished: {len(cards)} cards, {len(cards)} answers.")
```
````

````{attempt}
:id: asks-exact
:check: drill-asks
:expect: with spaces round it and in small letters

```{file-write}
:path: drill.py
import csv
import sys

with open(sys.argv[1], newline="") as file:
    cards = list(csv.DictReader(file))
for card in cards:
    reply = input(card["question"] + " ")
    if reply == card["answer"]:
        print("Correct.")
    else:
        print(f"Wrong. The answer is {card['answer']}.")
print(f"Finished: {len(cards)} cards, {len(cards)} answers.")
```
````

````{hint}
:title: Show me a solution
:unlock: "drill-asks" in failed_checks or "drill-asks" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes a working program into `drill.py` and
opens it. Read it, and compare it with your own. The other actions
start the program and type the five answers for you, one of them
wrong.

```{file-write}
:id: asks-solution
:title: Write a solution into drill.py
:path: drill.py
:open: true
import csv
import sys


def read_cards(filename):
    cards = []
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            cards.append(row)
    return cards


def main():
    cards = read_cards(sys.argv[1])
    answers = 0
    for card in cards:
        reply = input(card["question"] + " ")
        answers = answers + 1
        if reply.strip().lower() == card["answer"].lower():
            print("Correct.")
        else:
            print(f"Wrong. The answer is {card['answer']}.")
    print(f"Finished: {len(cards)} cards, {answers} answers.")


if __name__ == "__main__":
    main()
```

```{execute}
:id: asks-start
:title: Start the drill
:wait: 1s
python drill.py cards.csv
```

```{execute}
:id: asks-answer-1
:title: Answer 7
:wait: 1s
7
```

```{execute}
:id: asks-answer-2
:title: Answer 60
:wait: 1s
60
```

```{execute}
:id: asks-answer-3
:title: Answer 54, which is wrong
:wait: 1s
54
```

```{execute}
:id: asks-answer-4
:title: Answer april
:wait: 1s
april
```

```{execute}
:id: asks-answer-5
:title: Answer 3
:wait: prompt
3
```
````

```{verify}
:id: drill-asks
:label: drill.py asks each card and says whether the answer is right
:trigger: terminal-output "Finished:"; file-saved drill.py; after:asks-answer-5
import os, subprocess, sys
from pathlib import Path

assert Path("drill.py").exists(), "There is no file drill.py in your work directory. Make it in the file browser, in the same list as cards.csv, and save it."
cards = Path("_check_asks.csv")
questions = ["How many hours are in a day?", "What is 9 + 6?", "Which day comes after Monday?"]


def run(answers):
    typed = ", ".join(answers)
    try:
        done = subprocess.run(
            [sys.executable, "drill.py", str(cards)], input="".join(answer + "\n" for answer in answers),
            capture_output=True, text=True, timeout=10,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError(f"The check ran python drill.py _check_asks.csv with the answers {typed}. Your program did not end after 10 seconds. Look for a loop that never ends.") from None
    if done.returncode != 0:
        errors = done.stderr.strip().splitlines()
        last = errors[-1] if errors else "(Python showed no message)"
        if last.startswith("EOFError"):
            raise AssertionError(f"The check ran python drill.py _check_asks.csv with a file of 3 cards and the {len(answers)} answers {typed}. Your program asked for more answers than there are cards, and Python stopped with an EOFError, which means that there was no more to read. In this part, the program asks each card one time.")
        raise AssertionError(f"Python stopped with an error when the check ran python drill.py _check_asks.csv with the answers {typed}. Run python drill.py cards.csv in the terminal, and read the whole error there. Its last line is: {last}")
    return done.stdout.strip().splitlines()


try:
    cards.write_text("question,answer\nHow many hours are in a day?,24\nWhat is 9 + 6?,15\nWhich day comes after Monday?,Tuesday\n")
    right = run(["24", "15", "Tuesday"])
    mixed = run(["24", "16", "  tuesday ", "15"])
finally:
    cards.unlink(missing_ok=True)
about = "The check ran python drill.py _check_asks.csv with 3 cards of its own: How many hours are in a day? 24, What is 9 + 6? 15, Which day comes after Monday? Tuesday."
assert right, f"{about} Your program showed nothing. Did you save the file? Use input() to ask each question, and print() to show the result."
text = "\n".join(right)
missing = [question for question in questions if question not in text]
assert not missing, f"{about} Your program does not show the question {missing[0]} Give the question to input(), as in input(card[\"question\"] + \" \"), so that the person sees it."
wanted = [f"{question} Correct." for question in questions] + ["Finished: 3 cards, 3 answers."]
count = text.count("Correct.")
assert count == 3, f"{about} With the right answers 24, 15 and Tuesday, your program must show Correct. three times, and it showed Correct. {count} times. input() gives back a string without the Enter at its end. Compare reply.strip().lower() with card[\"answer\"].lower(), which are both strings."
for number, (found, expected) in enumerate(zip(right, wanted), start=1):
    if found != expected:
        raise AssertionError(f"{about} With the right answers 24, 15 and Tuesday, line {number} that your program showed is: {found}  It must be: {expected}  Change the program, save it, and click Check again.")
if len(right) < len(wanted):
    raise AssertionError(f"{about} With the right answers 24, 15 and Tuesday, your program must show {len(wanted)} lines, and it showed {len(right)}. The first missing line is: {wanted[len(right)]}")
if len(right) > len(wanted):
    raise AssertionError(f"{about} With the right answers 24, 15 and Tuesday, your program showed more than {len(wanted)} lines. The first line too many is: {right[len(wanted)]}")
second = "\n".join(mixed)
assert "What is 9 + 6? Wrong. The answer is 15." in second, f"{about} The check gave the wrong answer 16 to the question What is 9 + 6? For a wrong answer, your program must show Wrong. The answer is 15. with the answer of the card."
assert "Which day comes after Monday? Correct." in second, f"{about} The check gave the answer tuesday, with spaces round it and in small letters, to the question Which day comes after Monday? That answer is right, but your program did not show Correct. Remove the spaces with .strip(), and compare both strings with .lower()."
print(f"Correct. {about} Your program said Correct. for each right answer, and Wrong. for the answer 16.")
```

Your program asks each card one time. In the second part it asks the
wrong cards again.

## Part 2: ask the wrong cards again

Change the program so that it keeps a list of the cards that got a
wrong answer. After it has asked every card, if that list is not
empty, it shows `Cards to ask again:` and the number of those cards,
and it asks them again. It continues until a round has no wrong
answers. Then it shows the last line, with the number of cards in the
file and the number of answers that you typed.

Save the file, and run the drill again with one or two wrong answers.
Remember: if the program does not stop, click in the terminal, hold
`Ctrl` and press `C`. Then click `Check`. The check runs your program
with a file of its own, `_check_again.csv`, and gives the same card a
wrong answer two times.

````{hint}
:title: "Hint: what to look at"
The program does not know in advance how many rounds it needs, so a
`for` loop is not enough. The workshop **Doing it again** showed the
`while` loop, which repeats while its test is true. Here the test is
"there are still cards to ask": `while len(cards) > 0:`.

Inside the `while` loop, the `for` loop asks every card of `cards`,
and appends each card with a wrong answer to a new list, `wrong`.
After the `for` loop, give the name `cards` to that list. The next
round then asks only the wrong cards, and when there are none, the
`while` loop ends.

The list `cards` is empty at the end, so give the name `count` to
`len(cards)` before the loop, and use `count` in the last line.
````

```{hint}
:title: "Hint: the shape of the code"
1. After the cards are read, write `count = len(cards)`.

2. Write `while len(cards) > 0:`, and move the `for` loop inside it,
   with four more spaces at the start of each of its lines.

3. At the start of the `while` loop, before the `for` loop, make an
   empty list: `wrong = []`.

4. In the `else` of a wrong answer, add `wrong.append(card)`.

5. After the `for` loop, still inside the `while` loop: if
   `len(wrong) > 0`, show `f"Cards to ask again: {len(wrong)}"`. Then
   write `cards = wrong`.

6. After the `while` loop, show the last line with `count` in place of
   `len(cards)`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have clicked `Check` one time.

```{attempt}
:id: again-not-started
:check: drill-again
:expect: Your program does not ask the wrong cards again
```

````{attempt}
:id: again-one-round
:check: drill-again
:expect: asks the wrong cards again one time only

```{file-write}
:path: drill.py
import csv
import sys

with open(sys.argv[1], newline="") as file:
    cards = list(csv.DictReader(file))
answers = 0
wrong = []
for card in cards:
    reply = input(card["question"] + " ")
    answers = answers + 1
    if reply.strip().lower() == card["answer"].lower():
        print("Correct.")
    else:
        print(f"Wrong. The answer is {card['answer']}.")
        wrong.append(card)
if len(wrong) > 0:
    print(f"Cards to ask again: {len(wrong)}")
for card in wrong:
    reply = input(card["question"] + " ")
    answers = answers + 1
    if reply.strip().lower() == card["answer"].lower():
        print("Correct.")
    else:
        print(f"Wrong. The answer is {card['answer']}.")
print(f"Finished: {len(cards)} cards, {answers} answers.")
```
````

````{attempt}
:id: again-all-cards
:check: drill-again
:expect: Your program asked for more answers than the check gave it

```{file-write}
:path: drill.py
import csv
import sys

with open(sys.argv[1], newline="") as file:
    cards = list(csv.DictReader(file))
answers = 0
finished = False
while not finished:
    finished = True
    for card in cards:
        reply = input(card["question"] + " ")
        answers = answers + 1
        if reply.strip().lower() == card["answer"].lower():
            print("Correct.")
        else:
            print(f"Wrong. The answer is {card['answer']}.")
            finished = False
    if not finished:
        print(f"Cards to ask again: {len(cards)}")
print(f"Finished: {len(cards)} cards, {answers} answers.")
```
````

````{attempt}
:id: again-zero-cards
:check: drill-again
:expect: Finished: 0 cards

```{file-write}
:path: drill.py
import csv
import sys

with open(sys.argv[1], newline="") as file:
    cards = list(csv.DictReader(file))
answers = 0
while len(cards) > 0:
    wrong = []
    for card in cards:
        reply = input(card["question"] + " ")
        answers = answers + 1
        if reply.strip().lower() == card["answer"].lower():
            print("Correct.")
        else:
            print(f"Wrong. The answer is {card['answer']}.")
            wrong.append(card)
    if len(wrong) > 0:
        print(f"Cards to ask again: {len(wrong)}")
    cards = wrong
print(f"Finished: {len(cards)} cards, {answers} answers.")
```
````

````{attempt}
:id: again-line
:check: drill-again
:expect: Line 4 that your program showed is: Again: 2

```{file-write}
:path: drill.py
import csv
import sys

with open(sys.argv[1], newline="") as file:
    cards = list(csv.DictReader(file))
count = len(cards)
answers = 0
while len(cards) > 0:
    wrong = []
    for card in cards:
        reply = input(card["question"] + " ")
        answers = answers + 1
        if reply.strip().lower() == card["answer"].lower():
            print("Correct.")
        else:
            print(f"Wrong. The answer is {card['answer']}.")
            wrong.append(card)
    if len(wrong) > 0:
        print(f"Again: {len(wrong)}")
    cards = wrong
print(f"Finished: {count} cards, {answers} answers.")
```
````

````{hint}
:title: Show me a solution
:unlock: "drill-again" in failed_checks or "drill-again" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes a working program into `drill.py` and
opens it. Compare it with your own. The other actions start the
program and type six answers for you: the third answer is wrong, and
the sixth answers that card again.

```{file-write}
:id: again-solution
:title: Write a solution into drill.py
:path: drill.py
:open: true
import csv
import sys


def read_cards(filename):
    cards = []
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            cards.append(row)
    return cards


def main():
    cards = read_cards(sys.argv[1])
    count = len(cards)
    answers = 0
    while len(cards) > 0:
        wrong = []
        for card in cards:
            reply = input(card["question"] + " ")
            answers = answers + 1
            if reply.strip().lower() == card["answer"].lower():
                print("Correct.")
            else:
                print(f"Wrong. The answer is {card['answer']}.")
                wrong.append(card)
        if len(wrong) > 0:
            print(f"Cards to ask again: {len(wrong)}")
        cards = wrong
    print(f"Finished: {count} cards, {answers} answers.")


if __name__ == "__main__":
    main()
```

```{execute}
:id: again-start
:title: Start the drill
:wait: 1s
python drill.py cards.csv
```

```{execute}
:id: again-answer-1
:title: Answer 7
:wait: 1s
7
```

```{execute}
:id: again-answer-2
:title: Answer 60
:wait: 1s
60
```

```{execute}
:id: again-answer-3
:title: Answer 54, which is wrong
:wait: 1s
54
```

```{execute}
:id: again-answer-4
:title: Answer april
:wait: 1s
april
```

```{execute}
:id: again-answer-5
:title: Answer 3
:wait: 1s
3
```

```{execute}
:id: again-answer-6
:title: Answer 56, for the card that is asked again
:wait: prompt
56
```
````

```{verify}
:id: drill-again
:label: drill.py asks the wrong cards again, until every answer is right
:trigger: terminal-output "Cards to ask again"; after:again-answer-6
import os, subprocess, sys
from pathlib import Path

assert Path("drill.py").exists(), "There is no file drill.py in your work directory. Make it in the file browser, in the same list as cards.csv, and save it."
cards = Path("_check_again.csv")
answers = ["24", "16", "monday", "14", "tuesday", "15"]
about = "The check ran python drill.py _check_again.csv with 3 cards of its own (How many hours are in a day? 24, What is 9 + 6? 15, Which day comes after Monday? Tuesday) and the six answers 24, 16, monday, 14, tuesday, 15. Two answers are wrong in the first round, one in the second, and none in the third."
wanted = [
    "How many hours are in a day? Correct.",
    "What is 9 + 6? Wrong. The answer is 15.",
    "Which day comes after Monday? Wrong. The answer is Tuesday.",
    "Cards to ask again: 2",
    "What is 9 + 6? Wrong. The answer is 15.",
    "Which day comes after Monday? Correct.",
    "Cards to ask again: 1",
    "What is 9 + 6? Correct.",
    "Finished: 3 cards, 6 answers.",
]
try:
    cards.write_text("question,answer\nHow many hours are in a day?,24\nWhat is 9 + 6?,15\nWhich day comes after Monday?,Tuesday\n")
    try:
        done = subprocess.run(
            [sys.executable, "drill.py", str(cards)], input="".join(answer + "\n" for answer in answers),
            capture_output=True, text=True, timeout=10,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError(f"{about} Your program did not end after 10 seconds. Look for a loop that never ends.") from None
finally:
    cards.unlink(missing_ok=True)
if done.returncode != 0:
    errors = done.stderr.strip().splitlines()
    last = errors[-1] if errors else "(Python showed no message)"
    if last.startswith("EOFError"):
        raise AssertionError(f"{about} Your program asked for more answers than the check gave it, and Python stopped with an EOFError, which means that there was no more to read. Each round must ask only the cards that got a wrong answer in the round before, and the program must stop when a round has no wrong answers.")
    raise AssertionError(f"{about} Python stopped with an error. Run python drill.py cards.csv in the terminal, and read the whole error there. Its last line is: {last}")
shown = done.stdout.strip().splitlines()
assert shown, f"{about} Your program showed nothing. Did you save the file?"
if shown[-1:] == ["Finished: 3 cards, 3 answers."]:
    raise AssertionError(f"{about} Your program does not ask the wrong cards again: it stopped after 3 answers. Keep the cards that got a wrong answer in a list, and ask them again in a while loop, until a round has no wrong answers.")
if shown[-1:] == ["Finished: 3 cards, 5 answers."]:
    raise AssertionError(f"{about} Your program asks the wrong cards again one time only, and then it stops after 5 answers, while the card What is 9 + 6? is still wrong. Use a while loop that repeats the rounds while there are cards to ask.")
if shown[-1:] == ["Finished: 0 cards, 6 answers."]:
    raise AssertionError(f"{about} The last line that your program showed is Finished: 0 cards, 6 answers. The list of cards is empty at the end of the drill, so count the cards before the while loop, with count = len(cards), and show count in the last line.")
for number, (found, expected) in enumerate(zip(shown, wanted), start=1):
    if found != expected:
        raise AssertionError(f"{about} Line {number} that your program showed is: {found}  It must be: {expected}  Change the program, save it, and click Check again.")
if len(shown) < len(wanted):
    raise AssertionError(f"{about} Your program must show {len(wanted)} lines, and it showed {len(shown)}. The first missing line is: {wanted[len(shown)]}")
if len(shown) > len(wanted):
    raise AssertionError(f"{about} Your program showed more than {len(wanted)} lines. The first line too many is: {shown[len(wanted)]}")
print(f"Correct. {about} Your program asked the wrong cards again, round after round, and stopped when every answer was right.")
```

## What you have now

Your drill works with any file of questions and answers that has the
header `question,answer`. Make a file of your own, for example with
words of a language that you learn, and run the drill on it.

If you want to do more, add an option `--shuffle` that asks the cards
in a random order, with `random.shuffle(cards)` from the module
`random`. The workshop **Taking arguments** showed how to add an
option with `argparse`.
