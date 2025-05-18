local config = require("texder.config")
local core = require("texder.core")

local M = {}

function M.setup()
	vim.api.nvim_create_user_command("Greet", function()
		local name = config.get().name
		core.greet(name)
	end, {})
	vim.api.nvim_create_user_command("FSearch", function()
		core.search()
	end, {})
end

return M
