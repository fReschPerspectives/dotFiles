local util = require("lspconfig.util")

return {
	default_config = {
		cmd = { "sql-language-server", "up", "--method", "stdio" },
		filetypes = { "sql", "mysql" },
		root_dir = util.root_pattern(".sqllsrc.json"),
		settings = {},
	},
	docs = {
		description = [[
https://github.com/joe-re/sql-language-server
    ]],
	},
}
