return {
    {
        'echasnovski/mini.hipatterns',
        version = false,
        opts = function()
            local hipatterns = require('mini.hipatterns')
            return {
                highlighters = {
                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            }
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 500,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
        },
    },
    {
        "numToStr/Comment.nvim",
        opts = {
            toggler = {
                line = "<C-_>",
                block = "gbc",
            },
            opleader = {
                line = "<C-_>",
                block = "gb",
            },
        },
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                bash = { "shfmt" },
                go = { "gofumpt" },
                lua = { "stylua" },
                markdown = { "prettier" },
            },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            preset = "classic",
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
}
