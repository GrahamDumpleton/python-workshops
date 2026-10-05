---
title: A log analyser
when: track == "log-analyser"
requires: [verify:analyse-hours, verify:analyse-report]
---

# A log analyser

A **web server** is a program that sends web pages to the people who
ask for them. Each time that it receives a **request**, which is a
question for one page, it writes one line in a file. That file is the
**log** of the server. A log can have millions of lines, so nobody
reads it line by line. A program reads it and reports what matters:
when the server is busy, which pages people want, and what went
wrong.

Your work directory holds `access.log`, the log of a made-up web
server of recipes, for two days. These are its first three lines:

```
2026-03-14 07:33:52 192.0.2.23 GET /recipes/flat-bread.html 200
2026-03-14 07:41:07 198.51.100.42 GET /recipes/flat-bread.html 200
2026-03-14 07:45:23 203.0.113.80 GET /recipes/rice-pudding.html 200
```

Each line has six fields, separated by spaces:

| Field | Example | What it is |
|-------|---------|------------|
| 1 | `2026-03-14` | the date of the request |
| 2 | `07:33:52` | the time: hour, minutes and seconds |
| 3 | `192.0.2.23` | the address of the computer that asked |
| 4 | `GET` | the method: `GET` asks for a page, `POST` sends a form |
| 5 | `/recipes/flat-bread.html` | the page that was asked for |
| 6 | `200` | the **status**, a number that says how the server answered |

The status `200` means that the server sent the page. A status of
`400` or more is an **error**: `404` means that there is no page with
that name, `403` means that the page is not allowed, and `500` means
that something went wrong inside the server.

Double-click `access.log` in the file browser to see the whole file.

## What the program does

The program is a script named `analyse.py`, in your work directory.
You run it with one **command line argument**, which is a word after
the name of the program in a command. The word is the name of the log
to read:

```
python analyse.py access.log
```

It shows exactly these lines for `access.log`:

```
Requests: 172
Busiest hours:
20:00 26
13:00 21
19:00 19
Most requested pages:
/index.html 46
/recipes/lentil-soup.html 33
/recipes/flat-bread.html 27
Errors: 16
403 2
404 11
500 3
```

- `Requests:` is followed by the number of lines in the log.

- `Busiest hours:` is followed by the three hours with the most
  requests, the busiest first. The hour is the first two characters
  of the time, followed by `:00`. The number after it is the number
  of requests in that hour, on both days together.

- `Most requested pages:` is followed by the three pages that were
  asked for the most, the most requested first, each with its number
  of requests.

- `Errors:` is followed by the number of requests whose status is
  `400` or more. Under it is one line for each status of those
  errors, with its number of requests, in the order of the status,
  the smallest first.

## Tools that you may need

| Code | What it gives |
|------|---------------|
| `line.split()` | a list of the fields of the line: `.split()` with nothing between its parentheses splits the text at every run of spaces, and it also removes the newline at the end |
| `fields[1][:2]` | the first two characters of the second field: `07` for `07:33:52` |
| `int("404")` | the integer `404`, which you can compare with `400` |
| `Counter(items)` | a `Counter` from the module `collections`: it counts how many times each value is in the list `items` |
| `counts.most_common(3)` | a list of the three values that are counted the most, each in a tuple with its count, the largest count first |
| `sorted(counts)` | the values that a `Counter` counted, in order, the smallest first |
| `counts[404]` | how many times the `Counter` counted the value `404` |

You import `Counter` with `from collections import Counter`. The
library reference describes
[`Counter`](https://docs.python.org/3/library/collections.html#collections.Counter).

## Part 1: the requests and the busiest hours

In this part the program shows the first five lines of the report:
the number of requests, and the three busiest hours.

First make the file. Click the action below, so that the file browser
shows your work directory.

```{file-browser-reveal}
:id: analyse-show-files
:title: Show your work directory in the file browser
:path: access.log
```

In the file browser, click the empty space under the names of the
files with the right button of the mouse. On a Mac with one button,
hold `Ctrl` and click. Click `New File`, type the name `analyse.py`,
and press `Enter`. Then double-click `analyse.py` to open it in the
editor.

Write the program in the editor. Save the file, and run it in the
terminal:

```
python analyse.py access.log
```

Compare what it shows with the first five lines of the example above.
When they are the same, click `Check`. The check runs your program on
a short log of its own, `_check_hours.log`, so the numbers must come
from the file that is named in the command.

````{hint}
:title: "Hint: what to look at"
The workshop **Taking arguments** showed that the list `sys.argv`
holds the words of the command. `sys.argv[1]` is the first word after
the name of the program, here `access.log`. You can also use the
module `argparse`, as that workshop did.

Open the file with `with open(sys.argv[1]) as file:`, and loop over
its lines with `for line in file:`. For each line, make a list of its
fields with `line.split()`, and add the hour to a list of hours. After
the loop, `len()` of that list is the number of requests, and
`Counter()` of it counts each hour.
````

```{hint}
:title: "Hint: the shape of the code"
1. At the top of the file, import `sys`, and import `Counter` from
   `collections`.

2. Write a function `main()`. In it, make an empty list `hours`.

3. Open the file named by `sys.argv[1]` with `with`, and loop over its
   lines. In the loop, give the name `fields` to `line.split()`, and
   append `fields[1][:2]` to `hours`.

4. After the loop, show `f"Requests: {len(hours)}"`, and then
   `Busiest hours:`.

5. Loop over `Counter(hours).most_common(3)` with
   `for hour, count in ...:`, and show `f"{hour}:00 {count}"`.

6. At the end of the file, at the left side, write the two lines that
   call `main()` when the file runs as a script:
   `if __name__ == "__main__":` and, under it with four spaces,
   `main()`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have clicked `Check` one time.

```{attempt}
:id: hours-no-file
:check: analyse-hours
:expect: There is no file analyse.py in your work directory
```

````{attempt}
:id: hours-empty
:check: analyse-hours
:expect: Your program showed nothing

```{file-write}
:path: analyse.py
```
````

````{attempt}
:id: hours-error
:check: analyse-hours
:expect: Its last line is: IndexError

```{file-write}
:path: analyse.py
import sys

with open(sys.argv[1]) as file:
    for line in file:
        fields = line.split(",")
        print(fields[1])
```
````

````{attempt}
:id: hours-fixed-file
:check: analyse-hours
:expect: Your program read the file access.log

```{file-write}
:path: analyse.py
with open("access.log") as file:
    lines = file.readlines()
print(f"Requests: {len(lines)}")
```
````

````{attempt}
:id: hours-count
:check: analyse-hours
:expect: The first line must be Requests: 11

```{file-write}
:path: analyse.py
import sys

with open(sys.argv[1]) as file:
    lines = file.readlines()
print(f"Requests: {len(lines) - 1}")
```
````

````{attempt}
:id: hours-missing-lines
:check: analyse-hours
:expect: The first missing line is: Busiest hours:

```{file-write}
:path: analyse.py
import sys

with open(sys.argv[1]) as file:
    lines = file.readlines()
print(f"Requests: {len(lines)}")
```
````

````{attempt}
:id: hours-by-hour
:check: analyse-hours
:expect: the hour with the most requests first

```{file-write}
:path: analyse.py
import sys
from collections import Counter

hours = []
with open(sys.argv[1]) as file:
    for line in file:
        hours.append(line.split()[1][:2])
print(f"Requests: {len(hours)}")
print("Busiest hours:")
counts = Counter(hours)
for hour in sorted(counts)[:3]:
    print(f"{hour}:00 {counts[hour]}")
```
````

````{attempt}
:id: hours-format
:check: analyse-hours
:expect: Line 3 that your program showed is: 09 5

```{file-write}
:path: analyse.py
import sys
from collections import Counter

hours = []
with open(sys.argv[1]) as file:
    for line in file:
        hours.append(line.split()[1][:2])
print(f"Requests: {len(hours)}")
print("Busiest hours:")
for hour, count in Counter(hours).most_common(3):
    print(f"{hour} {count}")
```
````

````{hint}
:title: Show me a solution
:unlock: "analyse-hours" in failed_checks or "analyse-hours" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes a working program into `analyse.py` and
opens it. Read it, and compare it with your own. The second action
runs it in the terminal.

```{file-write}
:id: hours-solution
:title: Write a solution into analyse.py
:path: analyse.py
:open: true
import sys
from collections import Counter


def main():
    hours = []
    with open(sys.argv[1]) as file:
        for line in file:
            fields = line.split()
            hours.append(fields[1][:2])

    print(f"Requests: {len(hours)}")
    print("Busiest hours:")
    for hour, count in Counter(hours).most_common(3):
        print(f"{hour}:00 {count}")


if __name__ == "__main__":
    main()
```

```{execute}
:id: hours-run
:title: Run the program on access.log
:wait: prompt
python analyse.py access.log
```
````

```{verify}
:id: analyse-hours
:label: analyse.py shows the number of requests and the busiest hours
:trigger: terminal-output "Busiest hours:"; file-saved analyse.py; after:hours-run
import os, subprocess, sys
from pathlib import Path

assert Path("analyse.py").exists(), "There is no file analyse.py in your work directory. Make it in the file browser, in the same list as access.log, and save it."
log = Path("_check_hours.log")
rows = [
    ("06:40:00", "192.0.2.4", "POST", "/contact.html", "500"),
    ("06:55:10", "198.51.100.7", "GET", "/admin", "403"),
    ("09:05:10", "192.0.2.4", "GET", "/index.html", "200"),
    ("09:12:44", "203.0.113.9", "GET", "/menu.html", "200"),
    ("09:30:01", "198.51.100.7", "GET", "/index.html", "200"),
    ("09:41:20", "192.0.2.17", "GET", "/menu.html", "200"),
    ("09:58:13", "203.0.113.9", "GET", "/old.html", "404"),
    ("14:01:00", "192.0.2.17", "GET", "/index.html", "200"),
    ("14:20:30", "192.0.2.4", "GET", "/old.html", "404"),
    ("14:45:12", "198.51.100.7", "GET", "/menu.html", "200"),
    ("21:10:09", "203.0.113.9", "GET", "/index.html", "200"),
]
wanted = ["Requests: 11", "Busiest hours:", "09:00 5", "14:00 3", "06:00 2"]
about = "The check ran python analyse.py _check_hours.log on a log of its own, with 11 requests: 2 in the hour 06, 5 in the hour 09, 3 in the hour 14 and 1 in the hour 21."
try:
    log.write_text("".join(f"2026-04-01 {time} {address} {method} {page} {status}\n" for time, address, method, page, status in rows))
    try:
        run = subprocess.run(
            [sys.executable, "analyse.py", str(log)],
            capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError(f"{about} Your program did not end after 10 seconds. Look for a loop that never ends.") from None
finally:
    log.unlink(missing_ok=True)
if run.returncode != 0:
    errors = run.stderr.strip().splitlines()
    last = errors[-1] if errors else "(Python showed no message)"
    raise AssertionError(f"{about} Python stopped with an error. Run python analyse.py access.log in the terminal, and read the whole error there. Its last line is: {last}")
shown = run.stdout.strip().splitlines()
assert shown, f"{about} Your program showed nothing. Did you save the file? Use print() to show each line of the report."
if shown[0] == "Requests: 172":
    raise AssertionError(f"{about} Your program read the file access.log, and not the file that is named in the command. Open the file with the name sys.argv[1], so that the program reads the log that the command names.")
if shown[0] != wanted[0]:
    raise AssertionError(f"{about} The first line must be Requests: 11, one request for each line of the log. Your program showed: {shown[0]}")
if len(shown) >= 5 and shown[2:5] == ["06:00 2", "09:00 5", "14:00 3"]:
    raise AssertionError(f"{about} Your program shows the first three hours in the order of the hour. It must show the three busiest hours, the hour with the most requests first: 09:00 5, then 14:00 3, then 06:00 2. Counter(...).most_common(3) gives them in that order.")
for number, (found, expected) in enumerate(zip(shown, wanted), start=1):
    if found != expected:
        raise AssertionError(f"{about} Line {number} that your program showed is: {found}  It must be: {expected}  Change the program, save it, and click Check again.")
if len(shown) < len(wanted):
    raise AssertionError(f"{about} The first part of the report has {len(wanted)} lines, and your program showed {len(shown)}. The first missing line is: {wanted[len(shown)]}")
print(f"Correct. {about} Your program showed: {', '.join(shown[:5])}.")
```

The first part of the report is complete. In the second part, the
program reports the pages and the errors.

## Part 2: the pages and the errors

Add the rest of the report to your program: the line
`Most requested pages:` and the three pages under it, then the line
`Errors:` with the number of errors, and one line for each status of
an error. The example at the top of this page shows every line.

Save the file, run `python analyse.py access.log` again, and compare
all 13 lines with the example. Then click `Check`. The check runs your
program on a log of its own, `_check_report.log`, which has 4 errors.

````{hint}
:title: "Hint: what to look at"
The fifth field, `fields[4]`, is the page, and the sixth, `fields[5]`,
is the status. Collect the pages in a list, in the same loop as the
hours, and count them with `Counter` in the same way.

The status is text. `int(fields[5])` turns it into an integer, so that
you can test it with `>= 400`. Append only the statuses of errors to a
list `errors`. `len(errors)` is the number of errors.

For the lines under `Errors:`, make `error_counts = Counter(errors)`.
A `for` loop over `sorted(error_counts)` gives each status once, the
smallest first, and `error_counts[status]` is its count.
````

```{hint}
:title: "Hint: the shape of the code"
1. Before the loop, make two more empty lists: `pages` and `errors`.

2. Inside the loop, append `fields[4]` to `pages`. Give the name
   `status` to `int(fields[5])`, and if `status >= 400`, append it to
   `errors`.

3. After the lines of the hours, show `Most requested pages:`, and
   loop over `Counter(pages).most_common(3)` to show each page and its
   count.

4. Show `f"Errors: {len(errors)}"`.

5. Make `error_counts = Counter(errors)`. Loop over
   `sorted(error_counts)`, and show `f"{status} {error_counts[status]}"`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have clicked `Check` one time.

```{attempt}
:id: report-not-started
:check: analyse-report
:expect: The first missing line is: Most requested pages:
```

````{attempt}
:id: report-pages
:check: analyse-report
:expect: Line 7 that your program showed is: 192.0.2.4 3

```{file-write}
:path: analyse.py
import sys
from collections import Counter

hours = []
pages = []
errors = []
with open(sys.argv[1]) as file:
    for line in file:
        fields = line.split()
        hours.append(fields[1][:2])
        pages.append(fields[2])
        if int(fields[5]) >= 400:
            errors.append(int(fields[5]))
print(f"Requests: {len(hours)}")
print("Busiest hours:")
for hour, count in Counter(hours).most_common(3):
    print(f"{hour}:00 {count}")
print("Most requested pages:")
for page, count in Counter(pages).most_common(3):
    print(f"{page} {count}")
print(f"Errors: {len(errors)}")
counts = Counter(errors)
for status in sorted(counts):
    print(f"{status} {counts[status]}")
```
````

````{attempt}
:id: report-only-404
:check: analyse-report
:expect: count every request whose status is 400 or more

```{file-write}
:path: analyse.py
import sys
from collections import Counter

hours = []
pages = []
errors = []
with open(sys.argv[1]) as file:
    for line in file:
        fields = line.split()
        hours.append(fields[1][:2])
        pages.append(fields[4])
        if fields[5] == "404":
            errors.append(int(fields[5]))
print(f"Requests: {len(hours)}")
print("Busiest hours:")
for hour, count in Counter(hours).most_common(3):
    print(f"{hour}:00 {count}")
print("Most requested pages:")
for page, count in Counter(pages).most_common(3):
    print(f"{page} {count}")
print(f"Errors: {len(errors)}")
counts = Counter(errors)
for status in sorted(counts):
    print(f"{status} {counts[status]}")
```
````

````{attempt}
:id: report-error-order
:check: analyse-report
:expect: in the order of the status, the smallest first

```{file-write}
:path: analyse.py
import sys
from collections import Counter

hours = []
pages = []
errors = []
with open(sys.argv[1]) as file:
    for line in file:
        fields = line.split()
        hours.append(fields[1][:2])
        pages.append(fields[4])
        if int(fields[5]) >= 400:
            errors.append(int(fields[5]))
print(f"Requests: {len(hours)}")
print("Busiest hours:")
for hour, count in Counter(hours).most_common(3):
    print(f"{hour}:00 {count}")
print("Most requested pages:")
for page, count in Counter(pages).most_common(3):
    print(f"{page} {count}")
print(f"Errors: {len(errors)}")
for status, count in Counter(errors).most_common():
    print(f"{status} {count}")
```
````

````{hint}
:title: Show me a solution
:unlock: "analyse-report" in failed_checks or "analyse-report" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes a working program into `analyse.py` and
opens it. Compare it with your own. The second action runs it in the
terminal.

```{file-write}
:id: report-solution
:title: Write a solution into analyse.py
:path: analyse.py
:open: true
import sys
from collections import Counter


def main():
    hours = []
    pages = []
    errors = []
    with open(sys.argv[1]) as file:
        for line in file:
            fields = line.split()
            hours.append(fields[1][:2])
            pages.append(fields[4])
            status = int(fields[5])
            if status >= 400:
                errors.append(status)

    print(f"Requests: {len(hours)}")
    print("Busiest hours:")
    for hour, count in Counter(hours).most_common(3):
        print(f"{hour}:00 {count}")

    print("Most requested pages:")
    for page, count in Counter(pages).most_common(3):
        print(f"{page} {count}")

    print(f"Errors: {len(errors)}")
    error_counts = Counter(errors)
    for status in sorted(error_counts):
        print(f"{status} {error_counts[status]}")


if __name__ == "__main__":
    main()
```

```{execute}
:id: report-run
:title: Run the program on access.log
:wait: prompt
python analyse.py access.log
```
````

```{verify}
:id: analyse-report
:label: analyse.py shows the whole report
:trigger: terminal-output "Errors:"; after:report-run
import os, subprocess, sys
from pathlib import Path

assert Path("analyse.py").exists(), "There is no file analyse.py in your work directory. Make it in the file browser, in the same list as access.log, and save it."
log = Path("_check_report.log")
rows = [
    ("06:40:00", "192.0.2.4", "POST", "/contact.html", "500"),
    ("06:55:10", "198.51.100.7", "GET", "/admin", "403"),
    ("09:05:10", "192.0.2.4", "GET", "/index.html", "200"),
    ("09:12:44", "203.0.113.9", "GET", "/menu.html", "200"),
    ("09:30:01", "198.51.100.7", "GET", "/index.html", "200"),
    ("09:41:20", "192.0.2.4", "GET", "/menu.html", "200"),
    ("09:58:13", "203.0.113.9", "GET", "/old.html", "404"),
    ("14:01:00", "192.0.2.17", "GET", "/index.html", "200"),
    ("14:20:30", "192.0.2.17", "GET", "/old.html", "404"),
    ("14:45:12", "198.51.100.7", "GET", "/menu.html", "200"),
    ("21:10:09", "203.0.113.9", "GET", "/index.html", "200"),
]
wanted = ["Requests: 11", "Busiest hours:", "09:00 5", "14:00 3", "06:00 2", "Most requested pages:", "/index.html 4", "/menu.html 3", "/old.html 2", "Errors: 4", "403 1", "404 2", "500 1"]
about = "The check ran python analyse.py _check_report.log on a log of its own, with 11 requests. The pages are /index.html 4 times, /menu.html 3 times, /old.html 2 times, /contact.html and /admin 1 time each. The errors are 500, 403, 404 and 404, in that order in the log."
try:
    log.write_text("".join(f"2026-04-01 {time} {address} {method} {page} {status}\n" for time, address, method, page, status in rows))
    try:
        run = subprocess.run(
            [sys.executable, "analyse.py", str(log)],
            capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError(f"{about} Your program did not end after 10 seconds. Look for a loop that never ends.") from None
finally:
    log.unlink(missing_ok=True)
if run.returncode != 0:
    errors = run.stderr.strip().splitlines()
    last = errors[-1] if errors else "(Python showed no message)"
    raise AssertionError(f"{about} Python stopped with an error. Run python analyse.py access.log in the terminal, and read the whole error there. Its last line is: {last}")
shown = run.stdout.strip().splitlines()
assert shown, f"{about} Your program showed nothing. Did you save the file? Use print() to show each line of the report."
if shown[0] == "Requests: 172":
    raise AssertionError(f"{about} Your program read the file access.log, and not the file that is named in the command. Open the file with the name sys.argv[1], so that the program reads the log that the command names.")
if len(shown) > 9 and shown[9].startswith("Errors:") and shown[9] != wanted[9]:
    raise AssertionError(f"{about} Your program showed {shown[9]}, and it must show Errors: 4. An error is a request whose status is 400 or more, so count every request whose status is 400 or more: 403, 404 and 500. Turn the status into an integer with int() before you compare it with 400.")
if len(shown) == len(wanted) and shown[:10] == wanted[:10] and sorted(shown[10:]) == sorted(wanted[10:]) and shown[10:] != wanted[10:]:
    raise AssertionError(f"{about} Your program shows the right lines under Errors: but not in the order of the status, the smallest first. It must show 403 1, then 404 2, then 500 1. A for loop over sorted(error_counts) gives the statuses in that order.")
for number, (found, expected) in enumerate(zip(shown, wanted), start=1):
    if found != expected:
        raise AssertionError(f"{about} Line {number} that your program showed is: {found}  It must be: {expected}  Change the program, save it, and click Check again.")
if len(shown) < len(wanted):
    raise AssertionError(f"{about} The report has {len(wanted)} lines, and your program showed {len(shown)}. The first missing line is: {wanted[len(shown)]}")
if len(shown) > len(wanted):
    raise AssertionError(f"{about} Your program showed more than the {len(wanted)} lines of the report. The first line too many is: {shown[len(wanted)]}")
print(f"Correct. {about} Your program showed all {len(wanted)} lines of the report.")
```

## What you have now

Your program turns a log of any length into a report of 13 lines.
With `access.log`, it shows that the server is busiest in the evening
at 20:00, that the start page `/index.html` is asked for the most, and
that most errors are `404`: people ask for pages that do not exist.

If you want to do more, add a line `Busiest day:` with the date that
has the most requests, or add an option `--top` that says how many
hours and pages to show, in place of three. The workshop **Taking
arguments** showed how to add an option with `argparse`.
