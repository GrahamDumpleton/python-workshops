---
title: What you have learned
---

# What you have learned

You can now write functions of your own. You wrote five of them in
this workshop, and you wrote the last one from a description alone.

## The ideas

- A **function** is a group of lines of code that has a name. You
  write the lines once, and you use them many times. The name says
  what the lines do.

- To **define** a function is to write it, with the word `def`. A
  cell that only defines a function shows nothing.

- The **body** of a function is the group of lines under the `def`
  line. Each line of the body begins with four spaces.

- To **call** a function is to tell Python to run its body. You write
  the name, and then a pair of parentheses.

- A **parameter** is a name between the parentheses of the `def`
  line. An **argument** is a value between the parentheses of the
  call. Python makes each parameter refer to the argument in the same
  position.

- `return` gives a value back to the code that called the function.
  That value is the **return value**, and the program can use it in
  every place where a value can be used.

- `print()` shows a value on the screen for a person. `return` gives
  a value to the program. A function that calculates something
  returns the result.

- A function with no `return` gives back **`None`**, the value that
  means "there is no value here". The word `None` in your output, or
  the word `NoneType` in an error message, usually means that a
  function prints a result that it must return.

## The code

| Code | What it does |
|------|--------------|
| `def show_menu():` | begins a function that has the name `show_menu` and no parameters |
| `show_menu()` | calls the function, so that Python runs its body |
| `def welcome_guest(guest):` | begins a function that has one parameter, `guest` |
| `welcome_guest("Aiko")` | calls the function with the argument `"Aiko"` |
| `def area(width, height):` | begins a function that has two parameters |
| `return width * height` | in a body, gives the result back to the code that called the function |
| `floor_area = area(4, 3)` | calls the function, and gives the name `floor_area` to the return value |
| `print(area(2, 5))` | calls the function, and shows the return value |

## What comes next

Each function that you wrote needs every one of its arguments on every
call. The next workshop, **Functions with options**, shows how to
give a parameter a value that is used when the call does not give
one. It also shows how to describe a function for the people who use
it, and how one function can call another function.

Click `Finish` at the bottom of this panel.
