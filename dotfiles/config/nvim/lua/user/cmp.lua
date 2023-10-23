local cmp = require("cmp")

local luasnip = require("luasnip")

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-l>"] = cmp.mapping(function()
			if luasnip.expand_or_jumpable then
				luasnip.expand_or_jump()
			end
		end),
		["<C-h>"] = cmp.mapping(function()
			if luasnip.jumpable then
				luasnip.jump(-1)
			end
		end),

		["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
				-- elseif luasnip.expand_or_jumpable() then
				-- 	luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	formatting = {
		-- fields = { "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.menu = ({
				crates = "[crates]",
				nvim_lua = "[api]",
				luasnip = "[snippet]",
				nvim_lsp = "[lsp]",
				path = "[path]",
				buffer = "[buffer]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "crates" },
		{ name = "nvim_lua" },
		{ name = "codeium" },
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	preselect = cmp.PreselectMode.None,
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})

cmp.setup.cmdline(":", {
	sources = { { name = "cmdline" } },
	mapping = cmp.mapping.preset.cmdline({
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item()),
		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item()),
	}),
})
