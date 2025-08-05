return {
  { "L3MON4D3/LuaSnip", keys = {} },

  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },
    config = function()
      -- Configuração do blink.cmp
      require("blink.cmp").setup({
        snippets = { preset = "luasnip" },
        cmdline = { enable = true },
        signature = { enabled = true },
        appearance = {
          nerd_font_variant = "normal",
        },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
          providers = {
            cmdline = {
              min_keyword_length = 2,
            },
          },
        },
        keymap = {
          preset = "default",
          ["<CR>"]     = { "accept", "fallback" },
          ["<C-b>"]    = { "scroll_documentation_up", "fallback" },
          ["<C-f>"]    = { "scroll_documentation_down", "fallback" },
          ["<Tab>"]    = { "select_next", "snippet_forward", "fallback" },
          ["<S-Tab>"]  = { "select_prev", "snippet_backward", "fallback" },
        },
        completion = {
          menu = {
            border = "single",
            scrolloff = 1,
            scrollbar = false,
            draw = {
              padding = 1,
              gap = 1,
              cursorline_priority = 20000,
              columns = {
                { "kind_icon" },
                { "label", "kind", gap = 5 },
              },
              components = {
                kind_icon = {
          text = function(ctx)
            local icon = ctx.kind_icon
            if vim.tbl_contains({ "Path" }, ctx.source_name) then
                local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                if dev_icon then
                    icon = dev_icon
                end
            else
                icon = require("lspkind").symbolic(ctx.kind, {
                    mode = "symbol",
                })
            end

            return icon .. ctx.icon_gap
          end,
        }
              },
            },
          },
          documentation = {
            treesitter_highlighting = true,
            window = {
              border = "single",
              scrollbar = false,
              winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDocEnd",
            },
            auto_show = true,
            auto_show_delay_ms = 500,
          },
        },
      })

      -- Carregar snippets do VSCode
      require("luasnip.loaders.from_vscode").lazy_load()

      vim.api.nvim_set_hl(0, "Pmenu", { bg = nil })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = '#A0A0A0' })
      vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = '#A0A0A0' })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })
    end,
  },
}
