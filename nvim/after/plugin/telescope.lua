local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find project files" })
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Telescope find git files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<C-f>", function() 
	builtin.grep_string({ search = vim.fn.input( "Grep > " ) });
end )
