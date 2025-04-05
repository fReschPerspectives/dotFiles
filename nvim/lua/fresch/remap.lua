vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Map vim explore funcitonality to be 'project view' instead." })

-- LSP mappings
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>gds", vim.lsp.buf.document_symbol)
vim.keymap.set("n", "<leader>gws", vim.lsp.buf.workspace_symbol)
vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run)
vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- metals hover worksheet
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

-- all workspace diagnostics
vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist)

-- all workspace errors
vim.keymap.set("n", "<leader>ae", function()
	vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.E })
end)

-- all workspace warnings
vim.keymap.set("n", "<leader>aw", function()
	vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.W })
end)

-- buffer diagnostics only
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist)

vim.keymap.set("n", "[c", function()
	vim.diagnostic.goto_prev({ wrap = false })
end)

vim.keymap.set("n", "]c", function()
	vim.diagnostic.goto_next({ wrap = false })
end)

-- Floaterm keybindings
vim.keymap.set("v", "<C-t><C-s>", ":ToggleTermSendVisualSelection<CR>", { silent = true, noremap = true })
vim.keymap.set("v", "<C-t><C-v>", ":ToggleTermSendVisualLines<CR>", { silent = true, noremap = true })
vim.keymap.set("v", "<C-t><C-l>", ":ToggleTermSendCurrentLine<CR>", { silent = true, noremap = true })

-- DAP Remaps
local dap_ok, dap = pcall(require, "dap")
local dap_ui_ok, ui = pcall(require, "dapui")

if not (dap_ok and dap_ui_ok) then
	require("notify")("nvim-dap or dap-ui not installed!", "warning") -- nvim-notify is a separate plugin, I recommend it too!
	return
end

vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

-- Start debugging session
vim.keymap.set("n", "<F5>", function()
	dap.continue()
	ui.toggle({})
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
end)

-- Set breakpoints, get variable values, step into/out of functions, etc.
vim.keymap.set("n", "<leader>dl", require("dap.ui.widgets").hover)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dn", dap.step_over)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>do", dap.step_out)
vim.keymap.set("n", "<leader>dC", function()
	dap.clear_breakpoints()
	require("notify")("Breakpoints cleared", "warn")
end)

vim.keymap.set("n", "<leader>dB", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
vim.keymap.set("n", "<leader>dlp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<leader>dro", function()
	require("dap").repl.open()
end)
vim.keymap.set("n", "<leader>drl", function()
	require("dap").run_last()
end)

-- Close debugger and clear breakpoints
vim.keymap.set("n", "<leader>de", function()
	dap.clear_breakpoints()
	ui.toggle({})
	dap.terminate()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
	require("notify")("Debugger session ended", "warn")
end)
