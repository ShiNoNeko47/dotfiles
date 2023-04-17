local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = "all",
	sync_install = false,
	highlight = {
		anable = true,
	},
})
