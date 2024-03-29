local notify = require("notify")

notify.setup({
	background_colour = "#101010",
	render = "simple",
})

-- table from lsp severity to vim severity.
local severity = {
	"error",
	"warn",
	"info",
	"info", -- map both hint and info to info?
}
vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
	vim.notify(method.message, severity[params.type])
end

require("telescope").load_extension("notify")
