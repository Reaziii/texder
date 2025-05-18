local M = {
	options = {
		name = "Neovim User",
	},
}

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

function M.get()
	return M.options
end

return M
