-- 注释分隔符左对齐而不是按行缩进
vim.g.NERDDefaultAlign = "left"

-- 在注释分隔符后添加空格
vim.g.NERDSpaceDelims = 1

vim.g.NERDCustomDelimiters = {
    python = {left = "#"}
}

-- 在Toggle时检查所有选择行
vim.g.NERDToggleCheckAllLines = 1
