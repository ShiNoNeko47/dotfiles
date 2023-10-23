local configs = require("nvim-treesitter.configs")

require("nvim-treesitter.parsers").list.xml = {
	install_info = {
		url = "https://github.com/Trivernis/tree-sitter-xml",
		files = { "src/parser.c" },
		generate_requires_npm = true,
		branch = "main",
	},
	filetype = "xml",
}

configs.setup({
	ensure_installed = {
		"python",
		"rust",
		"cpp",
		"lua",
		"xml",
		"html",
		"css",
		"javascript",
	},
	sync_install = false,
	highlight = {
		anable = true,
	},
})
