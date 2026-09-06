alias grep = ^grep --color=auto
alias gs = git status
alias gd = git diff
alias gdc = git diff --cached
alias gll = git log --pretty=format:"%C(yellow)%h %Cgreen%ad %Creset%s" --date=short
alias gl = git log --pretty=format:"%C(yellow)%h %Cgreen%ad %Creset%s" --date=short -n 20
alias nvi = nvim
alias vim = nvim
alias lg = lazygit
alias oc = opencode
alias dm = domic

if not (($nu.default-config-dir | path join "autoload") | path exists) {
    mkdir ($nu.default-config-dir | path join "autoload")
}

if not (($nu.default-config-dir | path join "autoload" "fzf.nu") | path exists) {
    fzf --nushell | save -f ($nu.default-config-dir | path join "autoload" "fzf.nu")
}

if not (($nu.default-config-dir | path join "autoload" "starship.nu") | path exists) {
    starship init nu | save -f ($nu.default-config-dir | path join "autoload" "starship.nu")
}

if not (($nu.default-config-dir | path join "autoload" "zoxide.nu") | path exists) {
    zoxide init nushell | save -f ($nu.default-config-dir | path join "autoload" "zoxide.nu")
}

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	^yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != $env.PWD and ($cwd | path exists) {
		cd $cwd
	}
	rm -fp $tmp
}

def --env dmcd [] {
    cd (domic configdir)
}

