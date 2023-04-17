local luasnip = require("luasnip")

luasnip.setup({
	history = true,
	update_events = "TextChanged,TextChangedI",
	delete_check_events = "TextChanged",
	region_check_events = "InsertEnter",
})
