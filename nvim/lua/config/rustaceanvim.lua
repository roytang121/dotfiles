vim.g.rustaceanvim = function()
    local executors = require('rustaceanvim.executors')
    -- -- Update this path
    -- local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
    -- local codelldb_path = extension_path .. 'adapter/codelldb'
    -- local liblldb_path = extension_path .. 'lldb/lib/liblldb'
    -- local this_os = vim.uv.os_uname().sysname;
    --
    -- -- The path is different on Windows
    -- if this_os:find "Windows" then
    --     codelldb_path = extension_path .. "adapter\\codelldb.exe"
    --     liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
    -- else
    --     -- The liblldb extension is .so for Linux and .dylib for MacOS
    --     liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
    -- end

    local cfg = require('rustaceanvim.config')
    return {
        -- Plugin configuration
        tools = {
            executor = executors.toggleterm,
            test_executor = executors.toggleterm,
        },
        -- LSP configuration
        server = {
            on_attach = function(client, bufnr)
                -- you can also put keymaps in here

                -- only do inlay hint with rust-analyzer if supported
                if client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true)
                end
            end,
            default_settings = {
                -- rust-analyzer language server configuration
                ['rust-analyzer'] = {
                    cachePriming = {
                        enable = true,
                    },
                    checkOnSave = {
                        enable = true,
                    },
                },
            },
            dap = {
                -- adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
            },
        },
    }
end
