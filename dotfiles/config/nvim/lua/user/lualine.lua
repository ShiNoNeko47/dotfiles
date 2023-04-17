local lualine = require("lualine")

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	colored = true,
	update_in_insert = true,
	always_visible = false,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local colors = {
	insert = "#5d73f7",
	visual = "#d75fff",
	black = "#080808",
	white = "#c6c6c6",
	red = "#dd0000",
	orange = "#d75628",
	grey = "#303030",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.orange },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.black, bg = colors.black },
	},

	insert = { a = { fg = colors.black, bg = colors.insert } },
	visual = { a = { fg = colors.black, bg = colors.visual } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.black, bg = colors.black },
	},
}

lualine.setup({
	options = {
		theme = bubbles_theme,
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
		component_separators = "|",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename", branch },
		lualine_c = { diagnostics },
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})
