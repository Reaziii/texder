local json = require("lib.json_parser")
local _string = require("lib.utils")
local M = {}
function M.parser(pattern, filename)
	local command
	if not filename then
		command = "rg " .. pattern .. " " .. vim.fn.getcwd() .. " --json"
	else
		command = "rg " .. pattern .. " " .. filename .. " --json"
	end
	local handle = io.popen(command, "r")
	if handle == nil then
		return {}
	end
	local output = handle:read("*a")
	if not output then
		return {}
	end
	local outputs = _string.string_to_line(output)
	local ret = {}
	for _, line in ipairs(outputs) do
		local parsed = json.parse(line)
		if not parsed then
			vim.notify("Parser not found", vim.log.levels.ERROR)
		end
		if parsed and parsed.type == "match" then
			for _, matches in ipairs(parsed.data.submatches) do
				table.insert(ret, {
					parsed.data.path.text,
					parsed.data.lines.text,
					parsed.data.line_number,
					matches["start"],
					matches["end"],
				})
			end
		end
	end
	return ret
end

return M
