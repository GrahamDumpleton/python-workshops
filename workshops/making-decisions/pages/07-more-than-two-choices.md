---
title: More than two choices
requires: [verify:water-ran, quiz:predict-advice, verify:advice-ran]
---

# More than two choices

`if` and `else` choose between two branches. Some decisions have three
branches or more. Water is ice at 0 degrees Celsius or colder, steam
at 100 degrees or hotter, and liquid water between the two.

For this, Python has the word `elif`. It is a short form of "else
if", and it means "if no condition above was true, test this
condition". An `elif` line goes between the `if` and the `else`, and
it has a condition of its own.

A person who chooses clothes thinks in the same way: "If it is
raining, I take the coat. If not, and if it is cold, I take the
pullover. In every other case, I take the shirt." The questions are
asked in order, and the first answer that is yes decides.

## The code

```python
water_temperature = 120
if water_temperature <= 0:
    water_state = "ice"
elif water_temperature < 100:
    water_state = "liquid water"
else:
    water_state = "steam"
print(water_state)
```

Python tests the conditions in order, from the top.

1. `water_temperature <= 0` is `False`, because 120 is greater than 0.
   Python does not perform the first block. It continues with the
   `elif` line.

2. `water_temperature < 100` is also `False`. Python does not perform
   the second block.

3. No condition was `True`, so Python performs the block under
   `else:`. The name `water_state` refers to `"steam"`.

```{attempt}
:id: water-not-run
:check: water-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-water
:title: Add a cell that chooses between three states of water, and run it
:path: {{ notebook }}
:tags: [water]
:run: true
water_temperature = 120
if water_temperature <= 0:
    water_state = "ice"
elif water_temperature < 100:
    water_state = "liquid water"
else:
    water_state = "steam"
print(water_state)
```

```{verify}
:id: water-ran
:label: Python chose one of three branches
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed water
if globals().get("water_temperature") == 120 and globals().get("water_state") == "steam":
    print("The cell ran. No condition was True, so Python performed the block under else.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("water_temperature") == 120 and globals().get("water_state") == "steam"
```

Three rules are important:

- Python performs exactly one of the blocks. When it has performed a
  block, it does not test the conditions below it. It continues with
  the first line after all the branches.

- The `elif` line does not need to say "greater than 0". Python
  reaches the `elif` line only when the condition above it was
  `False`, so the temperature is already known to be greater than 0.

- A decision can have as many `elif` lines as it needs. The `else`, if
  there is one, comes last.

You can change the first line of the cell in your notebook to
`water_temperature = 20`, or to `water_temperature = -5`, and run the
cell again to see the other two branches.

## The order of the conditions matters

Python uses the first condition that is `True`. For that reason, the
order of the conditions can change the result. Look at this cell, and
do not run it yet.

```python
outside_temperature = 32
if outside_temperature >= 20:
    advice = "It is warm."
elif outside_temperature >= 30:
    advice = "It is hot."
else:
    advice = "It is cold."
print(advice)
```

```{quiz}
:id: predict-advice
:type: text
:title: Predict the output
question: What does this cell show when it runs?
answer: ["It is warm.", "It is warm"]
wrong:
  - { text: "It is hot.", explanation: "32 is greater than 30, but Python never tests that condition. It tests the conditions from the top, and the first condition, `outside_temperature >= 20`, is already `True`." }
  - { text: "It is hot", explanation: "32 is greater than 30, but Python never tests that condition. It tests the conditions from the top, and the first condition, `outside_temperature >= 20`, is already `True`." }
  - { text: "It is cold.", explanation: "Python performs the block under `else:` only when no condition was `True`. Here the first condition is `True`." }
otherwise: "Python tests the conditions in order, from the top, and performs the block of the first condition that is `True`. Is 32 greater than or equal to 20?"
explanation: "The first condition, `outside_temperature >= 20`, is `True` for 32. Python performs the first block, and does not test the `elif` condition."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: advice-not-run
:check: advice-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-advice
:title: Add a cell that has its conditions in the wrong order, and run it
:path: {{ notebook }}
:tags: [advice]
:run: true
outside_temperature = 32
if outside_temperature >= 20:
    advice = "It is warm."
elif outside_temperature >= 30:
    advice = "It is hot."
else:
    advice = "It is cold."
print(advice)
```

```{verify}
:id: advice-ran
:label: Python used the first condition that was True
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed advice
if globals().get("outside_temperature") == 32 and globals().get("advice") == "It is warm.":
    print("The cell ran. The first condition was True, so Python did not test the second condition.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("outside_temperature") == 32 and globals().get("advice") == "It is warm."
```

In this cell, the block `advice = "It is hot."` can never run. Every
temperature that is 30 or more is also 20 or more, so the first
condition always takes it.

Python does not report this as an error. The program runs, and gives
a wrong answer. To correct the program, test for the highest
temperature first: put `outside_temperature >= 30` in the `if` line
and `outside_temperature >= 20` in the `elif` line.
