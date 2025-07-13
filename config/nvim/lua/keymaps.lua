local M = {}

function ActionFormat()
    require("conform").format({
        lsp_fallback = true,
        async = false,
    })
end

function M.setup()
    local opts = { noremap = true, silent = true }
    -- Buffer
    vim.keymap.set({ "n", "v" }, "<M-j>", "<cmd>BufferLineCyclePrev<cr>", opts)
    vim.keymap.set({ "n", "v" }, "<M-k>", "<cmd>BufferLineCycleNext<cr>", opts)
    vim.keymap.set({ "n", "v" }, "<M-w>", "<cmd>bp|bd #<cr>", opts)
    vim.keymap.set({ "n", "i" }, "<C-s>", "<CMD>w<CR>", opts) -- Ctrl-s 保存当前文件
    vim.keymap.set({ "n", "v", "i", "t" }, "<M-cr>", "<cmd>ToggleTerm direction=float<cr>", opts) -- Alt+Enter 切换终端显示
    vim.keymap.set({ "n", "v" }, "<M-1>", "<CMD>Neotree toggle focus<CR>", opts) -- Alt-1 切换文件面板显示
    vim.keymap.set({ "n", "v" }, "<M-2>", "<CMD>AerialToggle<CR>", opts) -- Alt-2 切换大纲面板显示
    vim.keymap.set({ "n", "v" }, "<M-F>", ActionFormat, opts)
    vim.keymap.set({ "n" }, "<C-y>", "", opts)

    vim.keymap.set({ "n", "v", "i" }, "<C-p>", function()
        require("telescope.builtin").find_files({
            previewer = false,
            layout_strategy = "vertical",
            layout_config = {
                width = 0.5,
                height = 0.5,
            },
        })
    end, opts)
    vim.keymap.set({ "n", "v", "i" }, "<C-t>", require("telescope.builtin").tags, opts)
    vim.keymap.set({ "n", "v", "i" }, "<leader>tg", require("telescope.builtin").live_grep, opts)
    vim.keymap.set({ "n", "v", "i" }, "<leader>ts", require("telescope.builtin").grep_string, opts)
    vim.keymap.set({ "n", "v", "i" }, "<leader>tb", require("telescope.builtin").buffers, opts)
    vim.keymap.set({ "n", "v", "i" }, "<leader>tr", require("telescope.builtin").registers, opts)

    vim.keymap.set({ "n", "v", "i" }, "<leader>gd", "<CMD>Gitsigns diffthis<CR>", opts)
end

return M
