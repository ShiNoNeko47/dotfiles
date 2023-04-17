-- local function format()
-- 	vim.lsp.buf.format({
-- 		bufnr = bufnr,
-- 		filter = function(client)
-- 			return client.name == "null-ls"
-- 		end,
-- 	})
-- end

local nest = require("nest")

nest.applyKeymaps({
	{
		buffer = true,
		{
			{
				"g",
				{
					{ "D", vim.lsp.buf.declaration },
					{ "d", vim.lsp.buf.definition },
					{ "i", vim.lsp.buf.implementation },
					{ "r", vim.lsp.buf.references },
				},
			},
			{
				"<leader>",
				{
					{ "ca", vim.lsp.buf.code_action },
					{ "q",  vim.diagnostic.setloclist },
					{ "d",  vim.diagnostic.open_float },
					{ "f",  vim.lsp.buf.format },
				},
			},
			{ "[d", vim.diagnostic.goto_next },
			{ "]d", vim.diagnostic.goto_prev },
		},
	},
})

vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	buffer = bufnr,
	callback = function()
		vim.lsp.buf.format()
	end,
})
