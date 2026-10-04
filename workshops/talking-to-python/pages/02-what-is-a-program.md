---
title: What is a program?
requires: [quiz:interpreter-job]
---

# What is a program?

Before you write any code, it helps to know what code is for. This
page has no code. It explains four words that the rest of the course
uses.

## A program

A **program** is a list of instructions for a computer. The computer
follows the instructions one after another, in the order in which they
are written.

A recipe is a good comparison. A recipe is a list of steps, and a cook
follows the steps in order to make a meal.

There is one important difference. A cook understands what you mean.
If a recipe forgets to say "turn on the oven", the cook turns it on
anyway. A computer does not understand what you mean. It does exactly
what the instructions say, and nothing more. For this reason, the
instructions in a program must be complete and exact.

## A programming language

A computer does not understand English, or any other human language.
The instructions must be written in a **programming language**: a
small language with strict rules, which was designed for giving
instructions to computers.

**Python** is a programming language. Many people learn it as their
first one, because Python code is short and reads almost like plain
English. It is also used for real work: for websites, for science, for
data, and for many other things.

Writing instructions in a programming language is called
**programming**. The instructions that you write are called **code**.

## The Python interpreter

Code is only text. Something must read that text and do what it says.

That something is a program called the **Python interpreter**. The
interpreter reads your code, one instruction at a time, and performs
each instruction.

So the word "Python" has two meanings. It is the name of the language
that you write, and it is also the name of the program that reads what
you wrote. In these workshops, a sentence such as "Python calculates
the result" means that the interpreter does it.

## Where the notebook fits

When you run a cell in a notebook, this is what happens:

1. The notebook sends the code in the cell to the Python interpreter.

2. The interpreter performs the instructions in the code.

3. The interpreter sends the result back.

4. The notebook shows the result under the cell, as the output.

A notebook is a convenient way to talk to Python: you send a small
piece of code, and you see the answer immediately.

```{quiz}
:id: interpreter-job
:title: The interpreter
question: What does the Python interpreter do?
options:
  - { text: "It changes English sentences into Python code", explanation: "The interpreter does not understand English. You write the Python code, and the interpreter performs it." }
  - { text: "It reads Python code and performs the instructions in it", correct: true }
  - { text: "It shows the pages of this workshop", explanation: "The instructions panel shows the pages. The interpreter is the program that runs your Python code." }
explanation: "The interpreter reads your code, one instruction at a time, and does exactly what each instruction says."
```
