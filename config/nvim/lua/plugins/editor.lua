return {
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
                lua = { "stylua" },
                markdown = { "prettier" },
            },
        },
    },
    {
        "code-biscuits/nvim-biscuits",
        dependencies = "nvim-treesitter/nvim-treesitter", -- if you prefer nvim-web-devicons
        opts = {
            default_config = {
                max_length = 32,
                min_distance = 5,
                -- prefix_string = " 📎 ",
                -- prefix_string = " 󰆘 ",
                -- prefix_string = " 󰘍 ",
                prefix_string = " » ",
            },
            language_config = {
                html = {
                    prefix_string = " 🌐 ",
                },
                javascript = {
                    prefix_string = " ✨ ",
                    max_length = 80,
                },
                markdown = {
                    disabled = true,
                },
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
