---
title: What you have learned
---

# What you have learned

You moved a program out of a notebook. The classes `Purchase` and
`Ledger` and the function `read_ledger` now live in the file
`spending.py`, and two notebooks use them with one `import` line
each.

## The ideas

- A **module** is a file of Python code. You can write one yourself.
  Its name ends with `.py`, and the name of the module is the name of
  the file without `.py`.

- Code in a notebook can be used only in that notebook. Code in a
  module can be used by every notebook and every program, and it
  exists in one place only.

- An **editor** is the part of JupyterLab in which you change a file.
  To **save** is to write what the editor shows to the file on the
  disk. Python reads the file on the disk, so it sees a change only
  after you save.

- You can **copy** code from a cell and **paste** it into the editor.

- A module cannot see the names of the notebook that imports it. It
  needs `import` lines of its own, at the top of the file, for
  everything that its code uses.

- Python reads the file of a module one time, at the first `import`
  that works. A later `import` of the same module gives back the
  module that Python kept.

- The **kernel** is the program that runs the cells of a notebook. It
  remembers the names and the modules. To **restart the kernel** is
  to stop it and start a new one, which remembers nothing.

- After you change the file of a module, restart the kernel of each
  notebook that uses it. Then run the cells that you need again.

## The code and the keys

| Code or keys | What it does |
|------|--------------|
| `import spending` | makes your module ready to use, under the name `spending` |
| `spending.Purchase(...)` | makes an object from the class `Purchase` of the module |
| `from spending import read_ledger` | gets the name `read_ledger` from the module |
| `read_ledger("spending.csv")` | calls the function, with no module name before it |
| `Ctrl` and `A` | selects all the text of the cell or the file |
| `Ctrl` and `C`, then `Ctrl` and `V` | copies the selected text, then pastes it at the cursor |
| `Ctrl` and `S` | saves the file |
| the menu `Kernel`, then `Restart Kernel...` | restarts the kernel of the notebook |

On a Mac, use the `Cmd` key in place of the `Ctrl` key.

## Two mistakes that you now know

| What you see | What it means | What to do |
|------|------|------|
| a `NameError` that names a line of your file | the module uses a name that it does not import | add the `import` line at the top of the file, and save |
| an `AttributeError` or an `ImportError` for something that is in your file | the kernel holds an old copy of the module | save the file, restart the kernel, and run the cell again |

## What comes next

Your file `spending.py` gives its code to notebooks. But a file of
Python code can also be a program of its own. The next workshop,
**Running a script**, runs the file in the terminal, with the command
`python spending.py`, and with no notebook at all.

Click `Finish` at the bottom of this panel.
