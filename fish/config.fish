if not status is-interactive
    exit
end

set fish_greeting

set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx PAGER "less"
set -gx MANPAGER "nvim +Man!"
set -gx PAGER "bat"
set -gx GOPATH "$HOME/go"

fish_add_path $HOME/.bin
fish_add_path $HOME/.secret_bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $GOPATH/bin
fish_add_path /home/linuxbrew/.linuxbrew/bin/

abbr srcfish 'source ~/.config/fish/config.fish'
abbr ls 'ls --color=auto'
abbr ll 'ls --color=auto -lh --group-directories-first'
abbr la 'ls --color=auto -lha --group-directories-first'
abbr l. "ls --color=auto -A | grep -E '^\.'"
abbr grep 'grep --color=auto'
abbr gs 'git status'
abbr gll "git log --pretty=format:'%C(yellow)%h %Cgreen%ad %Creset%s' --date=short"
abbr gl "git log --pretty=format:'%C(yellow)%h %Cgreen%ad %Creset%s' --date=short -n 20"
abbr gd 'git diff'
abbr gdc 'git diff --cached'
abbr paru 'env all_proxy=http://127.0.0.1:7890 paru'
abbr srctmux 'tmux source-file ~/.config/tmux/tmux.conf'
abbr tl 'tmux ls'
abbr tn 'tmux new -s (basename $PWD)'
abbr ta 'tmux attach -t'
abbr nvi nvim
abbr lg lazygit
abbr oc opencode
abbr dm domic
function dmcd
    cd (domic configdir)
end

set -gx FZF_DEFAULT_OPTS '--cycle --border=rounded --pointer=• --prompt="❯ "'
fzf --fish | source

zoxide init --cmd cd fish | source
starship init fish | source

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end
