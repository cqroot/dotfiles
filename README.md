# ~/.dotfiles

## Installation

```bash
# Run the installer script
bash ./install.bash
```

```bash
# Disable the default TTY1 login prompt
sudo systemctl disable getty@tty1.service
# Enable `ly` (TUI login manager) on TTY1
sudo systemctl enable ly@tty1.service
```
