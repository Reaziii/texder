local M = {}
function M.string_to_line(output)
	local lines = {}

	for line in output:gmatch("[^\r\n]+") do
		table.insert(lines, line)
	end

	return lines
end

return M
