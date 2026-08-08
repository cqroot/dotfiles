-- ============================================================
-- 1. Options
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
-- 2. Packages
-- ============================================================
vim.pack.add({
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/saghen/blink.lib' },
    { src = 'https://github.com/saghen/blink.cmp' },
    { src = 'https://github.com/rafamadriz/friendly-snippets' },
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/numToStr/Comment.nvim' },
    { src = 'https://github.com/vague-theme/vague.nvim' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/akinsho/bufferline.nvim' },
    { src = 'https://github.com/stevearc/aerial.nvim' },
    { src = 'https://github.com/stevearc/conform.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope.nvim' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
})
require('lualine').setup({
    options = { section_separators = '', component_separators = '' }
})
require('bufferline').setup({
    options = {
        show_close_icon = false,
        show_buffer_close_icons = false,
        separator_style = 'thick',
    }
})
require('aerial').setup()

-- ============================================================
-- 3. LSPs
-- ============================================================
vim.lsp.enable({ 'bashls', 'gopls', 'lua_ls' })
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true) }
        }
    }
})

require('conform').setup({
    formatters_by_ft = {
        markdown = { 'prettier' },
    },
})

-- ============================================================
-- 4. Completion
-- ============================================================
local cmp = require('blink.cmp')
cmp.setup({
    keymap = {
        preset = 'super-tab'
    },
})

-- ============================================================
-- 5. Telescope
-- ============================================================
require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<ESC>'] = require('telescope.actions').close,
            },
            n = {
                ['<ESC>'] = require('telescope.actions').close,
            },
        },
    },
})

-- ============================================================
-- 6. Comment
-- ============================================================
require('Comment').setup({
    toggler = {
        line = '<C-_>',
        block = 'gbc',
    },
    opleader = {
        line = '<C-_>',
        block = 'gb',
    },
})

-- ============================================================
-- 7. File Explorer
-- ============================================================
require('oil').setup({
    keymaps = {
        ['<Backspace>'] = 'actions.parent',
        ['-'] = 'actions.parent',
    },
})

-- ============================================================
-- 8. Git
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
-- 9. Keymaps
-- ============================================================
vim.keymap.set('n', '<C-s>', ':write<CR>')

vim.keymap.set({ "n", "i", "v" }, '<C-S-I>', function()
    require("conform").format({
        lsp_fallback = true,
        async = false,
    })
end)
vim.keymap.set({ 'n', 'i', 'v' }, '<leader>lf', vim.lsp.buf.format)
vim.keymap.set({ 'n', 'i', 'v' }, '<leader>ld', vim.diagnostic.open_float)
vim.keymap.set({ 'n', 'i', 'v' }, '<leader>sf', '<CMD>Oil<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<M-j>', '<CMD>bp<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<M-k>', '<CMD>bn<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<M-w>', '<CMD>bp|bd #<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<M-2>', '<CMD>AerialToggle!<CR>')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>ft', builtin.tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-S-f>', builtin.live_grep, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-t>', builtin.tags, { desc = 'Telescope find files' })

vim.cmd.colorscheme('vague')
