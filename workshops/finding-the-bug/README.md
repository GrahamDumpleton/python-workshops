# Finding the bug

The thirty-sixth workshop of the course, and the last of the set
**From a Python notebook to a program**. The workshop ships its own
copy of the package `spending`, with three bugs planted in
`spending/models.py`. The learner finds and repairs them one at a
time: the first with a traceback that crosses four files, the second
with a `print()` line that shows what a loop does, and the third with
`breakpoint()` and the commands `p`, `l`, `n`, `s`, `c` and `q` of
`pdb`. The learner removes each `print()` and `breakpoint()` line
afterwards, and the checks run the program to confirm it. Every step
is a change to code that is nearly right.

The directory `solutions/` holds the file `models.py` as it is after
each step. The solution of a step writes one of these files into the
workspace, so the directory is not copied into the workspace itself.

Twenty-five minutes, in an editor and a terminal. Python and its
standard library only, nothing to install. It runs in JupyterLab only,
since it needs a terminal that can run `python`.
