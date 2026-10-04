---
title: Welcome
requires: [quiz:recap-self, quiz:recap-default, verify:notebook-created]
---

# Building on another class

You can write a class. Often the next class that you need is almost
the same as a class that you already have, or it is made of things
that you already have a class for. In this workshop you learn how to
use a class that exists to build a new one, so that you do not write
the same code twice.

There are two ways to do this. You learn both, and you learn a plain
rule that tells you which of the two to choose.

You will learn:

- how to write a class that starts with everything another class has.
  This is called inheritance

- how to add a method to the new class, and how to replace a method

- how to give the new class an attribute of its own, with
  `super().__init__(...)`

- how to ask which class an object was made from, with `isinstance()`

- how to write a class whose objects hold other objects. This is
  called composition

- when inheritance is the right choice, and when composition is

The examples come from the spending of one person, Mariam. Each
purchase has a date, a description, an amount and a category.

This workshop uses ideas from the workshop **Your first class**:
class, object, attribute, method, `self` and the method `__init__`.
The next page says again what each one is, so you can do this
workshop without the earlier ones.

In this workshop you write code in four places. Each task is small,
and each task has hints and a solution that you can open.

The workshop takes about twenty-five minutes.

## Two questions before you start

These two questions are about earlier workshops. If you have not done
those workshops, you can still answer the questions. The explanations
tell you what you need to know.

The first question is about the workshop **Your first class**. Read
this code:

```python
class Cup:
    def __init__(self, size):
        self.size = size

    def double(self):
        return self.size * 2

cup = Cup(250)
print(cup.double())
```

```{quiz}
:id: recap-self
:title: A method and self
question: "What does this code show?"
options:
  - { text: "`250`", explanation: "`250` is the value of the attribute `size`. The method `double()` returns that value multiplied by `2`." }
  - { text: "An error message, because the call `cup.double()` gives no argument for `self`", explanation: "You never write the argument for `self`. Python gives the object before the dot to the method as `self`." }
  - { text: "`500`", correct: true }
explanation: "`Cup(250)` makes an object, and the method `__init__` keeps `250` in the attribute `size` of that object. A method is a function that belongs to a value. In the call `cup.double()`, Python gives the object `cup` to the method as `self`. So `self.size` is `250`, and the method returns `500`."
```

The second question is about the workshop **Functions with options**.
Read this code:

```python
def price_with_tip(price, tip=2):
    return price + tip

print(price_with_tip(10))
print(price_with_tip(10, 5))
```

```{quiz}
:id: recap-default
:title: A parameter with a default value
question: "What does this code show?"
options:
  - { text: "`12` and then `15`", correct: true }
  - { text: "An error message, because the first call gives one argument only", explanation: "The parameter `tip` has a default value. A call that gives no argument for `tip` is allowed, and `tip` is then `2`." }
  - { text: "`12` and then `12`", explanation: "The default value is used only when the call gives no argument for that parameter. The second call gives `5`, so `tip` is `5`." }
explanation: "The parameter `tip` has the default value `2`. The first call gives no argument for `tip`, so `tip` is `2` and the function returns `12`. The second call gives `5` for `tip`, so the function returns `15`."
```

## Create your notebook

You do the work of this workshop in a notebook. Click the action below
to create the notebook and open it. You start to use it on the next
page.

```{notebook-create}
:id: create-notebook
:title: Create my notebook and open it
:path: {{ notebook }}
:open: true
- markdown: |
    # Building on another class

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
