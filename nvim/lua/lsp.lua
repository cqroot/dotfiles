local M = {}

function M.setup()
    vim.lsp.enable("bashls")
    vim.lsp.enable("clangd")
    vim.lsp.enable("dartls")
    vim.lsp.enable("gopls")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("neocmake")
    vim.lsp.enable("pyright")
end

return M
