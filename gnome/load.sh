#!/bin/sh
# Apply the committed .dconf files to the current GNOME session.
# Run this on a fresh machine after cloning the dotfiles repo.
#
# NOTE: dconf load MERGES. Keys present in a file are set; keys absent from it
# are left untouched. Deleting a binding from a .dconf file will therefore not
# remove it on a machine where it was already applied -- reset that key by hand
# with `dconf reset` or `gsettings reset`.
set -eu

cd "$(dirname "$0")"

if ! command -v dconf >/dev/null 2>&1; then
	echo "load.sh: dconf not found (apt install dconf-cli)" >&2
	exit 1
fi

while IFS= read -r path; do
	case "$path" in
	'' | \#*) continue ;;
	esac

	file="$(printf '%s' "$path" | sed 's#^/##; s#/$##; s#/#-#g').dconf"

	if [ ! -f "$file" ]; then
		echo "missing $file (skipping $path)" >&2
		continue
	fi
	if [ ! -s "$file" ]; then
		echo "empty   $file (skipping $path)"
		continue
	fi

	dconf load "$path" <"$file"
	echo "loaded  $file -> $path"
done <paths
