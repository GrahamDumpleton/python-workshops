# Objects that explain themselves

The twenty-fifth workshop of the course, and the second of the set
**Your own types in Python**. It restates what a class, an object, an
attribute and a method are, then shows what `print()` gives for an
object of a class written by hand and why that text is no help. The
learner writes the special method `__repr__` and then, after
predicting that two objects with the same values are not equal, the
special method `__eq__`. The module `dataclasses` then does the same
work: `@dataclass` above the class, the fields written as `name:
type`, with a short explanation of what a decorator is and what a type
hint is. The learner ends by writing a dataclass with a method of
their own.

Twenty-five minutes, in a notebook. Python and its standard library
only, nothing to install. It runs in JupyterLite as well as
JupyterLab.
