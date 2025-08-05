return {
  "windwp/nvim-autopairs",
  opts = {
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
  },
  config = function(_, opts)
    -- Configura o nvim-autopairs com as opções fornecidas
    require("nvim-autopairs").setup(opts)

    -- Integração condicional com nvim-cmp, se disponível
    pcall(function()
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end)
  end,
}