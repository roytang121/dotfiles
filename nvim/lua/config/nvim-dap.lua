local dap = require("dap")
local dapui = require("dapui")

-- require("mason-nvim-dap").setup({
-- 	-- Makes a best effort to setup the various debuggers with
-- 	-- reasonable debug configurations
-- 	automatic_setup = true,
--
-- 	-- You can provide additional configuration to the handlers,
-- 	-- see mason-nvim-dap README for more information
-- 	handlers = {},
--
-- 	-- You'll need to check that you have the required things installed
-- 	-- online, please don't ask me how to install them :)
-- 	ensure_installed = {
-- 		-- Update this to ensure that you have the debuggers for the langs you want
-- 		"python",
-- 	},
-- })

-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "Debug: Start/Continue" })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "Debug: Step Into" })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "Debug: Step Over" })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "Debug: Step Out" })
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

dapui.setup({
	-- Set icons to characters that are more likely to work in every terminal.
	--    Feel free to remove or use ones that you like more! :)
	--    Don't feel like these are good choices.
	-- icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
	-- controls = {
	-- 	icons = {
	-- 		pause = "⏸",
	-- 		play = "▶",
	-- 		step_into = "⏎",
	-- 		step_over = "⏭",
	-- 		step_out = "⏮",
	-- 		step_back = "b",
	-- 		run_last = "▶▶",
	-- 		terminate = "⏹",
	-- 		disconnect = "⏏",
	-- 	},
	-- },
})

-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "Debug: See last session result." })

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

require('dap-python').setup()
