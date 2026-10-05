---
title: A project that needs a package
requires: [quiz:predict-missing, quiz:missing-error]
---

# A project that needs a package

Your work directory holds two small projects. On this page you look
at the first one, and you see what happens when a project needs a
package that is not installed.

## The project `poster`

Think of this situation. Last year you wrote a program that helps you
to make a poster. The program is finished, and you have used it many
times since. It is in a directory of its own, with the name `poster`.

Click the action below to open the program in the editor.

```{file-open}
:id: open-poster
:title: Open poster/poster.py in the editor
:path: poster/poster.py
```

The program has three lines of code, with an empty line after the
first:

```python
import webcolors

code = webcolors.CSS3_NAMES_TO_HEX["teal"]
print("The poster uses the colour teal. Its code is", code)
```

- **The line `import webcolors`** imports a package with the name
  `webcolors`. This package knows the colours that web pages use. A
  web page often writes a colour as a code, such as `#008080`, in
  place of its name. The package knows which code belongs to each
  name of a colour.

- **The line that begins with `code =`** uses a dictionary of that
  package. The dictionary has the name `CSS3_NAMES_TO_HEX`. Each key
  is the name of a colour, and each value is the code of that colour.
  The line looks up the key `"teal"`, which is a colour between blue
  and green.

- **The last line** shows the code.

The package `webcolors` is not a part of the standard library, and
you did not write it. Somebody published it for other people to use.
So this program works only with a Python that has this package
installed.

## Predict

On the page before this one, you saw what the `site-packages` of the
shared Python holds: the tool `pip`, and nothing more.

```{quiz}
:id: predict-missing
:title: Predict the result
question: "What happens when you run `poster/poster.py` with the shared Python now?"
options:
  - { text: "Python gets the package `webcolors` from the internet, and then the program shows the code.", explanation: "Python does not use the internet for an import. It searches only the directories of `sys.path` on your computer." }
  - { text: "Python stops with an error message, because no directory of `sys.path` holds the package `webcolors`.", correct: true }
  - { text: "The program shows the code, because Python knows the colours without the package.", explanation: "Python itself has no dictionary of the colours of web pages. The program gets it from the package, on its first line." }
explanation: "The line `import webcolors` starts a search. The package is not in the directory of the script, not in the standard library, and not in `site-packages`. So the search finds nothing, and Python stops the program."
```

## Run it

Now test your prediction. Type this command in the terminal, and
press `Enter`:

```
shared-python/bin/python poster/poster.py
```

The command has two paths. The first path is the program to run, the
shared Python. The second path is the script, `poster.py` in the
directory `poster`.

````{hint}
:title: Run the command for me

```{execute}
:id: run-poster-missing
:wait: prompt
shared-python/bin/python poster/poster.py
```
````

The terminal shows a traceback. Read its last line.

```{quiz}
:id: missing-error
:type: text
:case: false
:title: The type of the error
question: "The last line of the traceback begins with the type of the error. Type that one word, without the colon."
answer:
  - "ModuleNotFoundError"
  - { pattern: "ModuleNotFoundError:.*", example: "ModuleNotFoundError: No module named 'webcolors'" }
wrong:
  - { pattern: "Traceback.*", explanation: "The word `Traceback` begins the first line. Read the last line of the error message." }
  - { pattern: "webcolors", explanation: "That is the name of the package, which is at the end of the last line. Type the word that the last line begins with." }
otherwise: "Find the last line of the error message in the terminal. It begins with one long word that ends with `Error`. Type that word."
explanation: "A `ModuleNotFoundError` means that no directory of `sys.path` holds a module or a package with the name that the `import` line asked for."
```

## What happened

The terminal shows this, with `...` in place of the part of the path
that differs on each computer:

```
Traceback (most recent call last):
  File ".../work/poster/poster.py", line 1, in <module>
    import webcolors
ModuleNotFoundError: No module named 'webcolors'
```

The program stopped on its first line. Nothing is wrong with the
program. The Python that ran it does not have the package that the
program needs.

A package that a program needs has a name: it is a **dependency** of
the program. The package `webcolors` is a dependency of the project
`poster`.

On the next page you install it.
