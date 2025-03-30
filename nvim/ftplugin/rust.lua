local bufnr = vim.api.nvim_get_current_buf()

-- local dap = require('dap')
-- dap.configurations.rust = {
--     {
--         name = 'Debug with codelldb',
--         type = 'codelldb',
--         request = 'launch',
--         program = function()
--             return vim.fn.input({
--                 prompt = 'Path to executable: ',
--                 default = vim.fn.getcwd() .. '/',
--                 completion = 'file',
--             })
--         end,
--         cwd = '${workspaceFolder}',
--         stopOnEntry = false,
--     },
-- }
