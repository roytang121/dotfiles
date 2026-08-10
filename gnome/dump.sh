#!/bin/sh
# Export the tracked dconf subtrees (see ./paths) into .dconf text files
# alongside this script, so GNOME settings can be diffed and committed the
# same way i3/config is.
#
# Run this after changing something in GNOME Settings that you want to keep.
set -eu

cd "$(dirname "$0")"

if ! command -v dconf >/dev/null 2>&1; then
	echo "dump.sh: dconf not found (apt install dconf-cli)" >&2
	exit 1
fi

while IFS= read -r path; do
	case "$path" in
	'' | \#*) continue ;;
	esac

	# /org/gnome/desktop/interface/ -> org-gnome-desktop-interface.dconf
	file="$(printf '%s' "$path" | sed 's#^/##; s#/$##; s#/#-#g').dconf"

	dconf dump "$path" >"$file"

	if [ -s "$file" ]; then
		echo "dumped  $path -> $file"
	else
		# An empty subtree is legitimate (nothing customised yet); keep the
		# file so the path stays visible in the repo.
		echo "empty   $path -> $file"
	fi
done <paths
