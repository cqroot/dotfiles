vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.wildignorecase = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.smarttab = false
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.termguicolors = true
vim.opt.colorcolumn = { 80, 120 }

vim.opt.conceallevel = 0
vim.opt.list = true
vim.opt.listchars = {
    space = "·",
    -- tab = "» ",
    tab = "│ ",
    trail = "·",
    nbsp = "·",
    eol = "↴",
}
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.fileformats = { "unix", "dos" }
vim.opt.fixendofline = false

vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

if vim.g.kcnc_enable_navigator == 1 then
    require("utils.im_fcitx")
end

pcall(require, "generated_options")
