---
title: What a test is for
requires: [quiz:when-a-test-helps]
---

# What a test is for

A **test** is code that checks other code. It runs a small part of
your program with values that you choose, and it compares the result
with the result that you know is correct. When the two are the same,
the test passes. When they are different, the test fails, and it
tells you so.

## Why programmers write tests

You already check your code. You run the program, you look at what it
shows, and you decide whether it is correct. That works on the day
that you write the code.

The problem comes later. The spending tracker has a class `Ledger`
with the methods `total()`, `select()` and more, and a function
`report_lines()`. Next month you change the method `total()`. Does
the report still show the correct lines? Does `select()` still keep
the correct purchases? To know, you must run every part of the
program again and look at every result with care. Nobody does that
after every change, so a mistake can stay hidden for weeks.

A test does that work for you. You write it one time. After that, you
run all the tests of the project with one command, in less than a
second, after every change. A test that passed yesterday and fails
today tells you at once what your change broke, and where.

So the value of a test comes later, when you change the code.

## An everyday comparison

Think of a recipe for bread that you have made many times. You know
that 500 grams of flour give one loaf that weighs about 800 grams.
One day you change the recipe: less salt, and a different flour. You
weigh the new loaf. If it weighs 400 grams, you know at once that
something in the change went wrong.

The scales are your test. They do not tell you how to make bread.
They tell you quickly whether the result is still what you expect.

## What a test is made of

Every test has the same three parts:

1. It prepares the values: for example, a ledger with three purchases
   whose amounts you know.

2. It runs the code that it tests: for example, the method `total()`.

3. It compares the result with the correct result, which you worked
   out yourself: for example, `18.30`.

On the next pages you write tests in this form. First, a question.

```{quiz}
:id: when-a-test-helps
:title: When a test helps most
question: "You wrote a test for the method `total()` last week, and it passed. When does this test help you most?"
options:
  - { text: "On the day that you wrote the method, because then you can see that it works", explanation: "On that day you also look at the result yourself. The test helps more when you no longer remember how the method works." }
  - { text: "Each time that you change the program later, because it tells you at once whether the change broke the method", correct: true }
  - { text: "Never, because a test that passed one time will always pass", explanation: "A test runs the code as it is now. When the code changes, the result can change, and then the test fails." }
explanation: "A test runs the code as it is at that moment. When you change the program, you run the tests again. A test that fails after the change shows you what the change broke, before anybody else sees the mistake."
```
