require("fresch.remap")
require("fresch.packer")
require("lualine").setup()
print("A fResch hello to you!")

vim.g.python3_host_prog = "C:\\Users\\fresc\\.pyenv\\pyenv-win\\versions\\3.13.2\\python.exe"
vim.g.ruby_host_prog = "C:\\tools\\ruby34\\bin\\ruby.exe"
vim.g.loaded_perl_provider = 0

-- Need to have line numbers and reverse line numbers implemented
vim.wo.relativenumber = true
vim.wo.number = true

-- tell floaterm to open in split instead of floating window
vim.g.floaterm_wintype = "split"
vim.g.floaterm_height = 0.25

-- use the system clipboard
vim.opt.clipboard = "unnamed,unnamedplus"
