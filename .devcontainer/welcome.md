# Welcome to the Python workshops

These are guided, hands-on workshops that teach the Python programming
language. They are written for people who have never written a program
before. You do not need to know anything about programming to start.

Each workshop is a set of short pages. The pages appear in a panel
beside your work. Each page explains one idea, and then asks you to do
something with it. Some steps are done by clicking a box on the page.
Other steps ask you to type code yourself. The workshop checks your
work as you go, and tells you what to look at if something is not
right.

## Opening JupyterLab

The workshops run in JupyterLab. This window is VS Code, a program for
editing code, and you do not need to use it. JupyterLab starts in the
background, which takes a minute or two the first time.

When JupyterLab is ready, VS Code shows a message in the bottom right
corner. The message says that an application on port 8888 is
available. Click the "Open in Browser" button in that message.
JupyterLab then opens in a new browser tab.

If the message has gone, open the "Ports" panel at the bottom of VS
Code. Find the port with the label "JupyterLab", and click the globe
icon beside its address.

Leave the visibility of the JupyterLab port set to "Private". JupyterLab
here does not ask for a password, because a private port can only be
reached by you, while you are signed in to GitHub. If you made the port
public, anyone who knew its address could run code in your codespace.

## Starting the workshops

JupyterLab opens in the workshop browser, which lists the workshops in
the order to take them. Start with the first one, **How these workshops
work**. It explains how to use the pages, the notebook and the checks.
At the end of each workshop, the Finish dialog offers you the next one.

When you open a workshop, JupyterLab shows what the workshop will do in
this codespace, and asks how far you trust it. Choose "Trust" to let the
workshop's steps run as it intends. "Restricted" asks you before each
step that changes a file or runs code. You are asked once for each
workshop, and again only if the workshop changes. The workshops are not
trusted for you automatically, because this codespace is yours and is
connected to your GitHub account. For the same reason, JupyterLab runs
without the GitHub token that the codespace holds for your account, so
nothing a workshop runs is given that token.

## Your progress

While you work through a workshop, your progress is sent to the
workshops' own analytics service. This records which pages you
visited, which steps you did and what the checks found, and when. It
is used to find the places where the workshops are not clear, so they
can be improved. Nothing that is sent says who you are or which
codespace you used. The code you type, the notebooks you make, the
output of your code and your answers to forms are never sent. Only
which step happened, and when.

## When you have finished

The codespace belongs to your GitHub account, and it uses your monthly
Codespaces allowance while it runs. It is not temporary: your work is
kept when you close the browser tabs, and the codespace stops by itself
after a time with no activity. You can start it again later from
[github.com/codespaces](https://github.com/codespaces), and JupyterLab
starts with it. When you have finished with the workshops, delete the
codespace on that page, so that it no longer uses your storage
allowance.
