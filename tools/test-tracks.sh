#!/usr/bin/env bash
# Self-test a workshop once for each of its tracks.
#
# The self-test answers a `choice` that picks a track by taking the
# first track of the manifest, so it runs the pages of that track
# alone. This script makes a temporary copy of the workshop for each
# track, with that track moved to the front of `tracks`, and
# self-tests the copy. The workshop itself is not changed.
#
# Usage: tools/test-tracks.sh workshops/<name> [arguments for `jupyter workshop test`]
set -euo pipefail

source_dir=${1%/}
shift
name=$(basename "$source_dir")

tracks=$(uv run python - "$source_dir/workshop.yaml" <<'PY'
import sys, yaml
manifest = yaml.safe_load(open(sys.argv[1]))
print(" ".join(track["id"] for track in manifest.get("tracks", [])))
PY
)

if [ -z "$tracks" ]; then
    echo "$source_dir declares no tracks"
    exit 1
fi

copies=$(mktemp -d)
trap 'rm -rf "${copies:?}"' EXIT

failed=0
for track in $tracks; do
    copy="$copies/$track/$name"
    mkdir -p "$copies/$track"
    cp -R "$source_dir" "$copy"
    rm -rf "${copy:?}/work" "${copy:?}/_workshop"
    uv run python - "$copy/workshop.yaml" "$track" <<'PY'
import sys, yaml
path, first = sys.argv[1], sys.argv[2]
manifest = yaml.safe_load(open(path))
manifest["tracks"].sort(key=lambda track: track["id"] != first)
yaml.safe_dump(manifest, open(path, "w"), sort_keys=False, allow_unicode=True)
PY
    echo "== $name, track $track"
    uv run jupyter workshop test "$copy" "$@" || failed=1
done
exit $failed
