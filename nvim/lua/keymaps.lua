local M = {}

function ActionFormat()
    require("conform").format({
        lsp_fallback = true,
        async = false,
    })
end

function ActionLspOpenDiagnostic()
    vim.diagnostic.open_float({ scope = "line", border = "rounded" })
end

function ActionLspFormat()
    vim.lsp.buf.format({ async = true })
end

function M.setup()
    local opts = { noremap = true, silent = true }
    -- Buffer
    vim.keymap.set({ "n", "v" }, "<M-j>", "<cmd>BufferLineCyclePrev<cr>", opts)
    vim.keymap.set({ "n", "v" }, "<M-k>", "<cmd>BufferLineCycleNext<cr>", opts)
    vim.keymap.set({ "n", "v" }, "J", "<cmd>BufferLineCyclePrev<cr>", opts)
    vim.keymap.set({ "n", "v" }, "K", "<cmd>BufferLineCycleNext<cr>", opts)
    vim.keymap.set({ "n", "v" }, "<M-w>", "<cmd>bp|bd #<cr>", opts)
    vim.keymap.set({ "n", "i" }, "<C-s>", "<CMD>w<CR>", opts)                                     -- Ctrl-s 保存当前文件
    vim.keymap.set({ "n", "v", "i", "t" }, "<M-cr>", "<cmd>ToggleTerm direction=float<cr>", opts) -- Alt+Enter 切换终端显示
    vim.keymap.set({ "n", "v" }, "<M-1>", "<CMD>Neotree toggle focus<CR>", opts)                  -- Alt-1 切换文件面板显示
    vim.keymap.set({ "n", "v" }, "<M-2>", "<CMD>AerialToggle<CR>", opts)                          -- Alt-2 切换大纲面板显示
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

    require("which-key").add({
        { mode = { "n", "v", "i" }, "<M-a>",      "<C-o>",                                  desc = "Jump back" },
        { mode = { "n", "v", "i" }, "<M-d>",      "<C-i>",                                  desc = "Jump forward" },
        { mode = { "n", "v" },      "<leader>tg", require("telescope.builtin").live_grep,   desc = "Telescope live_grep" },
        { mode = { "n", "v" },      "<leader>ts", require("telescope.builtin").grep_string, desc = "Telescope grep_string" },
        { mode = { "n", "v" },      "<leader>tb", require("telescope.builtin").buffers,     desc = "Telescope buffers" },
        { mode = { "n", "v" },      "<leader>tr", require("telescope.builtin").registers,   desc = "Telescope registers" },
        { mode = { "n", "v" },      "<leader>gd", "<CMD>Gitsigns diffthis<CR>",             desc = "Gitsigns diffthis" },
        { mode = { "n", "v" },      "<leader>lr", vim.lsp.buf.rename,                       desc = "LSP rename" },
        { mode = "n",               "gD",         vim.lsp.buf.declaration,                  desc = "LSP declaration" },
        { mode = "n",               "gd",         vim.lsp.buf.definition,                   desc = "LSP definition" },
        { mode = "n",               "H",          vim.lsp.buf.hover,                        desc = "LSP hover" },
        { mode = "n",               "gi",         vim.lsp.buf.implementation,               desc = "LSP inplementation" },
        { mode = "n",               "<C-k>",      vim.lsp.buf.signature_help,               desc = "LSP signature_help" },
        { mode = "n",               "<leader>wa", vim.lsp.buf.add_workspace_folder,         desc = "LSP add_workspace_folder" },
        { mode = "n",               "<leader>wr", vim.lsp.buf.remove_workspace_folder,      desc = "LSP remove_workspace_folder" },
        { mode = "n",               "<leader>D",  vim.lsp.buf.type_definition,              desc = "LSP type_definition" },
        { mode = "n",               "<leader>lr", vim.lsp.buf.rename,                       desc = "LSP rename" },
        { mode = { "n", "v" },      "<leader>ca", vim.lsp.buf.code_action,                  desc = "LSP code_action" },
        { mode = "n",               "gr",         vim.lsp.buf.references,                   desc = "LSP references" },
        { mode = "n",               "<leader>le", ActionLspOpenDiagnostic,                  desc = "LSP show diagnostics" },
        { mode = "n",               "<space>f",   ActionLspFormat,                          desc = "LSP format" },
    })
end

return M
