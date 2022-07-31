local utils = require("utils")

vim.cmd("let mapleader = ' '")

utils.set_mappings({
	-- Buffer mapping
	{ "n", "<leader>d", ":bp|bd #<CR>" },
	{ "n", "J", ":bp!<CR>" },
	{ "n", "K", ":bn!<CR>" },
	-- Emacs mapping
	{ "c", "<C-a>", "<Home>" },
	{ "c", "<C-e>", "<End>" },
	{ "c", "<C-b>", "<Left>" },
	{ "c", "<C-f>", "<Right>" },
	{ "c", "<M-b>", "<S-Left>" },
	{ "c", "<M-f>", "<S-Right>" },
	{ "i", "<C-a>", "<Home>" },
	{ "i", "<C-e>", "<End>" },
	{ "i", "<C-p>", "<Up>" },
	{ "i", "<C-n>", "<Down>" },
	{ "i", "<C-b>", "<Left>" },
	{ "i", "<C-f>", "<Right>" },
	{ "i", "<M-b>", "<S-Left>" },
	{ "i", "<M-f>", "<S-Right>" },

	-- Commenter
	{ "n", "<C-c>", "<Plug>NERDCommenterToggle", {} },
	{ "x", "<C-c>", "<Plug>NERDCommenterToggle", {} },
	{ "i", "<C-c>", "<Plug>NERDCommenterToggle", {} },
	{ "n", "<C-_>", "<Plug>NERDCommenterToggle", {} },
	{ "x", "<C-_>", "<Plug>NERDCommenterToggle", {} },
	{ "i", "<C-_>", "<Plug>NERDCommenterToggle", {} },

	-- Sidebar
	{ "n", "<M-f>", ":CocCommand explorer<CR>" },
	{ "n", "<M-w>", ":Vista!!<CR>" },

	-- Telescope
	{ "n", "<M-p>", "<cmd>Telescope find_files<cr>" },
	{ "n", "<M-g>", "<cmd>Telescope live_grep<cr>" },

	-- Neoformat
	{ "n", "<C-M-l>", ":Neoformat<CR>" },

	-- Coc
	{ "n", "<C-p>", ":CocCommand<CR>" },
})
