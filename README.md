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

### perf mode
```
# WARNING: Kernel address maps (/proc/{kallsyms,modules}) are restricted,
# cat /proc/sys/kernel/kptr_restrict
# cat /proc/sys/kernel/perf_event_paranoid

sudo sysctl -w kernel.kptr_restrict=0

# The current value is 3:
# -1: Allow use of (almost) all events by all users
# Ignore mlock limit after perf_event_mlock_kb without CAP_IPC_LOCK
# >= 0: Disallow ftrace function tracepoint by users without CAP_SYS_ADMIN
# Disallow raw tracepoint access by users without CAP_SYS_ADMIN
# >= 1: Disallow CPU event access by users without CAP_SYS_ADMIN
# >= 2: Disallow kernel profiling by users without CAP_SYS_ADMIN

sudo sysctl -w kernel.perf_event_paranoid=-1

# reload
sysctl -p /etc/sysctl.conf
```
