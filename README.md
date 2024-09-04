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

### Disable TLP USB Power Saving
1. **Install TLP
```bash
sudo apt install tlp
```
2. **Open the TLP configuration file**:
```bash
sudo nano /etc/tlp.conf
3. **Uncomment and modify following items
```bash
USB_AUTOSUSPEND=0
USB_BLACKLIST_BTUSB=1
```
4. **Save the file and restart TLP:**
```bash
sudo systemctl restart tlp
```

