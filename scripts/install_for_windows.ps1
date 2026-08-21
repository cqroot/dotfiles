#!/usr/bin/env pwsh

if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Installing scoop..."
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

scoop bucket add main
scoop bucket add extras
scoop bucket add nerd-fonts

scoop install `
    alacritty `
    bat `
    brave `
    delta `
    fzf `
    lazygit `
    mpv `
    neovim `
    obsidian `
    opencode `
    pwsh `
    python `
    ripgrep `
    sqlite `
    starship `
    thunderbird `
    zoxide

scoop install `
    bash-language-server `
    gopls `
    lua-language-server `
    prettier `
    pyright `
    black `
    shellcheck `
    shfmt `
    stylua

scoop update
