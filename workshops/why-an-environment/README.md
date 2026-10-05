# Why an environment

The thirty-seventh workshop of the course, and the first of the set
**Working like a Python developer**. It shows the problem that a
virtual environment solves, before the solution. A click makes one
virtual environment, `shared-python`, which stands for the one Python
of a computer. The learner looks at its `sys.path` and its
`site-packages`, then runs two small projects that use the package
`webcolors`: `poster`, which needs version `1.13`, and `labels`, which
needs version `24.11.1`. Installing the newer version for `labels`
breaks `poster`, which was not changed, and installing the old
version again breaks `labels`. The workshop ends on the idea that each
project needs a `site-packages` of its own. Every install names the
Python by its path, and nothing is activated.

Twenty-five minutes, in a terminal, with predictions before each run.
It installs a package from PyPI into a virtual environment inside the
workspace, so it needs the network. It needs a terminal that can run
`python`, so it runs in JupyterLab only.
