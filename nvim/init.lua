local utils = require("utils")

utils.load_modules({
	"core",
	"plugins",
})

vim.cmd("colorscheme " .. "dracula")
vim.cmd("exec 'source '.stdpath('config').'/coc.vim'")
vim.cmd("command W :execute ':silent w !sudo tee % > /dev/null' | :edit!")
