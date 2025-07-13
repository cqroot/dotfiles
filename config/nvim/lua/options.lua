local M = {}

function M.setup()
    -- **设置** 鼠标支持
    --   n Normal mode
    --   v Visual mode
    --   i Insert mode
    --   c Command-line mode
    --   h all previous modes when editing a help file
    --   a all previous modes
    --   r for hit-enter and more-prompt prompt
    vim.opt.mouse = "a"

    -- **启用** 搜索时忽略大小写
    vim.opt.ignorecase = true
    -- **启用** 通配符补全忽略大小写
    vim.opt.wildignorecase = true
    -- **设置** 特定语法元素的隐藏级别
    vim.opt.conceallevel = 0
    -- **启用** 显示不可见字符
    vim.opt.list = true
    -- **设置** 不可见字符的显示样式
    vim.opt.listchars = {
        -- space = "·",
        -- tab = "» ",
        tab = "│ ",
        trail = "·",
        nbsp = "·",
        -- eol = "↴",
    }

    -- **控制** 自动补全（如 <C-n>）的行为和界面
    --  - menu：显示补全菜单（默认启用）。
    --  - menuone：即使只有一个匹配项也显示菜单。
    --  - noinsert：不自动插入选中项，需手动确认。
    --  - noselect：不自动选择第一个项。
    --  - preview：显示函数签名等预览信息。
    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    -- **设置**文件换行符的自动检测与转换（Unix: LF，DOS: CRLF）
    vim.opt.fileformats = { "unix", "dos" }
    -- **禁用** 文件末尾自动添加换行符
    vim.opt.fixendofline = false
    -- **启用** 24 位真彩色支持，允许 Neovim 使用更丰富的颜色（超过终端默认的 256 色）
    vim.opt.termguicolors = true

    -- ****************************************************************************
    -- *                                                                          *
    -- * 备份                                                                     *
    -- *                                                                          *
    -- ****************************************************************************
    -- **禁用** 长期保留备份文件
    vim.opt.backup = false
    -- **禁用** 临时备份（写入时防丢失）
    vim.opt.writebackup = false
    -- **禁用** 编辑时崩溃恢复
    vim.opt.swapfile = false

    -- ****************************************************************************
    -- *                                                                          *
    -- * 缩进                                                                     *
    -- *                                                                          *
    -- ****************************************************************************
    -- **启用** 自动继承上一行的缩进
    vim.opt.autoindent = true
    -- **启用** 在 autoindent 基础上，根据语法规则（如 C 语言的花括号）调整缩进
    vim.opt.smartindent = true
    -- **禁用** 智能处理 <Tab> 键行为
    --   - 行首：按 shiftwidth 插入缩进（空格或制表符）
    --   - 非行首：按 softtabstop 或 tabstop 处理
    vim.opt.smarttab = false
    -- **设置** 制表符（\t）的显示宽度（单位：空格）
    vim.opt.tabstop = 4
    -- **设置** 插入模式下按 <Tab> 键插入的空格数或制表符+空格组合
    vim.opt.softtabstop = 4
    -- **设置** 自动缩进或 <</>> 命令的缩进量
    vim.opt.shiftwidth = 4
    -- **设置** Tab 转换为空格
    vim.opt.expandtab = true

    -- ****************************************************************************
    -- *                                                                          *
    -- * 行列                                                                     *
    -- *                                                                          *
    -- ****************************************************************************
    vim.opt.number = true
    vim.opt.relativenumber = true
    -- **启用** 高亮光标当前所在行，帮助快速定位光标位置
    vim.opt.cursorline = true
    -- **启用** 高亮光标当前所在列，辅助对齐代码或数据（如表格、多行注释）
    vim.opt.cursorcolumn = true
    -- **设置** 指定列显示垂直参考线，常用于提示行宽限制
    vim.opt.colorcolumn = { 80, 120 }
end

return M
