---
title: Questions
requires: [quiz:run-keys, quiz:failed-check, quiz:type-the-output]
---

# Questions

Some pages ask you a question. A question helps you see whether
you have understood an idea, before you continue.

Some questions ask what you have learned. Other questions ask you to
predict what a piece of code will do, before you run it. Predicting
first, and then seeing the real result, is one of the best ways to
learn.

## How to answer

Most questions have a list of answers. Click the answer that you think
is correct. Then click the `Submit` button.

If your answer is correct, the question explains why. If your answer
is not correct, the question explains what was wrong with it, and you
can choose again. A wrong answer is not a problem. The explanation is
there to help you.

Here are two questions about this workshop. Try them now.

```{quiz}
:id: run-keys
:title: Running a cell
question: You have clicked inside a cell. Which keys run the cell?
options:
  - { text: "`Shift` and `Enter`, pressed together", correct: true }
  - { text: "`Backspace`", explanation: "`Backspace` deletes the character before the cursor. It does not run the cell." }
  - { text: "The space bar", explanation: "The space bar types a space in the code. It does not run the cell." }
explanation: "Hold `Shift` and press `Enter` to run the cell. The run button `▶` at the top of the notebook does the same thing."
```

```{quiz}
:id: failed-check
:title: A failed check
question: A check shows the mark `✗` and a message. What is the best thing to do next?
options:
  - { text: "Start the whole workshop again", explanation: "You do not need to start again. Only one step is not done yet, and the message says which one." }
  - { text: "Close the window and stop", explanation: "A failed check does not mean that anything is broken. The message tells you how to continue." }
  - { text: "Read the message, then do what it says", correct: true }
explanation: "A failed check is information. Its message says what is missing. When you have fixed that, the check passes."
```

## Questions where you type the answer

Some questions have no list of answers. They have an empty box, and
you type your answer in the box. Then click the `Submit` button, or
press the `Enter` key.

These questions usually ask what Python will show. Your answer must be
exactly what Python shows, character for character. For example, if
Python shows `5`, then the answers `five` and `5.0` are not accepted.
The reason is that small differences such as these often matter in
Python, as later workshops explain.

Try one now.

```{quiz}
:id: type-the-output
:type: text
:title: Type the answer
question: "A cell holds the code `2 + 3`. What output does the notebook show under the cell when the cell runs?"
answer: "5"
wrong:
  - { pattern: "2 ?\\+ ?3", explanation: "`2 + 3` is the code in the cell. The output is the result that Python calculates from the code." }
  - { pattern: "[Ff]ive", explanation: "The number is correct, but Python shows it in digits, not as a word. Type the digits." }
otherwise: "Type only the number that Python calculates when it adds 2 and 3."
explanation: "Python adds the two numbers, and the notebook shows the result `5` under the cell."
```

## Before you leave a page

The checks and questions on a page are the things to finish before you
click `Next`. If some are not finished, the bottom of the panel lists
them. You can still click `Next`, but it is better to finish them
first, because each page prepares you for the next one.
