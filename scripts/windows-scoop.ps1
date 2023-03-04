# install scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
irm get.scoop.sh | iex

# set proxy
[net.webrequest]::defaultwebproxy = new-object net.webproxy "http://127.0.0.1:7890"

scoop install go
scoop install python
scoop install 7zip
scoop install nodejs
scoop install neovim
scoop install ripgrep
scoop install bat
scoop install fzf
scoop install golangci-lint
scoop install gitui
scoop install lf
scoop install gcc
scoop install make
# lua
scoop install lua-language-server
scoop install stylua

# extras ==================================================
scoop bucket add extras
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

scoop install notepad3
# reg import "C:\Users\cqroot\scoop\apps\notepad3\current\install-context.reg"

scoop install vscode
# reg import "C:\Users\cqroot\scoop\apps\vscode\current\install-context.reg"
reg import "C:\Users\cqroot\scoop\apps\vscode\current\install-associations.reg"

# nerd-fonts ==================================================
scoop bucket add nerd-fonts
scoop install Cascadia-Code
scoop install CascadiaCode-NF
scoop install FiraCode
scoop install FiraCode-NF
