---
title: Code that other people wrote
requires: [quiz:which-meaning]
---

# Code that other people wrote

The report of the spending tracker is plain lines of text. A table,
with a heading for each column and lines between the rows, is easier
to read. You could write the code that draws such a table yourself.
It would take you many hours, and other programmers have already
done this work and published it.

## The standard library is not everything

The **standard library** is the set of modules that come with
Python, such as `csv` and `decimal`. It holds much, but it cannot
hold everything. It has no module that draws a table in the terminal.

So programmers publish code of their own for other people to use.
Most of it costs nothing. A program that draws tables, a program that
reads a spreadsheet, a program that makes a chart: someone has
written each of these, and you can use them in your programs.

## A second meaning of the word "package"

In the workshop **Making a package**, a **package** was a directory
that holds modules. Your directory `spending` is a package in that
meaning.

The word has a second meaning, and programmers use it more often:
a **package** is code that someone has published for other people to
install. To **install** a package means to copy it to your computer,
into a place where Python finds it.

The two meanings are connected. When you install a package, you
usually get a directory that holds modules.

In this workshop you install the package `rich`. Its work is to show
text in the terminal in a better form: with colours, and as tables.
The name is one word, in small letters.

## Where packages come from

**PyPI** is the Python Package Index, the website that packages are
installed from. Its address is [pypi.org](https://pypi.org), and each
package has a page there. The page of `rich` is
[pypi.org/project/rich](https://pypi.org/project/rich/). You do not
need to open it now.

An everyday comparison: PyPI is like a very large public library.
Anyone can give a book to it, and anyone can take a copy of a book
home. The copy that you take home is yours to use, and the library
keeps the book for the next person.

The comparison shows one more thing. Nobody at the library reads
every book before it goes on the shelf. In the same way, anyone can
publish a package on PyPI. So programmers install packages that are
well known, and they read each name with care before they install
it. A name with one wrong letter can be another package, from
another person.

## A dependency

A **dependency** is a package that your program needs. When the
spending tracker uses `rich` to show a table, `rich` is a dependency
of the spending tracker. The program cannot run on a computer that
does not have `rich`.

That is a new situation for you. Until now, your programs ran on
every computer that had Python. From now on, a program can need more
than Python, and you must have a way to say what it needs. You learn
that way later in this workshop.

```{quiz}
:id: which-meaning
:title: Two meanings of one word
question: "A programmer says: \"Install the package `rich` first.\" What does the word \"package\" mean here?"
options:
  - { text: "A directory of your own that holds modules, such as `spending`", explanation: "That is the first meaning of the word. You do not install a directory that you made yourself. It is already on your computer." }
  - { text: "Code that someone has published for other people to install", correct: true }
  - { text: "A module that comes with Python, such as `csv`", explanation: "A module that comes with Python is part of the standard library. It is already there, so you never install it." }
explanation: "When a programmer talks about installing, a package is code that someone has published for other people to install. The package `rich` is on PyPI, the website that packages are installed from. On the next pages you make a place for it, and then you install it."
```
