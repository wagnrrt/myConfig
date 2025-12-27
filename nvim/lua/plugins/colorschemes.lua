return {
	"datsfilipe/min-theme.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("min-theme-dark")

		-- ===== Snacks.nvim Indent =====
		vim.api.nvim_set_hl(0, "SnacksIndent", {
			fg = "#3a3a3a",
			nocombine = true,
		})

		vim.api.nvim_set_hl(0, "SnacksIndentScope", {
			fg = "#5f5f5f",
			bold = true,
			nocombine = true,
		})

		-- ===== Nvim-tree Indent =====
		vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", {
			fg = "#3a3a3a",
			nocombine = true,
		})

		-- ===== Nvim-tree: arquivos neutros + aberto destacado =====
		local tree_fg = "#909090"
		-- Base
		vim.api.nvim_set_hl(0, "NvimTreeFileName", { fg = tree_fg })
		vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = tree_fg })

		-- Remove variações por tipo
		vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = tree_fg })
		vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = tree_fg })
		vim.api.nvim_set_hl(0, "NvimTreeImageFile", { fg = tree_fg })
		vim.api.nvim_set_hl(0, "NvimTreeSymlink", { fg = tree_fg })

		-- Pastas
		vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = tree_fg })
		vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = tree_fg })
		vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = tree_fg })
		vim.api.nvim_set_hl(0, "NvimTreeSymlinkFolderName", { fg = tree_fg })
	end,
}
