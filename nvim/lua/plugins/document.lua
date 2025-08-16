return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
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
        'brianhuster/live-preview.nvim',
    }
}
