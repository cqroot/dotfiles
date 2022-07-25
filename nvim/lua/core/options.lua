local utils = require("utils")

utils.enable_options({
	"number",
	-- "relativenumber",
	"showmatch",
	"hlsearch",
	"incsearch",
	"ignorecase",
	"autoread",
	"wrap",
	"expandtab",
	"smarttab",
	"smartindent",
	"autoindent",
	"ruler",
	"showmode",
	"showcmd",
	"list",
	"cursorline",
	"termguicolors",
})

utils.disable_options({
	"compatible",
	"autochdir",
	"backup",
	"swapfile",
	"writebackup",
	"undofile",
	"errorbells",
	"visualbell",
})

utils.set_options({
	mouse = "",
	scrolloff = 3,
	background = "dark",
	encoding = "utf-8",
	fileformats = "unix,dos",
	concealcursor = "nvic",
	concealcursor = "",
	conceallevel = 0,
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	listchars = {
		tab = "»·",
		trail = "·",
		nbsp = "·",
		eol = "↴",
	},
	backspace = "indent,eol,start",
	completeopt = { "menuone", "noselect" },
	foldmethod = "syntax",
	foldlevelstart = 99,
})
