vim.g.python_host_skip_check = 1
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_skip_check = 1
vim.g.python3_host_prog = "/usr/bin/python3"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- for pkg, _ in pairs(package.loaded) do
--     if pkg:find("core.", 1, true) == 1
--         or pkg:find("plugins.", 1, true) == 1
--         or pkg:find("custom_", 1, true)
--         or pkg == "cheevim"
--     then
--         package.loaded[pkg] = nil
--     end
-- end

require("core.setup").load()

require("plugins").load()
require("plugins.cmp").load()

require("core.mappings").load()
require("core.after_plugins").load()

vim.cmd("command! SudoWrite :execute ':silent w !sudo tee % > /dev/null' | :edit!")
