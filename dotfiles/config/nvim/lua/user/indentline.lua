vim.cmd([[highlight IndentBlanklineContextChar guifg=#880000]])

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

require("indent_blankline").setup({
	char = " ",
	-- context_char = "┃",
	context_char = "│",
	context_char_blankline = "┆",
	char_blankline = " ",
	space_char_blankline = " ",
	show_current_context = true,
	use_treesitter = true,
	use_treesitter_scope = true,
	viewport_buffer = 1000,
})
