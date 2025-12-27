return {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter",
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true, -- Fecha tags automaticamente
				enable_rename = true, -- Renomeia tag de abertura/fechamento
				enable_close_on_slash = false, -- Não fecha ao digitar </
			},
		})
	end,
}
