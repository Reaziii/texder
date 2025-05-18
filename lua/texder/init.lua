local M = {}

function M.setup(opts)
	require("texder.config").setup(opts)
	require("texder.commands").setup()
end

return M
