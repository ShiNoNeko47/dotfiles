vim.cmd [[highlight IndentBlanklineChar ctermfg=238]]

vim.opt.list = true
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
}

require("indent_blankline").setup {
    space_char_blankline = " ",
}
