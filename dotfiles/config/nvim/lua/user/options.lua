vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
-- vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 2
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = ""
vim.opt.mousescroll = "ver:0,hor:0"
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.timeoutlen = 1000
-- vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.shortmess:append("c")
vim.opt.gd = true
vim.opt.iskeyword:append({ "-" })
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 5
vim.cmd([[autocmd FileType cpp setlocal makeprg=g++\ %\ \-g\ \-Wall]])
vim.cmd([[autocmd QuitPre * :NvimTreeClose]])
vim.notify = require("notify")

vim.api.nvim_set_var("undotree_WindowLayout", 2)
vim.api.nvim_set_var("undotree_SetFocusWhenToggle", 1)
vim.api.nvim_set_var("undotree_ShortIndicators", 1)
vim.api.nvim_set_var("undotree_SplitWidth", 30)
vim.api.nvim_set_var("undotree_HighlightChangedText", 0)
vim.api.nvim_set_var("undotree_HelpLine", 0)
