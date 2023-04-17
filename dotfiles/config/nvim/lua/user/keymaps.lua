local nest = require("nest")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

nest.applyKeymaps({
	{
		"<C-",
		{
			{ "h>", "<C-w>h" },
			{ "j>", "<C-w>j" },
			{ "k>", "<C-w>k" },
			{ "l>", "<C-w>l" },
		},
	},
	{
		"<S-",
		{
			{ "l>", ":bnext<cr>" },
			{ "h>", ":bprevious<cr>" },
		},
	},
	{
		"<leader>",
		{
			{ "e", ":NvimTreeToggle<cr>" },
			{ "u", ":UndotreeToggle<cr>" },
			{ "b", ":DapToggleBreakpoint<cr>" },
			{
				"t",
				{
					{ "p", ":Telescope projects<cr>" },
					{ "l", ":Telescope live_grep<cr>" },
					{ "m", ":Telescope man_pages<cr>" },
					{ "r", ":Telescope registers<cr>" },
					{ "o", ":Telescope vim_options<cr>" },
					{ "n", ":Telescope notify<cr>" },
					{
						"g",
						{
							{ "s", ":Telescope git_status<cr>" },
							{ "b", ":Telescope git_branches<cr>" },
							{ "c", ":Telescope git_commits<cr>" },
							{ "C", ":Telescope git_bcommits<cr>" },
						},
					},
				},
			},
		},
	},
	{ "<F3>",  ":DapStepInto<cr>" },
	{ "<F4>",  ":DapStepOver<cr>" },
	{ "<F5>",  ":DapContinue<cr>" },
	{ "<F6>",  require("dapui").toggle },
	{ "<esc>", ":noh<cr>" },
	{
		mode = "v",
		{
			{ "<",     "<gv" },
			{ ">",     ">gv" },
			{ "<S-j>", ":m '>+1<CR>gv=gv" },
			{ "<S-k>", ":m '<-2<CR>gv=gv" },
		},
	},
	{
		mode = "t",
		{
			{ "<S-Esc>", "<C-\\><C-n>" },
			{ "<C-h>",   "<C-\\><C-n><C-w>h" },
			{ "<C-j>",   "<C-\\><C-n><C-w>j" },
			{ "<C-k>",   "<C-\\><C-n><C-w>k" },
			{ "<C-l>",   "<C-\\><C-n><C-w>l" },
		},
	},
})
