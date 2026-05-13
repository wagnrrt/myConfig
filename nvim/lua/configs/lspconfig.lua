require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "tailwindcss",
  "jsonls",
  "eslint",
  "ts_ls",
  "clangd",
  "cmake",
  "sqls",
  "kotlin_language_server"
}

vim.lsp.enable(servers)
