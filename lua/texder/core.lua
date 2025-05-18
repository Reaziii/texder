local M = {}

function M.greet(name)
	print("Hi " .. name .. "!👋")
end

function M.search()
	vim.ui.input({ prompt = "Text you want to search" }, function(input)
		if not input or string.len(input) == 0 then
			vim.notify("No search input found!", vim.log.levels.ERROR)
			return
		end
		local parser = require("lib.ripgrep_parser")
		local result = parser.parser(input)
		for _, item in result do
			vim.notify(item[0])
		end
	end)
end

return M
