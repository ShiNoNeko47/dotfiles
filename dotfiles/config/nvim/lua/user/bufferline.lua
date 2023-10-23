local bufferline = require("bufferline")

bufferline.setup({
	options = {
		show_close_icon = false,
		show_buffer_close_icon = false,
		diagnostics = "nvim_lsp",
		always_show_bufferline = false,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
	},
})
