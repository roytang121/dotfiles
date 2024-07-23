# dotfiles
## Installation

### vimplug
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
### tmux conf
> https://github.com/tmux-plugins/tpm
```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Linux
### screen dpi
```sh
xrdb ~/.Xresources
```
### remap key
```sh
# ~/.xprofile
setxkbmap -option ctrl:swapcaps
```

### gnome
```sh
env XDG_CURRENT_DESKTOP=GNOME gnome-control-center
```
