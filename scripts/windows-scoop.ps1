# install scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
irm get.scoop.sh | iex

# set proxy
[net.webrequest]::defaultwebproxy = new-object net.webproxy "http://127.0.0.1:7890"

scoop bucket add nonportable
scoop bucket add extras

scoop install go
scoop install python
scoop install 7zip
scoop install nodejs
scoop install neovim
scoop install ripgrep
scoop install bat
scoop install fzf
scoop install gitui
scoop install lf
scoop install gcc
scoop install make
scoop install ffmpeg
# go
scoop install golangci-lint
# lua
scoop install lua-language-server
scoop install stylua

# extras ==================================================
scoop install obsidian
scoop install potplayer
scoop install joplin
scoop install gimp
scoop install sublime-text
scoop install telegram
scoop install doublecmd
scoop install geekuninstaller
scoop install snipaste
scoop install trafficmonitor
scoop install quicklook
scoop install screentogif

scoop install mpv
# The $HOME\scoop\apps\mpv\current\portable_config needs to be removed
scoop install icaros-np

scoop install notepad3
# reg import "C:\Users\cqroot\scoop\apps\notepad3\current\install-context.reg"

scoop install vscode
# reg import "C:\Users\cqroot\scoop\apps\vscode\current\install-context.reg"
reg import "C:\Users\cqroot\scoop\apps\vscode\current\install-associations.reg"

scoop install files-np

# nerd-fonts ==================================================
scoop bucket add nerd-fonts
scoop install Cascadia-Code
scoop install CascadiaCode-NF
scoop install FiraCode
scoop install FiraCode-NF
