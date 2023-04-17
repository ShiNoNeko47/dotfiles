local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

-- Use a protected call so we don't error out on first use
local packer = require("packer")

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "" })
		end,
	},
})

return packer.startup(function(use)
	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lua") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp") -- lsp completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("jiangmiao/auto-pairs")

	use("tpope/vim-surround")
	use("tpope/vim-fugitive")
	-- use("tpope/vim-rhubarb")
	-- use("tpope/vim-repeat")
	use("tpope/vim-eunuch")
	-- use("tpope/vim-dispatch")

	use("zivyangll/git-blame.vim")
	use("airblade/vim-gitgutter")

	use("stevearc/vim-arduino")

	use({ "turbio/bracey.vim", run = "npm install --prefix server" })

	use("kyazdani42/nvim-tree.lua")
	use("akinsho/toggleterm.nvim")
	-- use("lukas-reineke/indent-blankline.nvim")
	use("RRethy/nvim-align")

	use({ "nvim-telescope/telescope.nvim", tag = "0.1.x" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("ahmedkhalf/project.nvim")

	use("nvim-lualine/lualine.nvim")
	use({ "akinsho/bufferline.nvim", tag = "v2.*" })
	-- use("junegunn/gv.vim")
	use("aperezdc/vim-template")
	-- use("Konfekt/FastFold")
	-- use("matze/vim-tex-fold")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/playground")
	-- use("arjunmahishi/run-code.nvim")
	use("plasticboy/vim-markdown")
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("elzr/vim-json")
	-- use("mg979/vim-visual-multi")
	use("numToStr/Comment.nvim")

	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	-- use({
	-- 	"phaazon/hop.nvim",
	-- 	branch = "v2", -- optional but strongly recommended
	-- 	config = function()
	-- 		-- you can configure Hop the way you like here; see :h hop-config
	-- 		require("hop").setup({ keys = "asdfjkl;" })
	-- 	end,
	-- })

	use({ "ThePrimeagen/vim-be-good" })
	use({
		"lervag/vimtex",
		opt = true,
		config = function()
			vim.g.vimtex_view_general_viewer = "zathura"
		end,
		ft = "tex",
	})
	use("lewis6991/impatient.nvim")
	use("mbbill/undotree")

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	use("folke/twilight.nvim")
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				icons = false,
			})
		end,
	})

	use("LionC/nest.nvim")

	use({
		"saecki/crates.nvim",
		tag = "v0.3.0",
		-- config = function()
		-- 	require("crates").setup()
		-- end,
	})
	use("nacro90/numb.nvim")
	use("rcarriga/nvim-notify")
	use({
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				cmdline = { enabled = false },
				messages = { enabled = false },
				popupmenu = { enabled = false },
			})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})
	use({
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup({
				fill_char = "-",
			})
		end,
	})
	use("simrat39/rust-tools.nvim")
	use("Shirk/vim-gas")
	use("vimwiki/vimwiki")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
