---
title: What you have learned
---

# What you have learned

Your functions can now have options. A call gives only the values
that it wants to change, and says by name which values they are. You
wrote two functions that were completely your own, and one of them
used the other.

## The ideas

- A **default value** is the value that Python uses for a parameter
  when the call gives no argument for it. You write it in the `def`
  line, after the name of the parameter and the symbol `=`.

- In the `def` line, the parameters that have a default value come
  after the parameters that have none.

- A **positional argument** is an argument that Python matches to a
  parameter by its position in the call.

- A **keyword argument** is an argument that has the name of its
  parameter in front of it. Python matches it by the name, so the
  order does not matter.

- In a call, positional arguments come first, and keyword arguments
  come after them.

- When a function has several default values, a keyword argument
  changes one of them and leaves the others as they are.

- A **docstring** is a string that says what a function does. It is
  the first line of the body. `help()` shows it.

- The body of a function can call another function. Each function
  does one piece of work, and a calculation is written in one place
  only.

## The code

| Code | What it does |
|------|--------------|
| `def greet(name, greeting="Hello"):` | defines a function whose parameter `greeting` has the default value `"Hello"` |
| `greet("Aiko")` | calls the function, and `greeting` gets its default value |
| `greet("Aiko", "Hi")` | gives two positional arguments |
| `greet("Aiko", greeting="Hi")` | gives one positional argument and one keyword argument |
| `make_tea(milk=True)` | changes one option, and every other parameter keeps its default value |
| `print(2026, 3, 14, sep="-")` | shows the values with `-` between them |
| `"""Return a greeting."""` | as the first line of a body, is the docstring of the function |
| `help(greet)` | shows the parameters and the docstring of the function `greet` |
| `return item_cost(price, quantity) + delivery` | calls another function, and uses its return value |

## What comes next

Until now, you found a value in a list by its position, with an
index. Often you want to find a value by a name instead: the price of
a product by the name of the product, or a telephone number by the
name of a person. The next workshop, **Looking things up**, shows how
Python does that.

Click `Finish` at the bottom of this panel.
