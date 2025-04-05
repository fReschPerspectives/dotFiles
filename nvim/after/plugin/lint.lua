require("lint").linters_by_ft = {
	json = { "jsonlint" },
	lua = { "luacheck" },
	markdown = { "vale" },
	python = { "ruff" },
	sql = { "sqlfluff" },
	javascript = { "standardjs" },
	typescript = { "ts-standard" },
}
