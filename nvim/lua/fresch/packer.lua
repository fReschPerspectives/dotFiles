vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- needed by several of the other plugins
	use("nvim-lua/plenary.nvim")

	-- fuzzy finding tool
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- harpoon goodness for marked file navigation
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" } },
	})

	-- status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- rose-pine colorscheme
	use({
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	})

	-- Neotree
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	})

        use {"akinsho/toggleterm.nvim", tag = '*', config = function()
                require("toggleterm").setup()
        	end
	}

	-- treesitter for better color parsing and file awareness
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- undotree for error corrections on the whole tree of changes during a session
	use("mbbill/undotree")

	-- Git functionality from nvim
	use("tpope/vim-fugitive")

	-- Nifty delimiter switching
	use("tpope/vim-surround")

	-- lsp setup with mason, mason-lspconfig, and lspconfig for non metals language servers
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	use({ "scalameta/nvim-metals" })

	-- auto completion sources
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "<CurrentMajor>.*",
		-- install jsregexp (optional!).
		run = "make install_jsregexp",
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	-- formatting and linting
	--use({ "mhartington/formatter.nvim" })
	use({ "mfussenegger/nvim-lint" })
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})

	-- basic debugging
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })
end)
