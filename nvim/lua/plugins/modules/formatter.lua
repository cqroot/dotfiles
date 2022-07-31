vim.api.nvim_exec(
	[[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]],
	true
)

-- C
vim.g.neoformat_enabled_c = { "uncrustify" }

-- Go
vim.g.neoformat_enabled_go = { "gofmt" }

-- JavaScript
vim.g.neoformat_javascript_prettier = {
	exe = "./node_modules/.bin/prettier",
	args = { "--write", "--config .prettierrc" },
	replace = 1,
}
vim.g.neoformat_enabled_javascript = { "prettier" }

-- Markdown
vim.g.neoformat_enabled_markdown = { "prettier" }

-- Vue
vim.g.neoformat_vue_prettier = {
	exe = "./node_modules/.bin/prettier",
	args = { "--write", "--config .prettierrc" },
	replace = 1,
}
vim.g.neoformat_enabled_vue = { "prettier" }

-- Python
vim.g.neoformat_python_black = {
	exe = "black",
	stdin = 1,
	args = { "-l 79", "-q", "-" },
}
vim.g.neoformat_enabled_python = { "black" }
