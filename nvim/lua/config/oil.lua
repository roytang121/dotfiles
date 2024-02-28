require("oil").setup({
    view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
    }
})

vim.keymap.set("n", "<leader>o", "<CMD>Oil --float<CR>", { desc = "Open Oil" })
