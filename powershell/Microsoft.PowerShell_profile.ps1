Set-PSReadLineOption -EditMode Emacs

Set-Alias -Name ls   -Value eza  -Option AllScope
Set-Alias -Name cat  -Value bat  -Option AllScope
Set-Alias -Name grep -Value rg
Set-Alias -Name nvi  -Value nvim
Set-Alias -Name lg   -Value lazygit
function ll  { eza --long       @args }
function la  { eza --long --all @args }
function gs  { git status       @args }

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/bubbles.omp.json" | Invoke-Expression

