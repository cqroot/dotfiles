Set-PSReadLineOption -EditMode Emacs

$env:EDITOR = "nvim"
$env:VISUAL = "nvim"
$env:PAGER = "bat"
$env:GOPATH = "$env:USERPROFILE\go"

$env:PATH = "$env:USERPROFILE\.cargo\bin;$env:PATH"
$env:PATH = "$env:GOPATH\bin;$env:PATH"

function Get-Gl {
    & git log --pretty=format:"%C(yellow)%h %Cgreen%ad %Creset%s" --date=short @args
}

function ls { Get-ChildItem }
function ll { Get-ChildItem }
function grep { Select-String @args }
function gs { & git status @args }
function gl { Get-Gl @args }
function gd { & git diff @args }
function gdc { & git diff --cached @args }
function lg { & lazygit @args }
function oc { & opencode @args }
function dm { & domic @args }
function nvi { & nvim @args }
function vim { & nvim @args }

function dmcd {
    Set-Location (domic configdir)
}

$env:FZF_DEFAULT_OPTS = "--cycle --border=rounded --pointer=• --prompt=""❯ """
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Invoke-Expression (& { (starship init powershell | Out-String) })
