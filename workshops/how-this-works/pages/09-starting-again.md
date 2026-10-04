---
title: Starting again
requires: [quiz:what-is-forgotten]
---

# Starting again

Sometimes you stop in the middle of a workshop and come back later.
Sometimes a workshop gets into a confused state, and you want a fresh
start. This page explains what happens in both situations.

## Where your work is kept

````{when} frontend == "jupyterlite"
You are using these workshops directly in your web browser. Your
notebook is saved in the storage of this browser, on this computer. It
is still there when you close the page and open it again later.

Your work is not saved anywhere else. If you use a different browser
or a different computer, your work is not there. If you clear the
saved data of your browser for this site, your work is deleted.
````

````{when} frontend != "jupyterlite"
Your notebook is saved as a file, in a folder that belongs to this
workshop. It stays there when you close the window.

If you are using a temporary session, such as one on mybinder.org, the
whole session is deleted when it ends, and your files are deleted with
it. In that situation, finish a workshop in one visit.
````

## What Python remembers

Your notebook keeps the code in its cells, and the outputs. But Python
also keeps things in its memory while it runs. For example, on an
earlier page, Python remembered that the name `number` had a value.

That memory is not saved. When JupyterLab closes, or when the page in
your browser is loaded again, Python starts again with an empty
memory. The code is still in your notebook, but Python has forgotten
the values.

For this reason, when you open a workshop that you left in the middle,
it asks you to choose:

- **Restart** begins the workshop again from the first page, with a
  new notebook. This choice always works, and it is the best one in
  most situations. These workshops are short, so you do not lose much.

- **Continue** returns you to the page where you stopped. Python has
  forgotten the values from the earlier pages, so some later steps
  might fail until you run the earlier cells in your notebook again.

## The Restart button

You can also restart a workshop at any time. At the top of this panel
there is a row of small buttons. One of them is the restart button.
When you click it, the workshop asks you to confirm. Then it deletes
the work you did in this workshop, and opens the first page again.

Use the restart button when a workshop is in a confused state, and the
hints and messages do not help. You do not need to click it now.

```{quiz}
:id: what-is-forgotten
:title: After a break
question: You close JupyterLab in the middle of a workshop, and open it again the next day. What has Python forgotten?
options:
  - { text: "The code in the cells of your notebook", explanation: "The code is saved in the notebook. It is still there." }
  - { text: "The values that the cells created when they ran", correct: true }
  - { text: "Which workshop you were doing", explanation: "The workshop remembers your progress. It asks whether you want to restart or continue." }
explanation: "The notebook keeps your code. Python does not keep the values in its memory. This is why Restart is usually the best choice after a break."
```
