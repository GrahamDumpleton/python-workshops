# Guided JupyterLab workshops teaching Python to people new to programming. Run `just` to list targets.

repo := "https://github.com/GrahamDumpleton/python-workshops"

# The catalog names every collection in this repository, so one URL
# offers them all; each collection has an index of its own under
# collections/<name>/, with an id that never changes.
catalog_title := "Python fundamentals workshops"
catalog_description := "Guided JupyterLab workshops that teach Python to people new to programming, from a first line of code in a notebook to a tested project of their own in a virtual environment."

# Each collection's id, title and description, and the list of its
# workshops in the order to take them. OUTLINE.md is the design these
# lists follow; `just index` writes each index in this order, skipping
# any workshop not written yet, so the order lives here and nowhere else.

first_steps_id := "grahamdumpleton.me/python-fundamentals/first-steps"
first_steps_title := "Python first steps"
first_steps_description := "Guided workshops for people who have never written a program. Learn how these workshops work, then write your first Python: numbers, names, text, error messages, decisions, lists and loops, in a notebook in your browser."
first_steps := "how-this-works talking-to-python naming-things working-with-text when-things-go-wrong making-decisions keeping-a-list doing-it-again a-shopping-receipt"

functions_and_data_id := "grahamdumpleton.me/python-fundamentals/functions-and-data"
functions_and_data_title := "Python functions and data"
functions_and_data_description := "Guided workshops that teach you to organise Python code and data: functions, dictionaries, tuples and sets, loops over any kind of data, and how two names can share one list. You write most of the code yourself."
functions_and_data := "your-first-function functions-with-options looking-things-up pairs-and-unique-things looping-over-anything building-lists-in-one-line two-names-one-list counting-words"

working_with_data_id := "grahamdumpleton.me/python-fundamentals/working-with-data"
working_with_data_title := "Working with real data in Python"
working_with_data_description := "Guided workshops that use Python on real data: reading and writing files, handling errors, the standard library, CSV and JSON, and cleaning untidy text, while building a program that tracks spending."
working_with_data := "reading-and-writing-files when-the-data-is-wrong the-batteries-included csv-and-json cleaning-messy-text where-the-money-went"

your_own_types_id := "grahamdumpleton.me/python-fundamentals/your-own-types"
your_own_types_title := "Your own types in Python"
your_own_types_description := "Guided workshops that introduce classes: what a class is and why you would make one, objects that describe themselves, dataclasses, and building one class on another, using the spending tracker as the example."
your_own_types := "your-first-class objects-that-explain-themselves building-on-another-class spending-as-objects"

notebook_to_program_id := "grahamdumpleton.me/python-fundamentals/notebook-to-program"
notebook_to_program_title := "From a Python notebook to a program"
notebook_to_program_description := "Guided workshops that move your Python from a notebook into files you run in a terminal: modules, scripts, command line arguments, packages, how imports find code, and finding bugs."
notebook_to_program := "files-editors-and-terminals python-in-the-terminal code-in-a-file running-a-script taking-arguments splitting-into-modules where-imports-come-from making-a-package finding-the-bug"

working_like_a_developer_id := "grahamdumpleton.me/python-fundamentals/working-like-a-developer"
working_like_a_developer_title := "Working like a Python developer"
working_like_a_developer_description := "Guided workshops on how Python projects are made and why: virtual environments and how they work, installing packages with pip and with uv, testing, project layout and tools, and a final project of your own."
working_like_a_developer := "why-an-environment an-environment-of-your-own installing-packages the-same-with-uv testing-your-code a-proper-project your-own-project"

# The first four collections run in JupyterLite as well as JupyterLab,
# and the last two need a terminal that can run python, which
# JupyterLite does not have. Which frontends a workshop runs on is read
# from the `frontends` line of its manifest, the one place it is
# recorded: a workshop that lists jupyterlite there is linted and
# self-tested on both, and carried by the JupyterLite site. The CI
# workflows read it the same way.
lite_check := "grep -qE '^frontends:.*jupyterlite' \"$dir/workshop.yaml\""

# What the JupyterLite site subscribes to: a catalog of its own, naming
# the four collections that run there. Not catalog.json, which lists the
# last two collections as well, and they cannot run there. And not the
# four indexes passed one by one with --collection: each is carried at
# the root of the site under its own file name, and all four are named
# collection.json, so the build refuses the second. A catalog carries
# the indexes it names at their relative paths, so they stay apart.
lite_collections := "--catalog catalog-lite.json"

# List available targets.
default:
    @just --list

# Set up the environment: sync uv, fetch the reference checkout, download the self-test browser, link the authoring skill.
install:
    uv sync
    git submodule update --init
    uv run playwright install chromium
    just skill

# The skill ships inside the jupyterlab-workshop package. Linking it into
# .claude/skills lets Claude Code load it without a copy in this repository,
# and it tracks the pinned release; rerun after bumping the version.
# Link the authoring skill from the installed package into .claude/skills.
skill:
    #!/usr/bin/env bash
    set -euo pipefail
    target=$(uv run python -c 'import jupyterlab_workshop, pathlib; print(pathlib.Path(jupyterlab_workshop.__file__).parent / "skills" / "jupyterlab-workshop-authoring")')
    mkdir -p .claude/skills
    ln -sfn "$target" .claude/skills/jupyterlab-workshop-authoring
    echo "Linked .claude/skills/jupyterlab-workshop-authoring -> $target"

# JupyterLab must run from this directory: the extension lists workshops/
# as installed, and the MCP live tools open workshops by paths relative
# to this root, such as workshops/<name>.
# Start JupyterLab from the checkout, listing the workshops in each collection's order.
[positional-arguments]
lab *ARGS:
    uv run jupyter lab --config=jupyter_lab_config.py "$@"

# Scaffold a new workshop under workshops/; extra args go to `jupyter workshop init`.
[positional-arguments]
new NAME *ARGS:
    shift; uv run jupyter workshop init workshops/{{NAME}} "$@"

# A workshop of the first four collections is linted twice: once
# plainly, and once for the frontend that has no server, no subprocess
# and no python in the shell. The last two collections are JupyterLab
# only, and their manifests list no jupyterlite frontend.
# Lint the catalog, every collection index and every workshop, or only the workshops named.
lint *NAMES:
    #!/usr/bin/env bash
    set -euo pipefail
    shopt -s nullglob
    names=({{NAMES}})
    if [ ${#names[@]} -eq 0 ]; then
        if [ -f catalog.json ]; then
            uv run jupyter workshop lint catalog.json
        fi
        if [ -f catalog-lite.json ]; then
            uv run jupyter workshop lint catalog-lite.json
        fi
        for index in collections/*/collection.json; do
            uv run jupyter workshop lint "$index"
        done
        dirs=(workshops/*/)
    else
        dirs=("${names[@]/#/workshops/}")
    fi
    if [ ${#dirs[@]} -eq 0 ]; then
        echo "No workshops under workshops/ yet"
        exit 0
    fi
    for dir in "${dirs[@]}"; do
        echo "== $dir"
        uv run jupyter workshop lint "$dir"
        if {{lite_check}}; then
            echo "== $dir (jupyterlite)"
            uv run jupyter workshop lint "$dir" --frontend jupyterlite
        fi
    done

# Render one workshop as HTML to check what a page looks like; extra args go to `jupyter workshop render`.
[positional-arguments]
render NAME *ARGS:
    shift; uv run jupyter workshop render workshops/{{NAME}} "$@"

# The self-test runs the workshop's actions and checks for real, as you,
# on this machine; only the workshop directory is protected, by a
# temporary copy. Read the workshop first.
# Self-test one workshop in a JupyterLab of its own; extra args go to `jupyter workshop test`.
[positional-arguments]
test NAME *ARGS:
    shift; uv run jupyter workshop test workshops/{{NAME}} "$@"

# The JupyterLite self-test builds a site, serves it and drives it in a
# headless browser with the Pyodide kernel, which is what a learner who
# opens the site gets. A workshop of the first four collections is not
# done until this is green too.
# Self-test one workshop in JupyterLite; extra args go to `jupyter workshop test`.
[positional-arguments]
test-lite NAME *ARGS:
    shift; uv run jupyter workshop test workshops/{{NAME}} --frontend jupyterlite "$@"

# Self-test every workshop, on both frontends where it runs on both, writing a JUnit report for each.
test-all:
    #!/usr/bin/env bash
    set -euo pipefail
    shopt -s nullglob
    for dir in workshops/*/; do
        name=$(basename "$dir")
        echo "== $dir (jupyterlab)"
        uv run jupyter workshop test "$dir" --junit "results-$name.xml"
        if {{lite_check}}; then
            echo "== $dir (jupyterlite)"
            uv run jupyter workshop test "$dir" --frontend jupyterlite --junit "results-$name-lite.xml"
        fi
    done

# The site carries every workshop whose manifest lists jupyterlite, and
# the indexes of the first four collections, so the browser
# lists them under each collection's title and in its order. The
# settings file has the disabled features and turns reporting on, and
# the welcome message says so. No terminal: no workshop on the site
# runs a command.
# Build the JupyterLite site into dist/, carrying the workshops that run there.
[positional-arguments]
site *ARGS:
    #!/usr/bin/env bash
    set -euo pipefail
    shopt -s nullglob
    dirs=()
    for dir in workshops/*/; do
        if {{lite_check}}; then
            dirs+=("$dir")
        fi
    done
    if [ ${#dirs[@]} -eq 0 ]; then
        echo "No workshops that run in JupyterLite under workshops/ yet"
        exit 0
    fi
    uv run jupyter workshop lite "${dirs[@]}" --out dist --no-terminal {{lite_collections}} --settings lite/settings.json --welcome lite/welcome.md "$@"

# Build the JupyterLite site and serve it locally to try it out.
[positional-arguments]
site-serve *ARGS:
    just site --serve "$@"

# Write or refresh every collection index and the catalog.
index: index-first-steps index-functions-and-data index-working-with-data index-your-own-types index-notebook-to-program index-working-like-a-developer catalog

# The workshop directories are named one by one, in the collection's
# order, which is how `jupyter workshop index` is told the order to
# write; naming only the directories that exist lets the index be
# refreshed while the collection is still being written. The repository
# URL is given explicitly so the index does not depend on a git remote
# being configured in the checkout. The analytics block comes from
# collection.yaml at the root.
[private]
index-collection NAME ID TITLE DESCRIPTION WORKSHOPS *TAGS:
    #!/usr/bin/env bash
    set -euo pipefail
    dirs=()
    for name in {{WORKSHOPS}}; do
        if [ -d "workshops/$name" ]; then
            dirs+=("workshops/$name")
        fi
    done
    if [ ${#dirs[@]} -eq 0 ]; then
        echo "No {{NAME}} workshops under workshops/ yet; collections/{{NAME}}/collection.json is left as it is"
        exit 0
    fi
    tags=()
    for tag in {{TAGS}}; do
        tags+=(--tag "$tag")
    done
    mkdir -p collections/{{NAME}}
    uv run jupyter workshop index "${dirs[@]}" --root . --out collections/{{NAME}}/collection.json --repo "{{repo}}" --id "{{ID}}" --title "{{TITLE}}" --description "{{DESCRIPTION}}" --homepage "{{repo}}" "${tags[@]}" --ordered

# Write or refresh collections/first-steps/collection.json in the collection's order.
index-first-steps:
    just index-collection first-steps "{{first_steps_id}}" "{{first_steps_title}}" "{{first_steps_description}}" "{{first_steps}}" python beginners notebook

# Write or refresh collections/functions-and-data/collection.json in the collection's order.
index-functions-and-data:
    just index-collection functions-and-data "{{functions_and_data_id}}" "{{functions_and_data_title}}" "{{functions_and_data_description}}" "{{functions_and_data}}" python beginners functions notebook

# Write or refresh collections/working-with-data/collection.json in the collection's order.
index-working-with-data:
    just index-collection working-with-data "{{working_with_data_id}}" "{{working_with_data_title}}" "{{working_with_data_description}}" "{{working_with_data}}" python beginners files data notebook

# Write or refresh collections/your-own-types/collection.json in the collection's order.
index-your-own-types:
    just index-collection your-own-types "{{your_own_types_id}}" "{{your_own_types_title}}" "{{your_own_types_description}}" "{{your_own_types}}" python beginners classes notebook

# Write or refresh collections/notebook-to-program/collection.json in the collection's order.
index-notebook-to-program:
    just index-collection notebook-to-program "{{notebook_to_program_id}}" "{{notebook_to_program_title}}" "{{notebook_to_program_description}}" "{{notebook_to_program}}" python beginners modules terminal

# Write or refresh collections/working-like-a-developer/collection.json in the collection's order.
index-working-like-a-developer:
    just index-collection working-like-a-developer "{{working_like_a_developer_id}}" "{{working_like_a_developer_title}}" "{{working_like_a_developer_description}}" "{{working_like_a_developer}}" python beginners packaging testing terminal

# Write or refresh catalog.json and catalog-lite.json from the collection indexes, recorded by relative path.
catalog:
    uv run jupyter workshop catalog catalog-lite.json collections/first-steps/collection.json collections/functions-and-data/collection.json collections/working-with-data/collection.json collections/your-own-types/collection.json --relative --title "{{catalog_title}}" --description "The parts of the course that run in the browser, in a notebook, with nothing to install." --homepage "{{repo}}"
    uv run jupyter workshop catalog catalog.json collections/first-steps/collection.json collections/functions-and-data/collection.json collections/working-with-data/collection.json collections/your-own-types/collection.json collections/notebook-to-program/collection.json collections/working-like-a-developer/collection.json --relative --title "{{catalog_title}}" --description "{{catalog_description}}" --homepage "{{repo}}"

# Binder and Codespaces install from binder/requirements.txt, so it is
# the locked runtime set (no dev group) exported from uv.lock, and is
# regenerated whenever the lock changes.
# Relock and export the runtime dependencies to binder/requirements.txt.
requirements:
    uv lock
    uv export --no-dev --no-hashes --no-annotate -o binder/requirements.txt

# The extension's reference checkout is what agents read for the workshop
# format beyond the skill (docs/, examples/ and the source), so it is
# kept at the tag of the pinned release and moves with the pin.
# Pin a new jupyterlab-workshop release, relock, rewrite binder/requirements.txt, relink the skill and move the reference checkout.
bump VERSION:
    uv add "jupyterlab-workshop=={{VERSION}}"
    just requirements
    just skill
    git -C reference/jupyterlab-workshop fetch --tags
    git -C reference/jupyterlab-workshop checkout "{{VERSION}}"
    git add reference/jupyterlab-workshop

# Collections 1 to 5 build no environment of their own, so the prune is a
# no-op for them; it is kept so that a kernelspec left pointing at a
# removed environment never lingers in the launcher.
# Remove what opening, running and publishing the workshops leaves behind.
clean:
    rm -rf workshops/*/_workshop workshops/*/work workshops/*/dist workshops/*/scratch dist
    rm -f results-*.xml
    find . -type d -name .ipynb_checkpoints -not -path "./.venv/*" -exec rm -rf {} +
    find . -type d -name __pycache__ -not -path "./.venv/*" -not -path "./scratch/*" -not -path "./reference/*" -exec rm -rf {} +
    uv run jupyter workshop kernels --prune

# Also remove the environment and the skill link; run `just install` afterwards.
distclean: clean
    rm -rf .venv .claude/skills/jupyterlab-workshop-authoring
    git submodule deinit -f reference/jupyterlab-workshop
