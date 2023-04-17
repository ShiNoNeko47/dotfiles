require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {}
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	["rust_analyzer"] = function()
		require("rust-tools").setup {}
	end
}

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

require("lfs")

local env = "/"
if lfs.attributes("./env", "mode") == "directory" then
	env = "./env"
end
lspconfig.pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				jedi = {
					environment = env,
				},
			},
		},
	},
})
