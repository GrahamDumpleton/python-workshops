---
title: Welcome
requires: [quiz:recap-shared, quiz:recap-search, quiz:recap-ls]
---

# An environment of your own

The workshop before this one showed a problem. When every project on
a computer uses the same Python, an install for one project can break
another project. In this workshop you learn the solution: you give
each project a Python environment of its own.

You will learn:

- what a virtual environment is, and how to make one

- what is inside a virtual environment

- how the shell decides which program the word `python` means

- what it means to activate an environment, and what it changes

- where a package goes when you install it into an environment

- how to use an environment that is not active

- why you can delete an environment and make it again

This workshop uses one small program, which shows a table of prices.
You do not change the program. You make the place in which it runs.

In this workshop you type most commands yourself. Each step says
exactly what to type. A command that is new is run by a click the
first time. Each step has help that you can open if you need it.

The workshop installs one package from the internet, so the computer
needs a connection to the internet.

The workshop takes about twenty-five minutes.

## What you see

The window has two parts beside this panel:

- At the bottom is the **terminal**, a window in which you type
  commands for the computer. A **command** is one line that you type
  in the terminal. The computer runs it when you press `Enter`.

- Above the terminal is the place for the **editor**, the part of
  JupyterLab in which you look at a file and change it. It is empty
  until you open a file, so at first the terminal fills the whole
  space.

Two more words are used on every page. The **shell** is the program
inside the terminal that reads each command and runs it. The
**prompt** is the short text that shows that the shell is ready for a
command. You type each command after the prompt.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Why an environment**. A
computer has one Python, and two projects use it. Project A needs
version 1 of a package. Project B needs version 2 of the same
package.

```{quiz}
:id: recap-shared
:title: One Python for two projects
question: "You install version 2 of the package for project B. What happens to project A?"
options:
  - { text: "Nothing changes for project A. Python keeps both versions and gives each project the version that it needs.", explanation: "One Python keeps one version of a package. It cannot keep two versions and choose between them." }
  - { text: "Project A can stop working, because version 2 replaces version 1.", correct: true }
  - { text: "Python refuses to install version 2, because project A needs version 1.", explanation: "Python does not know which project needs which version. The install replaces the version that is there." }
explanation: "Installed packages are kept in a directory with the name `site-packages`. One Python has one `site-packages`, and it holds one version of each package. So an install for project B replaces the version that project A needs. Each project needs a `site-packages` of its own. In this workshop you make one."
```

The second question is about the workshop **Where imports come
from**.

```{quiz}
:id: recap-search
:title: The order of the search
question: "Python searches a list of directories for the file of an import. Two directories of the list hold a file with the right name. Which file does Python use?"
options:
  - { text: "The file in the directory that comes first in the list", correct: true }
  - { text: "The file in the directory that comes last in the list", explanation: "Python does not continue to the end of the list. It stops at the first directory that holds a file with the right name." }
  - { text: "The file that was changed most recently", explanation: "Python does not compare the files. It searches the directories in order and stops at the first file with the right name." }
explanation: "The list has the name `sys.path`. Python searches its directories in order, from the first to the last, and uses the first file that has the right name. Remember this rule. In this workshop you see that the shell uses the same rule when it looks for a program."
```

The third question is about the workshop **Files, editors and
terminals**.

```{quiz}
:id: recap-ls
:title: The names in a directory
question: "Which command shows the names of the files that the current directory holds?"
options:
  - { text: "`pwd`", explanation: "The command `pwd` shows the path of the current directory. It does not show what the directory holds." }
  - { text: "`cat`", explanation: "The command `cat` shows the text inside one file. It does not show the names of the files." }
  - { text: "`ls`", correct: true }
explanation: "A **directory** is a place that holds files and other directories. The **current directory** is the directory that the terminal is in now. The command `ls` shows the names that the current directory holds. In this workshop the terminal starts in a directory with the name `work`, which the workshop made for you. These pages call it your work directory."
```

When you have answered the three questions, go to the next page.
