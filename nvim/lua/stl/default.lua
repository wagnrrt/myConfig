local utils = require("stl.utils")

local sep_style = "default" -- Pode ser "default", "round", "block" ou "arrow"
local sep_icons = utils.separators
local separators = sep_icons[sep_style] or sep_icons.default

local sep_l = separators.left
local sep_r = separators.right

-- Configura os grupos de destaque (highlight groups)
vim.api.nvim_set_hl(0, "St_NormalMode", { fg = "#282b2f", bg = "#81a2be" })
vim.api.nvim_set_hl(0, "St_InsertMode", { fg = "#282b2f", bg = "#8fb382" })
vim.api.nvim_set_hl(0, "St_VisualMode", { fg = "#282b2f", bg = "#a68fbf" })
vim.api.nvim_set_hl(0, "St_ReplaceMode", { fg = "#282b2f", bg = "#bf7a7a" })
vim.api.nvim_set_hl(0, "St_CommandMode", { fg = "#282b2f", bg = "#c6a36e" })
vim.api.nvim_set_hl(0, "St_TerminalMode", { fg = "#282b2f", bg = "#7a9e9e" })
vim.api.nvim_set_hl(0, "St_NTerminalMode", { fg = "#282b2f", bg = "#7a9e9e" })
vim.api.nvim_set_hl(0, "St_ConfirmMode", { fg = "#282b2f", bg = "#7a9e9e" })
vim.api.nvim_set_hl(0, "St_SelectMode", { fg = "#282b2f", bg = "#7a95b7" })

vim.api.nvim_set_hl(0, "St_NormalModeSep", { fg = "#81a2be", bg = "#303030" })
vim.api.nvim_set_hl(0, "St_InsertModeSep", { fg = "#8fb382", bg = "#303030" })
vim.api.nvim_set_hl(0, "St_VisualModeSep", { fg = "#a68fbf", bg = "#303030" })
vim.api.nvim_set_hl(0, "St_ReplaceModeSep", { fg = "#bf7a7a", bg = "#303030" })
vim.api.nvim_set_hl(0, "St_CommandModeSep", { fg = "#c6a36e", bg = "#303030" })
vim.api.nvim_set_hl(0, "St_TerminalModeSep", { fg = "#7a9e9e", bg = "#303030" })
vim.api.nvim_set_hl(0, "St_NTerminalModeSep", { fg = "#7a9e9e", bg = "#303030" })
vim.api.nvim_set_hl(0, "St_ConfirmModeSep", { fg = "#7a9e9e", bg = "#303030" })
vim.api.nvim_set_hl(0, "St_SelectModeSep", { fg = "#7a95b7", bg = "#303030" })

vim.api.nvim_set_hl(0, "St_file", { fg = "#c6c6c6", bg = "#303030" })
vim.api.nvim_set_hl(0, "St_file_sep", { fg = "#303030", bg = "#242424" })
vim.api.nvim_set_hl(0, "St_gitIcons", { fg = "#c6a36e", bg = "#242424" })
vim.api.nvim_set_hl(0, "St_LspMsg", { fg = "#87b3d0", bg = "#242424" })
vim.api.nvim_set_hl(0, "St_Lsp", { fg = "#87b3d0", bg = "#242424" })
vim.api.nvim_set_hl(0, "St_lspError", { fg = "#bf7a7a", bg = "#242424" })
vim.api.nvim_set_hl(0, "St_lspWarning", { fg = "#c6a36e", bg = "#242424" })
vim.api.nvim_set_hl(0, "St_lspHints", { fg = "#7a9e9e", bg = "#242424" })
vim.api.nvim_set_hl(0, "St_lspInfo", { fg = "#8fb382", bg = "#242424" })
vim.api.nvim_set_hl(0, "St_cwd_sep", { fg = "#303030", bg = "#242424" })
vim.api.nvim_set_hl(0, "St_cwd_icon", { fg = "#87b3d0", bg = "#303030" })
vim.api.nvim_set_hl(0, "St_cwd_text", { fg = "#c6c6c6", bg = "#303030" })
vim.api.nvim_set_hl(0, "St_pos_sep", { fg = "#303030", bg = "#303030" })
vim.api.nvim_set_hl(0, "St_pos_icon", { fg = "#87b3d0", bg = "#303030" })
vim.api.nvim_set_hl(0, "St_pos_text", { fg = "#c6c6c6", bg = "#303030" })
vim.api.nvim_set_hl(0, "St_EmptySpace", { fg = "#303030", bg = "#303030" })

local M = {}

M.mode = function()
	if not utils.is_activewin() then
		return ""
	end

	local modes = utils.modes
	local m = vim.api.nvim_get_mode().mode

	local current_mode = "%#St_" .. modes[m][2] .. "Mode#  " .. modes[m][1]
	local mode_sep1 = "%#St_" .. modes[m][2] .. "ModeSep#" .. sep_r
	return current_mode .. mode_sep1 .. "%#St_EmptySpace#" .. sep_r
end

M.file = function()
	local x = utils.file()
	local name = " " .. x[2] .. (sep_style == "default" and " " or "")
	return "%#St_file# " .. x[1] .. name .. "%#St_file_sep#" .. sep_r
end

M.git = function()
	return "%#St_gitIcons#" .. utils.git()
end

M.lsp_msg = function()
	return "%#St_LspMsg#" .. utils.lsp_msg()
end

M.diagnostics = utils.diagnostics

M.lsp = function()
	return "%#St_Lsp#" .. utils.lsp()
end

M.cwd = function()
	local icon = "%#St_cwd_icon#" .. "󰉋 "
	local name = vim.fn.getcwd()
	name = "%#St_cwd_text#" .. " " .. (name:match("([^/\\]+)[/\\]*$") or name) .. " "
	return (vim.o.columns > 85 and ("%#St_cwd_sep#" .. sep_l .. icon .. name)) or ""
end

M.cursor = "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon# %#St_pos_text# %l/%v "
M["%="] = "%="

-- Função principal para gerar a statusline
return function()
	return utils.generate("default", M)
end
