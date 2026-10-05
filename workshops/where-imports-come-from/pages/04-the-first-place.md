---
title: The first place
requires: [quiz:predict-cook, quiz:cook-result, quiz:predict-plan]
---

# The first place

The first item of `sys.path` is the directory of the script that you
run. On this page you see what that means, with two predictions.

## The directory of the script

On the page before, the first line of the output was your work
directory. Your work directory is also the current directory of the
terminal. So you cannot tell yet which of these two things Python
uses for the first place:

- the directory that holds the script

- the current directory of the terminal

The rule is the first one. The first place that Python searches is
the directory that holds the script. The current directory of the
terminal does not matter.

This is useful. A script and the modules beside it stay together.
You can run the script from any directory, and it still finds its
modules.

## A script in another directory

Your work directory holds a directory with the name `kitchen`. It
holds two files. Click the two actions below to open them.

```{file-open}
:id: open-recipe
:title: Open the module kitchen/recipe.py
:path: kitchen/recipe.py
```

```{file-open}
:id: open-cook
:title: Open the script kitchen/cook.py
:path: kitchen/cook.py
```

The module `recipe.py` holds two values:

```python
title = "Bread"
flour_in_grams = 500
```

The script `cook.py` imports that module. It shows the first item of
`sys.path`, and then one line about the recipe:

```python
import sys

import recipe

print("The first place is", sys.path[0])
print(recipe.title, "needs", recipe.flour_in_grams, "grams of flour")
```

You will run the script with this command, from your work directory:

```
python kitchen/cook.py
```

The text `kitchen/cook.py` is a path. It says that the file `cook.py`
is in the directory `kitchen`. The current directory of the terminal
stays your work directory. The file `recipe.py` is not in your work
directory. It is in `kitchen`.

Predict what happens before you run the command.

```{quiz}
:id: predict-cook
:title: Predict the result
question: "The current directory is your work directory. Does `import recipe` in the script `kitchen/cook.py` find the file `recipe.py`?"
options:
  - { text: "No. Python searches the current directory first, and `recipe.py` is not there.", explanation: "The first place is not the current directory of the terminal. It is the directory that holds the script, which is `kitchen`." }
  - { text: "Yes. Python searches the directory of the script first, and that directory is `kitchen`.", correct: true }
  - { text: "Yes. Python searches every directory inside the current directory.", explanation: "Python does not look inside other directories for you. It searches only the directories that are in the list `sys.path`." }
explanation: "The first item of `sys.path` is the directory that holds the script. The script is `kitchen/cook.py`, so the first place is the directory `kitchen`, and `recipe.py` is there."
```

Now type the command in the terminal, and press `Enter`:

```
python kitchen/cook.py
```

````{hint}
:title: Run the command for me
:unlock: "cook-result" in failed_checks
:locked: Answer the question below first

```{execute}
:id: run-cook
:wait: prompt
python kitchen/cook.py
```
````

The terminal shows two lines. The first line begins with
`The first place is`, and then it shows a long path.

```{quiz}
:id: cook-result
:type: text
:case: false
:title: The first place
question: "What is the last part of the path in the first line, after the last `/`?"
answer:
  - "kitchen"
  - { pattern: ".*/kitchen/?", example: "/home/asha/where-imports-come-from/work/kitchen" }
wrong:
  - { pattern: "(.*/)?work/?", explanation: "The directory `work` is in the path, but it is not the last part. Read the characters after the last `/` of the first line." }
  - { pattern: ".*cook\\.py", explanation: "That is the name of the script. Look at the line that begins with `The first place is`, and read the characters after its last `/`." }
otherwise: "Find the line that begins with `The first place is`. Read the characters after the last `/` of that line."
explanation: "The first place is the directory `kitchen`, because the script is in that directory. The second line, `Bread needs 500 grams of flour`, shows that the import worked."
```

## A module that Python cannot find

Now the other direction. Your work directory holds a script with the
name `plan.py`. Click the action below to open it.

```{file-open}
:id: open-plan
:title: Open the script plan.py
:path: plan.py
```

```python
import recipe

print("This week:", recipe.title)
```

This script also has the line `import recipe`. But this script is in
your work directory, and the file `recipe.py` is in the directory
`kitchen`.

```{quiz}
:id: predict-plan
:title: Predict the result
question: "What happens when you run `python plan.py` from your work directory?"
options:
  - { text: "The terminal shows `This week: Bread`", explanation: "For this script, the first place is your work directory, and `recipe.py` is not there. Python does not look inside the directory `kitchen`, because `kitchen` is not in `sys.path`." }
  - { text: "Python stops with an error message, because it does not find a file `recipe.py`", correct: true }
  - { text: "Python asks you where the file `recipe.py` is", explanation: "Python never asks. It searches the directories of `sys.path`, and it stops with an error message when none of them holds the file." }
explanation: "The script `plan.py` is in your work directory, so that is the first place. It holds no file `recipe.py`. The other directories of `sys.path` hold no such file either. Python stops with an error message."
```

Type the command in the terminal, and press `Enter`:

```
python plan.py
```

````{hint}
:title: Run the command for me

```{execute}
:id: run-plan
:wait: prompt
python plan.py
```
````

The terminal shows an error message. The path in the second line is
different on each computer, so it is written with `...` here:

```
Traceback (most recent call last):
  File ".../work/plan.py", line 1, in <module>
    import recipe
ModuleNotFoundError: No module named 'recipe'
```

Read an error message from its last line. The type of the error is
`ModuleNotFoundError`. It means that Python searched every directory
of `sys.path`, and found a file for the module `recipe` in none of
them.

The message does not mean that the file does not exist on your
computer. The file `kitchen/recipe.py` exists. It means that the file
is not in one of the places where Python looks.

When you see this error, ask two questions. Is the name in the
`import` line written correctly? And is the file in one of the
directories of `sys.path`, which for your own modules means beside
the script?

You do not need to repair `plan.py`. The next workshop, **Making a
package**, shows how a program imports modules that are kept in a
directory of their own.

## When there is no script

One more thing completes the rule. Sometimes you start `python` with
no script, and type code at the `>>>` prompt. Then no script has a
directory, and the first place is the current directory of the
terminal.
