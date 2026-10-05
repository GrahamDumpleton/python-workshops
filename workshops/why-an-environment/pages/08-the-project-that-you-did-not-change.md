---
title: The project that you did not change
requires: [quiz:predict-poster-after, quiz:missing-attribute]
---

# The project that you did not change

The project `labels` works now. On this page you go back to the
project `poster`, which you finished last year. You did not change it
on any page of this workshop.

## Predict

The project `poster` worked on the page **Install the package**.
Since then, you did one thing: you installed version `24.11.1` of the package `webcolors`
for the project `labels`.

```{quiz}
:id: predict-poster-after
:title: Predict the result
question: "What happens when you run `poster/poster.py` with the shared Python now?"
options:
  - { text: "It shows the code of the colour teal, as before, because nobody changed the program.", explanation: "The program is the same, but the package that it imports is not. Version `1.13` is not in `site-packages` any more." }
  - { text: "It may not work, because the package that it imports is now another version.", correct: true }
  - { text: "Python asks you which version of the package to use.", explanation: "Python never asks. It imports the files that are in `site-packages` now, and `site-packages` holds one version." }
explanation: "The program has not changed, but the shared Python now gives it version `24.11.1` of the package. The program was written for version `1.13`. Run it and see whether the newer version still has what the program uses."
```

## Run it

Type this command in the terminal, and press `Enter`. You ran the
same command on the page **Install the package**, so the up arrow can
find it.

```
shared-python/bin/python poster/poster.py
```

````{hint}
:title: Run the command for me
:unlock: "missing-attribute" in failed_checks
:locked: Answer the question below first

```{execute}
:id: run-poster-new
:wait: prompt
shared-python/bin/python poster/poster.py
```
````

The terminal shows a traceback. Read its last line.

```{quiz}
:id: missing-attribute
:type: text
:title: The missing attribute
question: "The last line of the traceback ends with the name of an attribute that the module `webcolors` does not have. Type that name."
answer: "CSS3_NAMES_TO_HEX"
wrong:
  - { text: "names", explanation: "That was the attribute of the project `labels`, on an earlier page. Look at the newest traceback in the terminal, under the command that runs `poster/poster.py`." }
  - { pattern: "AttributeError.*", explanation: "That is the type of the error, at the beginning of the line. Type the name at the end of the line, without the quotes." }
  - { text: "webcolors", explanation: "That is the name of the module, which has no such attribute. Type the name at the end of the line, without the quotes." }
  - { pattern: "'.*'", explanation: "Type the name without the quotes around it." }
otherwise: "Find the last line of the newest traceback in the terminal. It begins with `AttributeError` and ends with a name between quotes. Type that name, with capital letters as the terminal shows them, and without the quotes."
explanation: "The module `webcolors` that the shared Python imports now is version `24.11.1`, and it has no attribute with the name `CSS3_NAMES_TO_HEX`."
```

## What happened

The terminal shows this, with `...` in place of the part of the path
that differs on each computer:

```
Traceback (most recent call last):
  File ".../work/poster/poster.py", line 3, in <module>
    code = webcolors.CSS3_NAMES_TO_HEX["teal"]
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: module 'webcolors' has no attribute 'CSS3_NAMES_TO_HEX'
```

The import on line 1 worked, because a package with the name
`webcolors` is installed. Line 3 failed. The author of the package
changed it between the two versions, and version `24.11.1` has no
dictionary with the name `CSS3_NAMES_TO_HEX`. The program `poster`
was written for version `1.13`, and that version is gone.

## Why this is a problem

Look at what happened, step by step:

- You did not change the project `poster`. You did not even run it
  while you worked on the project `labels`.

- The install for `labels` replaced the version of the package that
  `poster` needs, because both projects use the same `site-packages`.

- The tool `pip` said `Successfully installed`. Nothing in the
  terminal said that another project would stop working.

- You found the problem only because you ran `poster` again. On a
  real computer, that can be weeks later, and it can be another
  person who finds it.

So an install for one project broke another project. Nobody made a
mistake in either program. The cause is that the two projects share
one Python, and so they share one `site-packages`.
