return {
    -- {
    --     "nvim-neorg/neorg",
    --     lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    --     version = "*", -- Pin Neorg to the latest stable release
    --     config = true,
    -- },
    {
        "nvim-orgmode/orgmode",
        event = "VeryLazy",
        ft = { "org" },
        config = function()
            -- Setup orgmode
            require("orgmode").setup({
                org_agenda_files = "~/orgfiles/**/*",
                org_default_notes_file = "~/orgfiles/refile.org",
            })

            -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
            -- add ~org~ to ignore_install
            -- require('nvim-treesitter.configs').setup({
            --   ensure_installed = 'all',
            --   ignore_install = { 'org' },
            -- })
        end,
    },
    {
        "akinsho/org-bullets.nvim",
        opts = {
            concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
            symbols = {
                -- list symbol
                list = "•",
                -- headlines can be a list
                headlines = { "◉", "○", "✸", "✿" },
                checkboxes = {
                    half = { "", "@org.checkbox.halfchecked" },
                    done = { "✓", "@org.keyword.done" },
                    todo = { "˟", "@org.keyword.todo" },
                },
            },
        },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            heading = {
                icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
                position = "inline",
                width = "block",
                left_pad = 0,
                right_pad = 0,
                sign = false,
            },
            code = {
                sign = false,
            },
            pipe_table = { preset = "round" },
        },
    },
    {
        "bngarren/checkmate.nvim",
        ft = "markdown", -- Lazy loads for Markdown files matching patterns in 'files'
        opts = {
            keys = {
                ["<leader>mt"] = {
                    rhs = "<cmd>Checkmate toggle<CR>",
                    desc = "Toggle todo item",
                    modes = { "n", "v" },
                },
                ["<leader>mc"] = {
                    rhs = "<cmd>Checkmate check<CR>",
                    desc = "Set todo item as checked (done)",
                    modes = { "n", "v" },
                },
                ["<leader>mu"] = {
                    rhs = "<cmd>Checkmate uncheck<CR>",
                    desc = "Set todo item as unchecked (not done)",
                    modes = { "n", "v" },
                },
                ["<leader>mn"] = {
                    rhs = "<cmd>Checkmate create<CR>",
                    desc = "Create todo item",
                    modes = { "n", "v" },
                },
                ["<leader>mR"] = {
                    rhs = "<cmd>Checkmate remove_all_metadata<CR>",
                    desc = "Remove all metadata from a todo item",
                    modes = { "n", "v" },
                },
                ["<leader>ma"] = {
                    rhs = "<cmd>Checkmate archive<CR>",
                    desc = "Archive checked/completed todo items (move to bottom section)",
                    modes = { "n" },
                },
                ["<leader>mv"] = {
                    rhs = "<cmd>Checkmate metadata select_value<CR>",
                    desc = "Update the value of a metadata tag under the cursor",
                    modes = { "n" },
                },
                ["<leader>m]"] = {
                    rhs = "<cmd>Checkmate metadata jump_next<CR>",
                    desc = "Move cursor to next metadata tag",
                    modes = { "n" },
                },
                ["<leader>m["] = {
                    rhs = "<cmd>Checkmate metadata jump_previous<CR>",
                    desc = "Move cursor to previous metadata tag",
                    modes = { "n" },
                },
            },
        },
    },
}
