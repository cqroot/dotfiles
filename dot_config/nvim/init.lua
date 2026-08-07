-- ============================================================
-- Options
-- ============================================================
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.wrap = false
vim.opt.winborder = 'rounded'

vim.opt.ignorecase = true
vim.opt.wildignorecase = true
vim.opt.list = true
vim.opt.listchars = {
    space = '·',
    tab = '│ ',
    trail = '·',
    nbsp = '·',
}
vim.opt.fileformats = { 'unix', 'dos' }
vim.opt.termguicolors = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.g.mapleader = ';'

-- ============================================================
-- Packages
-- ============================================================
vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.pick',         version = 'stable' },
    { src = 'https://github.com/nvim-mini/mini.icons',        version = 'stable' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/saghen/blink.lib' },
    { src = 'https://github.com/saghen/blink.cmp' },
    { src = 'https://github.com/rafamadriz/friendly-snippets' },
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/numToStr/Comment.nvim' },
    { src = 'https://github.com/vague-theme/vague.nvim' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/akinsho/bufferline.nvim' }
})
require('mini.icons').setup()
require('mini.icons').mock_nvim_web_devicons()
require('lualine').setup({
    options = { section_separators = '', component_separators = '' }
})
require("bufferline").setup({
    options = {
        show_close_icon = false,
        show_buffer_close_icons = false,
        separator_style = "thick",
    }
})

-- ============================================================
-- LSPs
-- ============================================================
vim.lsp.enable({ 'lua_ls', 'bashls' })
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true) }
        }
    }
})

-- ============================================================
-- Completion
-- ============================================================
local cmp = require('blink.cmp')
cmp.setup({
    keymap = {
        preset = 'super-tab'
    },
})

-- ============================================================
-- Pick
-- ============================================================
require('mini.pick').setup()

-- ============================================================
-- Comment
-- ============================================================
require('Comment').setup({
    toggler = {
        line = "<C-_>",
        block = "gbc",
    },
    opleader = {
        line = "<C-_>",
        block = "gb",
    },
})

-- ============================================================
-- File Explorer
-- ============================================================
require("oil").setup({
    keymaps = {
        ["<Backspace>"] = "actions.parent",
        ["-"] = "actions.parent",
    },
})

-- ============================================================
-- Git
-- ============================================================
require('gitsigns').setup({
    signs = {
        add          = { text = '▐' },
        change       = { text = '▐' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged = {
        add          = { text = '▐' },
        change       = { text = '▐' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    current_line_blame = true,
})

-- ============================================================
-- Keymaps
-- ============================================================
vim.keymap.set('n', '<C-s>', ':write<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-p>', require('mini.pick').builtin.files)
vim.keymap.set({ 'n', 'i', 'v' }, '<C-S-F>', require('mini.pick').builtin.grep_live)
vim.keymap.set({ 'n', 'i', 'v' }, '<leader><Tab>', require('mini.pick').builtin.buffers)
vim.keymap.set({ 'n', 'i', 'v' }, '<C-S-I>', vim.lsp.buf.format)
vim.keymap.set({ 'n', 'i', 'v' }, '<leader>lf', vim.lsp.buf.format)
vim.keymap.set({ 'n', 'i', 'v' }, '<leader>ld', vim.diagnostic.open_float)
vim.keymap.set({ 'n', 'i', 'v' }, '<leader>sf', '<CMD>Oil<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<M-j>', '<CMD>bp<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<M-k>', '<CMD>bn<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<M-w>', '<CMD>bp|bd #<CR>')

vim.cmd.colorscheme('vague')
