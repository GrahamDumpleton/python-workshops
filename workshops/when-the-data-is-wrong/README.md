# When the data is wrong

The nineteenth workshop of the course, and the second of the set
**Working with real data in Python**. It explains what an exception
is, on a file of spending that has three rows which cannot be read.
Then it teaches `try` and `except`, why the `except` line names the
type of exception (`ValueError`, `IndexError`, `FileNotFoundError`),
why an `except` line with no type hides bugs, the difference between
data that is wrong and code that is wrong, and `raise` with a message.
The learner writes three functions, and the last one reads the file,
skips the rows that cannot be read and counts them.

Twenty-five minutes, in a notebook, with the data file shown under
it. Python and its standard library only, nothing to install. It runs
in JupyterLite as well as JupyterLab.
