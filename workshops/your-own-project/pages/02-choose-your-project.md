---
title: Choose your project
requires: [verify:chosen]
---

# Choose your project

Here are the four programs. Read about each one, and then choose the
one that you want to build. Each one is about the same amount of
work.

- **A file organiser.** A directory full of mixed files, such as
  photos, letters and lists, is hard to use. Your program sorts the
  files into directories by their type: all the `.pdf` files into a
  directory `pdf`, all the `.jpg` files into a directory `jpg`, and so
  on. First it only shows what it would do. It moves the files only
  when you ask it to. You use the module `pathlib`, which you know
  from the workshop **Reading and writing files**, and a few more of
  its tools.

- **A log analyser.** A web server is a program that sends web pages
  to the people who ask for them. It writes one line in a file for
  each page that it sends. Your program reads that file and reports
  the busiest hours, the pages that people asked for the most, and
  the errors. You use `Counter` from the module `collections`.

- **A password checker.** Your program gives a password a score from
  0 to 5, and says which rules the password breaks. You also write
  tests: a second file of code that checks that your checker gives
  the right answers.

- **A flashcard drill.** A flashcard has a question on one side and
  its answer on the other. Your program reads questions and answers
  from a file, asks each question in the terminal, and waits for you
  to type the answer. It asks the questions that you got wrong again,
  until every answer is right. You use the function `input()`, which
  the page explains.

```{choice}
:id: pick-brief
:track: true
:label: Choose your program
Which program do you want to build?
```

```{when} track == "file-organiser"
You chose **a file organiser**. Click `Next` to read its description.
```

```{when} track == "log-analyser"
You chose **a log analyser**. Click `Next` to read its description.
```

```{when} track == "password-checker"
You chose **a password checker**. Click `Next` to read its description.
```

```{when} track == "flashcard-drill"
You chose **a flashcard drill**. Click `Next` to read its description.
```

```{verify}
:id: chosen
:label: You have chosen a program
:trigger: after:pick-brief
import os

track = os.environ.get("TRACK", "")
assert track, "You have not chosen a program yet. Click one of the four buttons above."
print("You chose a program. Click Next to read its description.")
```

## What your work directory holds

A **directory** is a place that holds files and other directories.
"Folder" is another word for the same thing. Your work directory
holds the files for all four programs. You use only the files of the
program that you choose:

| Name | What it is | For |
|------|------------|-----|
| `downloads` | a directory of nine made-up files to sort | the file organiser |
| `access.log` | the log of a made-up web server, 172 lines | the log analyser |
| `cards.csv` | five questions with their answers | the flashcard drill |

The password checker needs no file.

## How to work

A complete program is too large to write before you run any of it.
Programmers build it in small steps, and run it after each step. Each description on
the next page is in two parts for this reason. Work in this way:

1. Write a few lines.

2. Save the file. Hold `Ctrl` and press `S`, or on a Mac hold `Cmd`
   and press `S`.

3. Run the program in the terminal, and read what it shows.

4. If Python shows an error, read the last line of the error first.
   It names the type of the error. The lines above it say which line
   of your file it happened in.

5. If the program shows something wrong, add a `print()` line that
   shows a value at the place that you have doubts about.

6. When a part is complete, click `Check`. The check runs your
   program with data of its own, and it says what it found.

If you want to build another of the programs afterwards, return to
this page and click another button. The files that you made stay in
your work directory.
