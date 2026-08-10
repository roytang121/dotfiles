# gnome

GNOME settings, kept in the repo the way `i3/config` is.

Unlike i3, GNOME reads no text config. Everything lives in **dconf**, a binary
keyfile database at `~/.config/dconf/user`. It cannot be symlinked into this
repo the way `~/.config/i3` is: the file is binary (useless diffs), dconf
rewrites it wholesale (the symlink gets replaced), and it holds volatile
machine state you do not want replayed onto another box.

So this directory holds a **text export** instead, regenerated on demand.

## Usage

Save current GNOME settings into this repo, then commit:

```sh
./dump.sh
git add -A gnome/ && git commit -m 'gnome: update settings'
```

Apply them on a fresh machine:

```sh
sudo apt install dconf-cli
./load.sh
ln -s ~/github/dotfiles/gnome/bin/rofi ~/.local/bin/rofi
```

`paths` lists which dconf subtrees are tracked; one file is produced per path.
Add a path there and re-run `dump.sh` to track more.

## Caveats

- **`load.sh` merges, it does not replace.** Keys in a file are set; keys absent
  are left alone. Deleting a binding here will *not* remove it on a machine
  where it was already applied — clear it by hand with `gsettings reset` or
  `dconf reset`.
- **`mru-sources`** in `org-gnome-desktop-input-sources.dconf` is a
  most-recently-used list and churns on its own. Harmless, but expect the
  occasional no-op diff.
- **Absolute paths are baked in.** The `Super+D` binding points at
  `/home/rtang/.local/bin/rofi`; a machine with a different username needs that
  edited after loading.
- Keep `paths` narrow. `dconf dump /` also captures window positions,
  recently-used files and per-app state.

## Super+D → rofi

`org-gnome-settings-daemon-plugins-media-keys.dconf` carries the i3-equivalent
launcher binding. It runs `~/.local/bin/rofi`, a wrapper that adds
`-x11 -normal-window` on GNOME Wayland — Mutter implements neither
`wlr-layer-shell` (rofi's Wayland backend needs it) nor focus for
override-redirect X11 windows (rofi's default X11 mode needs it), so a managed
window is the only input path that works.

The wrapper lives at `bin/rofi` here and is symlinked to `~/.local/bin/rofi`,
which precedes `/usr/local/bin` in `PATH`. It only injects those flags on GNOME
Wayland, so it is a no-op on sway/Hyprland where the native Wayland backend
works.
