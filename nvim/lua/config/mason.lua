require('mason').setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "tsserver",
    "tailwindcss",
    "bashls",
    "cssls",
    "html",
    "jsonls",
    -- "pyright",
    -- "rust_analyzer",
  },
})
