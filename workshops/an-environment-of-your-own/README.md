# An environment of your own

The thirty-eighth workshop of the course, in the set **Working like a
Python developer**. It gives one project a virtual environment of its
own. The learner makes the environment with `python -m venv .venv`,
and looks inside it with `ls` and `cat`: the interpreter in `bin`,
the directory `site-packages`, and the file `pyvenv.cfg`. Then the
workshop shows what activating does, by comparing `which python` and
`echo $PATH` before and after `source .venv/bin/activate`: one
directory is put first on `PATH`, and the prompt changes. One small
package, `tabulate`, is installed to show where a package goes. The
learner leaves the environment with `deactivate`, sees the program
fail without it, and runs it with `.venv/bin/python` and no
activation. Last, the learner deletes the environment and makes it
again, since it holds nothing that cannot be made again.

Twenty-five minutes, in a terminal, with typed commands throughout.
It installs one package from PyPI into a virtual environment inside
the workspace, so it needs the network. It needs a terminal that can
run `python`, so it runs in JupyterLab only.
