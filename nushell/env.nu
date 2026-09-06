$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.PAGER = "bat"
$env.MANPAGER = "nvim +Man!"
$env.GOPATH = $"($env.HOME)/go"

$env.PATH = ($env.PATH | prepend [
    $"($env.HOME)/.bin"
    $"($env.HOME)/.secret_bin"
    $"($env.HOME)/.local/bin"
    $"($env.HOME)/.cargo/bin"
    $"($env.GOPATH)/bin"
    "/home/linuxbrew/.linuxbrew/bin"
])

$env.FZF_DEFAULT_OPTS = '--cycle --border=rounded --pointer=• --prompt="❯ "'
