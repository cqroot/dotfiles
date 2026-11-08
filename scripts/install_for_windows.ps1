#!/usr/bin/env pwsh

if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Installing scoop..."
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

scoop install git

scoop bucket add main
scoop bucket add extras
scoop bucket add versions
scoop bucket add nerd-fonts

scoop install `
    alacritty `
    bat `
    brave `
    nerd-fonts/CascadiaCode-NF `
    delta `
    extras/firefox `
    fzf `
    extras/geekuninstaller `
    lazygit `
    mpv `
    neovim `
    obsidian `
    versions/opencode2 `
    pwsh `
    python `
    ripgrep `
    sqlite `
    starship `
    thunderbird `
    zoxide

scoop install `
    lua-language-server `
    shellcheck `
    shfmt `
    stylua

scoop update
