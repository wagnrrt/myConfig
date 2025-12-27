local M = {}
local api = vim.api
local get_extmarks = api.nvim_buf_get_extmarks
local ns = require("colorify.state").ns

-- Configuração única e centralizada do plugin
M.config = {
	virt_text = "󱓻 ",
	mode = "virtual",
	highlight = {
		hex = true,
		lspvars = true,
	},
}

-- Cache para highlight groups
local hl_cache = {}

function M.is_dark(hex)
	hex = hex:gsub("#", "")
	local r = tonumber(hex:sub(1, 2), 16)
	local g = tonumber(hex:sub(3, 4), 16)
	local b = tonumber(hex:sub(5, 6), 16)
	local brightness = (r * 299 + g * 587 + b * 114) / 1000
	return brightness < 128
end

function M.add_hl(hex)
	hex = hex:lower()
	local name = "Colorify_" .. hex:sub(2)

	if hl_cache[name] then
		return name
	end

	local r = tonumber(hex:sub(2, 3), 16)
	local g = tonumber(hex:sub(4, 5), 16)
	local b = tonumber(hex:sub(6, 7), 16)

	api.nvim_set_hl(0, name, {
		fg = hex,
		bg = nil,
		ctermfg = r * 65536 + g * 256 + b,
	})

	hl_cache[name] = true
	return name
end

function M.not_colored(buf, linenr, col, hl_group, opts)
	local ms = get_extmarks(buf, ns, { linenr, col }, { linenr, opts.end_col }, { details = true })

	if #ms == 0 then
		return true
	end

	ms = ms[1]
	opts.id = ms[1]

	local current_hl = ms[4].virt_text and ms[4].virt_text[1][2] or ms[4].hl_group or ""
	return hl_group ~= current_hl
end

return M
