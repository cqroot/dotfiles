local M = {}

function M.load()
    -- "onedark" "zenbones" "ayu-mirage" "vscode"
    pcall(vim.cmd, "colorscheme onedark")
end

return M
