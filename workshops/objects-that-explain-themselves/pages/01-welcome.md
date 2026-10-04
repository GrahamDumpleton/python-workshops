---
title: Welcome
requires: [quiz:recap-self, quiz:recap-is, quiz:recap-fstring, verify:notebook-created]
---

# Objects that explain themselves

When you write a class of your own, Python knows very little about
its objects. Python does not know what text to show for an object.
Python also does not know when two objects are equal. In this
workshop you tell Python both things. Then you learn a shorter way,
where Python writes that code for you.

You will learn:

- what `print()` shows for an object of your own class, and why that
  text does not help you

- how to write the special method `__repr__`, which gives the text
  that Python shows for an object

- why two objects with the same values are not equal until the class
  says how to compare them

- how to write the special method `__eq__`, which says when two
  objects are equal

- how the line `@dataclass` above a class makes Python write these
  methods for you

- what a decorator is, and what a type hint is

This workshop uses ideas from earlier workshops: a class and its
objects, f-strings, the operators `==` and `is`, and `Decimal` for
amounts of money. Each page says again what an idea does before it
uses the idea, so you can do this workshop without the earlier ones.

In this workshop you write most of the code. Each task is small, and
each task has hints and a solution that you can open.

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Your first class**. Read
this code:

```python
class Stop:
    def __init__(self, name, minutes):
        self.name = name
        self.minutes = minutes

    def is_long(self):
        return self.minutes > 30

harbour = Stop("Harbour", 45)
print(harbour.is_long())
```

```{quiz}
:id: recap-self
:title: A method and self
question: "What does this code show?"
options:
  - { text: "`45`", explanation: "`45` is the value of the attribute `minutes`. The method `is_long()` returns the result of the comparison `self.minutes > 30`, which is a boolean." }
  - { text: "An error message, because the call `harbour.is_long()` gives no argument for `self`", explanation: "You never write an argument for `self`. Python gives the object before the dot, here `harbour`, to the parameter `self`." }
  - { text: "`True`", correct: true }
explanation: "The class `Stop` describes a new type of value. The line `Stop(\"Harbour\", 45)` makes an object of that type, and the method `__init__` gives the object the attributes `name` and `minutes`. Inside a method, `self` is the object that the method was called on. So `harbour.is_long()` compares `45` with `30`, and returns `True`."
```

The second question is about the workshop **Two names, one list**.
Read this code:

```python
first = [1, 2]
second = [1, 2]
third = first
print(first == second)
print(first is second)
print(first is third)
```

```{quiz}
:id: recap-is
:title: Equal, or the same
question: "What does this code show?"
options:
  - { text: "`True`, then `False`, then `True`", correct: true }
  - { text: "`True`, then `True`, then `True`", explanation: "The lists `first` and `second` are equal, but they are two lists. Each pair of square brackets makes a new list, so `first is second` is `False`." }
  - { text: "`True`, then `False`, then `False`", explanation: "The line `third = first` does not make a new list. It gives a second name to the list that `first` refers to, so `first is third` is `True`." }
explanation: "`==` asks whether two values are equal. The two lists hold equal items in the same order, so `first == second` is `True`. `is` asks whether two names refer to one value. `first` and `second` refer to two lists, so `first is second` is `False`. `third = first` gives a second name to one list, so `first is third` is `True`."
```

The third question is about the workshop **Working with text**. Read
this code:

```python
town = "Lima"
days = 3
print(f"{days} days in {town}")
```

```{quiz}
:id: recap-fstring
:title: An f-string
question: "What does this code show?"
options:
  - { text: "`{days} days in {town}`", explanation: "That is what a string without the letter `f` shows. The `f` before the first quote makes Python replace each pair of braces with a value." }
  - { text: "`3 days in Lima`", correct: true }
  - { text: "`days days in town`", explanation: "Python does not put the name in the text. It puts the value that the name refers to." }
explanation: "A string that begins with the letter `f` is an f-string. Python replaces each name between braces with the value that the name refers to. So `{days}` becomes `3` and `{town}` becomes `Lima`."
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
    # Objects that explain themselves

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
