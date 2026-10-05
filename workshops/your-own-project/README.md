# Your own project

The forty-third workshop of the course, the last of the set **Working
like a Python developer**, and the end of the course. The learner
chooses one of four briefs with a `choice`, and builds that program
alone, in two parts, from a description that says exactly what the
program is called, how it is run, what it reads and what it shows. The
only actions are the checks, the hints, one action that shows the work
directory in the file browser, and a locked "Show me a solution" hint
for each part.

- **A file organiser**, `organise.py`: sorts the shipped directory
  `downloads/` into directories by the ending of each file name, and
  shows the plan without moving anything unless it is given the option
  `--move`. Its checks run it on directories of their own, with names
  that begin with `_check_`, never on the learner's files.

- **A log analyser**, `analyse.py`: reads the shipped web server log
  `access.log` (made-up addresses from the ranges kept for
  documentation, and ISO dates) and reports the number of requests,
  the busiest hours, the most requested pages and the errors.

- **A password checker**, `checker.py`: gives a password a score
  against five rules and says which rules it breaks, with a command
  line interface, and a file of tests, `test_checker.py`, written with
  `assert` and run with `python`. The check runs the learner's tests
  against broken copies of the checker, to see that the tests find the
  mistakes.

- **A flashcard drill**, `drill.py`: asks the questions of the shipped
  file `cards.csv` with `input()`, which the page explains, and asks
  the wrong ones again until every answer is right. Its checks give
  the answers in advance.

The last page says where to go next, including how to set Python up
on the learner's own computer.

Twenty-five minutes, in an editor and a terminal. Python and its
standard library only, nothing to install. It runs in JupyterLab only,
since it needs a terminal that can run `python`. The self-test runs
the first track only; `tools/test-tracks.sh workshops/your-own-project`
runs each of the four.
