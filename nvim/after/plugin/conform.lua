require("conform").setup({
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 60000,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua", async = true, lsp_format = "fallback" },
		-- Conform will run multiple formatters sequentially
		python = { "ruff", "black", async = true, lsp_format = "fallback", stop_after_first = false },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", async = true, lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", async = true, lsp_format = "fallback", stop_after_first = true },
		scala = { "scalafmt", async = true, lsp_format = "fallback" },
		sbt = { "scalafmt", async = true, lsp_format = "fallback" },
	},
})

--vim.api.nvim_create_autocmd("BufWritePre", {
--	pattern = "*",
--	callback = function(args)
--		require("conform").format({ bufnr = args.buf })
--	end,
--})
--
