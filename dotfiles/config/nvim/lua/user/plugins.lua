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
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

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
	use("hrsh7th/cmp-nvim-lsp") -- lsp completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("junegunn/vim-slash")
	use("jiangmiao/auto-pairs")

	use("tpope/vim-surround")
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use("tpope/vim-repeat")
	use("tpope/vim-eunuch")

	use("zivyangll/git-blame.vim")
	use("stevearc/vim-arduino")
	use({ "turbio/bracey.vim", run = "npm install --prefix server" })
	use("airblade/vim-gitgutter")
	use("kyazdani42/nvim-tree.lua")
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("akinsho/toggleterm.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("RRethy/nvim-align")
	use("nvim-telescope/telescope.nvim")
	use("ahmedkhalf/project.nvim")
	use("nvim-lualine/lualine.nvim")
	use("junegunn/gv.vim")
	use("aperezdc/vim-template")
	-- use("Konfekt/FastFold")
	-- use("matze/vim-tex-fold")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("arjunmahishi/run-code.nvim")
	use("plasticboy/vim-markdown")
	use("elzr/vim-json")
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("mg979/vim-visual-multi")
	use("numToStr/Comment.nvim")

	-- use("mfussenegger/nvim-dap")
	-- use("mfussenegger/nvim-dap-python")
	-- use("theHamsta/nvim-dap-virtual-text")
	-- use("nvim-telescope/telescope-dap.nvim")
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "asdfjklč" })
		end,
	})
	use({ "akinsho/bufferline.nvim", tag = "v2.*" })

	use({ "ThePrimeagen/vim-be-good" })
	use({
		"lervag/vimtex",
		opt = true,
		config = function()
			vim.g.vimtex_view_general_viewer = "zathura"
		end,
		ft = "tex",
	})
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
