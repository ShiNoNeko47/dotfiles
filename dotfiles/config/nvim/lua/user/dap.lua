local dap = require("dap")

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = "./a.out",
		-- program = function()
		-- 	return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		-- end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = true,
	},
}

-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

local dapui = require("dapui")

dapui.setup({
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				"scopes",
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40, -- 40 columns
			position = "left",
		},
		{
			elements = {
				-- "repl",
				"console",
			},
			size = 0.25, -- 25% of total lines
			position = "bottom",
		},
		reset = true,
	},
	controls = {
		enabled = false,
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({ reset = true })
	vim.cmd([[:wincmd b]])
	vim.cmd([[:startinsert]])
end
dap.listeners.before.event_exited["dapui_config"] = function()
	vim.cmd([[:wincmd k]])
end

vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		dapui.close()
	end,
})
