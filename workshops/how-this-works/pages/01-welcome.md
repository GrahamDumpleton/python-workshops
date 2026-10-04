---
title: Welcome
requires: [verify:notebook-created]
---

# How these workshops work

Welcome. This is the first workshop of a course that teaches the
Python programming language. You do not need to know anything about
programming to begin.

This workshop does not teach Python yet. It teaches you how to use the
workshops. It takes about fifteen minutes, and it makes every later
workshop easier to follow.

## Pages

The text you are reading now is a **page**. A page is one step of a
workshop. Each page explains one idea, and then asks you to do
something.

A **workshop** is a set of pages that you read in order. At the bottom
of this panel there are two buttons. The `Next` button shows the next
page. The `Previous` button shows the page before. You can always go
back to read a page again.

## The parts of the window

The window has two main parts. This panel, with the pages, is the
**instructions panel**. The large area beside it is the **work area**.
The work area is empty now. You will do your work there.

## Actions

An **action** is a box on a page that you can click. When you click an
action, the workshop does something for you. The text at the top of
the box says what the action will do.

Here is your first action. It points at each part of the window, one
at a time, and says what the part is for. Click the box to begin.

```{tour}
:title: Show me the parts of the window
- selector: "#jupyterlab-workshop-panel"
  text: This is the instructions panel. It shows one page of the workshop at a time.
- selector: ".jp-WorkshopPanel-header"
  text: The top of the panel shows the name of the workshop, and how far through it you are.
- selector: ".jp-WorkshopPanel-footer"
  text: The Previous and Next buttons are here, at the bottom of the panel.
- selector: "#jp-main-dock-panel"
  text: This is the work area. Your work appears here.
```

## What an action shows

Look at the box that you clicked. It has changed in two ways:

- The word `done` is now at the right side of the box.

- The bar on the left edge of the box is now green.

These two signs mean that the action worked. While an action is still
working, the word is `running`, and the bar is orange. If something
goes wrong, the word is `failed`, the bar is red, and a message under
the box says what went wrong.

## Create your notebook

Now click a second action. It creates the document that you will work
in, and opens it in the work area. The box shows the text that the new
document begins with.

```{notebook-create}
:id: create-notebook
:title: Create my notebook and open it
:path: {{ notebook }}
:open: true
- markdown: |
    # How these workshops work

    This is your notebook for this workshop. The code that you run appears below.
```

You can click an action more than once. Each click does the same thing
again, and the box then shows `done ×2`. For this second action, another
click replaces your notebook with a new one, so click it only once.

## A check

The last box on this page is a **check**. A check tests that a step is
done. This check tests that your notebook exists. A later page
explains checks in more detail. For now, see that the check shows a
tick `✓` after you create the notebook.

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```

When the check shows a tick, click `Next` at the bottom of this panel.
