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
        opts = {},
    },
}
