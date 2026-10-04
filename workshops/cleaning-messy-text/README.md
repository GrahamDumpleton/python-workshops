# Cleaning messy text

The twenty-second workshop of the course, and the fifth of the set
**Working with real data in Python**. It explains why real data is
untidy, then cleans an untidy file of spending one step at a time:
`strip()` on every field, `lower()` and a dictionary of other
spellings for the categories, `float()` for the amounts and why money
is not added as floats, and `Decimal` from the module `decimal`. The
learner writes six small pieces of code, builds the function
`clean_row` from them, skips the three rows that cannot be read, and
writes the clean rows to a new file whose text is the same as the
text of the shipped clean file.

Twenty-five minutes, in a notebook, with the data file shown under
it. Python and its standard library only, nothing to install. It runs
in JupyterLite as well as JupyterLab.
