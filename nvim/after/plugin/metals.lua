----------------------------------
-- LSP Setup ---------------------
----------------------------------
local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
	fallbackScalaVersion = "2.12.17",
	showImplicitArguments = true,
	statusBarProvider = true,
	excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

-- *READ THIS*
-- I *highly* recommend setting statusBarProvider to true, however if you do,
-- you *have* to have a setting to display this in your statusline or else
-- you'll not see any messages from metals. There is more info in the help
-- docs about this
-- metals_config.init_options.statusBarProvider = "on"

-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

metals_config.on_attach = function(client, bufnr)
	vim.keymap.set("v", "K", require("metals").type_of_range)

	vim.keymap.set("n", "<leader>ws", function()
		require("metals").hover_worksheet({ border = "single" })
	end)

	vim.keymap.set("n", "<leader>tt", require("metals.tvp").toggle_tree_view)

	vim.keymap.set("n", "<leader>tr", require("metals.tvp").reveal_in_tree)

	vim.keymap.set("n", "<leader>mmc", require("metals").commands)

	vim.keymap.set("n", "<leader>mts", function()
		require("metals").toggle_setting("showImplicitArguments")
	end)

	require("metals").setup_dap()
end

-- Autocmd that will actually be in charging of starting the whole thing
local api = vim.api
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
	-- NOTE: You may or may not want java included here. You will need it if you
	-- want basic Java support but it may also conflict if you are using
	-- something like nvim-jdtls which also works on a java filetype autocmd.
	pattern = { "scala", "sbt", "java" },
	callback = function()
		require("metals").initialize_or_attach({})
	end,
	group = nvim_metals_group,
})
