---
title: A second project
requires: [quiz:predict-too-old, quiz:too-old-error]
---

# A second project

One project uses the shared Python, and it works. On this page a
second project arrives, and it needs something that the first project
does not need.

## The project `labels`

Think of this situation. Today you start a new project. It will print
labels for the jars in a kitchen, each label in a colour. It is in a
directory of its own, with the name `labels`.

Click the action below to open the program in the editor.

```{file-open}
:id: open-labels
:title: Open labels/labels.py in the editor
:path: labels/labels.py
```

The program has three lines of code, with an empty line after the
first:

```python
import webcolors

names = webcolors.names()
print("The labels can use", len(names), "colours")
```

It imports the same package, `webcolors`. The line that begins with
`names =` calls a function of the package with the name `names()`.
The function returns a list of the names of all the colours that the
package knows. The last line shows how many names the list has.

## The same package, another version

You found the function `names()` in the documentation of the package.
The documentation describes the newest version, because you start
this project today.

The function `names()` is new. The author of the package added it in
a version later than `1.13`. Version `24.11.1` has it. Version `1.13`
does not have it.

So the two projects need the same package, in two versions:

| Project | What it uses | The version that it needs |
|---------|--------------|---------------------------|
| `poster` | the dictionary `CSS3_NAMES_TO_HEX` | `1.13` |
| `labels` | the function `names()` | `24.11.1` |

## Predict

The shared Python has version `1.13` of the package now.

```{quiz}
:id: predict-too-old
:title: Predict the result
question: "What happens when you run `labels/labels.py` with the shared Python now?"
options:
  - { text: "Python stops with a `ModuleNotFoundError`, because the right version of the package is not installed.", explanation: "The search of an import goes by the name only. A package with the name `webcolors` is in `site-packages`, so the import finds it. The import does not ask which version it is." }
  - { text: "The program works, because Python gets the newer version when a program needs it.", explanation: "Python never installs anything when it runs a program. It uses the files that are in `site-packages` now." }
  - { text: "The import works, and then Python stops with an error message on the line that calls `names()`.", correct: true }
explanation: "The line `import webcolors` finds the package that is installed, which is version `1.13`. That version has no function with the name `names`. So the first line works, and the second line fails."
```

## Run it

Type this command in the terminal, and press `Enter`:

```
shared-python/bin/python labels/labels.py
```

````{hint}
:title: Run the command for me
:unlock: "too-old-error" in failed_checks
:locked: Answer the question below first

```{execute}
:id: run-labels-old
:wait: prompt
shared-python/bin/python labels/labels.py
```
````

The terminal shows a traceback. Read its last line.

```{quiz}
:id: too-old-error
:type: text
:case: false
:title: The type of the error
question: "The last line of the traceback begins with the type of the error. Type that one word, without the colon."
answer:
  - "AttributeError"
  - { pattern: "AttributeError:.*", example: "AttributeError: module 'webcolors' has no attribute 'names'" }
wrong:
  - { pattern: "ModuleNotFoundError.*", explanation: "That was the error of the project `poster`, before you installed the package. Look at the newest traceback in the terminal, and read its last line." }
  - { pattern: "Traceback.*", explanation: "The word `Traceback` begins the first line. Read the last line of the error message." }
otherwise: "Find the last line of the newest error message in the terminal. It begins with one word that ends with `Error`. Type that word."
explanation: "An `AttributeError` means that a value does not have the attribute that the code asked for. Here the value is the module `webcolors`, and the attribute is `names`."
```

## What happened

The terminal shows this, with `...` in place of the part of the path
that differs on each computer:

```
Traceback (most recent call last):
  File ".../work/labels/labels.py", line 3, in <module>
    names = webcolors.names()
            ^^^^^^^^^^^^^^^
AttributeError: module 'webcolors' has no attribute 'names'
```

The traceback names line 3 of the file, which is the line that calls
`names()`. Line 1, the import, worked. Python found
a package with the right name. It is the wrong version for this
program, and Python cannot know that. An `import` line says a name.
It does not say a version.

The message does not say that the package is too old. It says only
that an attribute is missing. When a program that follows the
documentation fails in this way, ask which version of the package is
installed.

On the next page you install the version that `labels` needs.
