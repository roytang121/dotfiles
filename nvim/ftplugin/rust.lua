local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set('n', '<leader>a', function()
    vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })

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
