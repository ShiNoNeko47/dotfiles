local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.latexindent,
		null_ls.builtins.formatting.xmlformat,
	},
})
