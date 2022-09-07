require("user.options")
vim.cmd([[
  colorscheme Rena
]])
require("user.keymaps")
require("user.plugins")
require("user.cmp")
require("user.lsp")
require("user.nvim-tree")
require("user.lsp.null-ls")
require("user.toggleterm")
require("user.indentline")
require("user.telescope")
require("user.lualine")
require("user.project")
require("user.treesitter")
require("user.markdown-preview")
require("Comment").setup()
require("bufferline").setup{
	options = {
		show_close_icon = false,
		diagnostics = "nvim_lsp",
		always_show_bufferline = false,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true
			}
		},
	}
}
