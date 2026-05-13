return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "cpp",
        "c", "javascript", "typescript",
        "tsx", "json", "luadoc", "kotlin",
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require("configs.nvimtree")
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      color_icons = false,
    },
  },

  {
    "mslvx/obscure.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,           -- Fecha tags automaticamente
          enable_rename = true,          -- Renomeia tag de abertura/fechamento
          enable_close_on_slash = false, -- Não fecha ao digitar </
        },
      })
    end,
  },
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>cs", desc = "Send request" }, -- c = curl / client
      { "<leader>ca", desc = "Send all requests" },
      { "<leader>cb", desc = "Open scratchpad" },
    },
    ft = { "http", "rest" },
    opts = {
      env_files = { "http-client.env" },
      global_keymaps = true,
      global_keymaps_prefix = "<leader>c", -- prefixo seguro
      kulala_keymaps_prefix = "",
    },
  },
}
