local M = {}

function M.load_modules(modules)
    for _, module in ipairs(modules) do
        local ok, err = pcall(require, module)
        if not ok then
            error("Error loading " .. module .. "\n\n" .. err)
        end
    end
end

-- options
function M.set_options(options)
    for key, value in pairs(options) do
        vim.opt[key] = value
    end
end

function M.enable_options(options)
    for _, option in ipairs(options) do
        vim.opt[option] = true
    end
end

function M.disable_options(options)
    for _, option in ipairs(options) do
        vim.opt[option] = false
    end
end

-- mappings
function M.set_mappings(mappings)
    for _, mapping in ipairs(mappings) do
        if (#mapping == 3) then
            vim.api.nvim_set_keymap(mapping[1], mapping[2], mapping[3], {noremap = true, silent = true})
        elseif (#mapping == 4) then
            vim.api.nvim_set_keymap(mapping[1], mapping[2], mapping[3], mapping[4])
        end
    end
end

return M
