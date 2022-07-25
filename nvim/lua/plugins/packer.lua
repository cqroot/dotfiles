vim.cmd([[packadd packer.nvim]])

vim.api.nvim_exec(
	[[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]],
	true
)

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- Colorscheme ----------------------------------------
	use({ "dracula/vim", as = "dracula" })
	use({ "navarasu/onedark.nvim" })
	use({ "arcticicestudio/nord-vim" })

	-- Common dependencies --------------------------------
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "nvim-lua/plenary.nvim" })

	-- Sidebar --------------------------------------------
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "simrat39/symbols-outline.nvim" })

	-- Appearance -----------------------------------------
	use({ "hoob3rt/lualine.nvim" })
	use({ "akinsho/bufferline.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "inside/vim-search-pulse" })
	use({ "lilydjwg/colorizer" })

	-- Language -------------------------------------------
	use({ "sbdchd/neoformat" })
	use({ "preservim/nerdcommenter" })

	-- Completion -----------------------------------------
	use({ "neoclide/coc.nvim", branch = "release" })
	use({ "honza/vim-snippets" })

	-- Git ------------------------------------------------
	use({ "lewis6991/gitsigns.nvim" })

	-- Telescope ------------------------------------------
	use({ "nvim-telescope/telescope.nvim" })

	-- Markdown -------------------------------------------
	use({ "godlygeek/tabular" })
	use({ "plasticboy/vim-markdown" })
end)
