require('copilot').setup {
    panel = {
        enabled = true,
        auto_refresh = true,
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        -- accept = true, -- disable built-in keymapping
        keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
    },
}

-- hide copilot suggestions when cmp menu is open
-- to prevent odd behavior/garbled up suggestions
local cmp_status_ok, cmp = pcall(require, 'cmp')
if cmp_status_ok then
    cmp.event:on('menu_opened', function()
        vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on('menu_closed', function()
        vim.b.copilot_suggestion_hidden = false
    end)
end

