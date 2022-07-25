local utils = require("utils")

utils.load_modules(
    {
        "core",
        "plugins"
    }
)

vim.cmd("colorscheme " .. "dracula")
vim.cmd("exec 'source '.stdpath('config').'/coc.vim'")
