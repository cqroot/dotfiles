local utils = require("utils")

utils.load_modules({
	"plugins.modules.commenter",
	"plugins.modules.formatter",
	"plugins.modules.statusbar",
})

-- indent_blankline
require("indent_blankline").setup({
	char = "|",
	buftype_exclude = { "terminal" },
})

require("gitsigns").setup()

-- telescope
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = require("telescope.actions").close,
			},
		},
	},
})
