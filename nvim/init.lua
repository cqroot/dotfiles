-- ============================================================
-- 1. Options
-- ============================================================
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.wrap = false
vim.opt.winborder = "rounded"

vim.opt.ignorecase = true
vim.opt.wildignorecase = true
vim.opt.list = true
vim.opt.listchars = {
	space = "·",
	tab = "│ ",
	trail = "·",
	nbsp = "·",
}
vim.opt.fileformats = { "unix", "dos" }
vim.opt.termguicolors = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.g.mapleader = ";"

-- ============================================================
-- 2. Packages
-- ============================================================
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "vague-theme/vague.nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.enable({ "bashls", "gopls", "kdl-lsp", "lua_ls", "pyright" })
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})
		end,
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"saghen/blink.lib",
			"rafamadriz/friendly-snippets",
		},
		opts = {
			fuzzy = { implementation = "lua" },
			keymap = {
				preset = "super-tab",
			},
		},
	},
	{
		"nvim-mini/mini.comment",
		version = "*",
		opts = {
			mappings = {
				comment = "<C-_>",
				comment_line = "<C-_>",
				comment_visual = "<C-_>",
				textobject = "<C-_>",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "▐" },
				change = { text = "▐" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "▐" },
				change = { text = "▐" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			current_line_blame = true,
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = { section_separators = "", component_separators = "" },
		},
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				offsets = { { filetype = "neo-tree", text = " ", padding = 0 } },
				show_close_icon = false,
				show_buffer_close_icons = false,
				separator_style = "thick",
			},
		},
	},
	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			lsp_fallback = "fallback",
			formatters_by_ft = {
				kdl = { "kdlfmt" },
				lua = { "stylua" },
				markdown = { "prettier" },
				python = { "black" },
				sh = { "shfmt" },
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = function()
			-- 在函数内部 require，此时插件已加载
			local actions = require("telescope.actions")

			return {
				defaults = {
					mappings = {
						i = {
							["<ESC>"] = actions.close,
						},
						n = {
							["<ESC>"] = actions.close,
						},
					},
				},
			}
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		opts = {
			close_if_last_window = true,
			window = {
				width = 30,
				mappings = {
					["h"] = "toggle_node",
					["l"] = "open",
					["<space>"] = {
						"toggle_node",
						nowait = false,
					},
					["<2-LeftMouse>"] = "open",
					["<cr>"] = "open",
					["<esc>"] = "revert_preview",
					["P"] = { "toggle_preview", config = { use_float = true } },
					["S"] = "open_split",
					["s"] = "open_vsplit",
					["t"] = "open_tabnew",
					["w"] = "open_with_window_picker",
					["C"] = "close_node",
					["z"] = "close_all_nodes",
					["Z"] = "expand_all_nodes",
					["a"] = {
						"add",
						config = {
							show_path = "none",
						},
					},
					["A"] = "add_directory",
					["d"] = "delete",
					["r"] = "rename",
					["y"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
					["p"] = "paste_from_clipboard",
					["c"] = "copy",
					["m"] = "move",
					["q"] = "close_window",
					["R"] = "refresh",
					["?"] = "show_help",
					["<"] = "prev_source",
					[">"] = "next_source",
				},
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
			},
		},
	},
	{
		"keaising/im-select.nvim",
		config = function()
			require("im_select").setup({})
		end,
	},
})

-- ============================================================
-- 3. Keymaps
-- ============================================================
vim.keymap.set("n", "<C-s>", ":write<CR>")

vim.keymap.set({ "n", "i", "v" }, "<C-S-I>", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
	})
end)
vim.keymap.set({ "n", "i", "v" }, "<leader>lf", vim.lsp.buf.format)
vim.keymap.set({ "n", "i", "v" }, "<leader>ld", vim.diagnostic.open_float)
vim.keymap.set({ "n", "i", "v" }, "<M-j>", "<CMD>bp<CR>")
vim.keymap.set({ "n", "i", "v" }, "<M-k>", "<CMD>bn<CR>")
vim.keymap.set({ "n", "i", "v" }, "<M-w>", "<CMD>bp|bd #<CR>")
vim.keymap.set({ "n", "i", "v" }, "<M-1>", "<CMD>Neotree toggle focus<CR>")
vim.keymap.set({ "n", "i", "v" }, "<M-2>", "<CMD>AerialToggle!<CR>")
local builtin = require("telescope.builtin")
vim.keymap.set({ "n", "i", "v" }, "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set({ "n", "i", "v" }, "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set({ "n", "i", "v" }, "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set({ "n", "i", "v" }, "<leader>ft", builtin.tags, { desc = "Telescope help tags" })
vim.keymap.set({ "n", "i", "v" }, "<C-p>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set({ "n", "i", "v" }, "<C-S-f>", builtin.live_grep, { desc = "Telescope find files" })
vim.keymap.set({ "n", "i", "v" }, "<C-t>", builtin.tags, { desc = "Telescope find files" })

vim.cmd.colorscheme("vague")

-- vim: set filetype=lua :
