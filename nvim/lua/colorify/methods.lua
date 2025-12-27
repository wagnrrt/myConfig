local api = vim.api
local set_extmark = api.nvim_buf_set_extmark
local utils = require("colorify.utils")
local config = utils.config
local ns = require("colorify.state").ns
local needs_hl = utils.not_colored

local M = {}

M.hex = function(buf, line, str)
	for col, hex in str:gmatch("()(#%x%x%x%x%x%x)") do
		col = col - 1

		local hl_group = utils.add_hl(hex)
		local end_col = col + 7

		local opts = {
			end_col = end_col,
			hl_group = nil,
			virt_text_pos = "inline",
			virt_text = { { config.virt_text, hl_group } },
		}

		if needs_hl(buf, line, col, hl_group, opts) then
			set_extmark(buf, ns, line, col, opts)
		end
	end
end

M.lsp_var = function(buf, line, min, max)
	local param = { textDocument = vim.lsp.util.make_text_document_params(buf) }

	for _, client in pairs(vim.lsp.get_clients({ bufnr = buf })) do
		if client.server_capabilities.colorProvider then
			client:request("textDocument/documentColor", param, function(_, resp)
				if resp and line then
					resp = vim.tbl_filter(function(v)
						return v.range["start"].line == line
					end, resp)
				end

				if resp and min then
					resp = vim.tbl_filter(function(v)
						return v.range["start"].line >= min and v.range["end"].line <= max
					end, resp)
				end

				for _, match in ipairs(resp or {}) do
					local color = match.color
					local r, g, b, a = color.red, color.green, color.blue, color.alpha or 1

					if a > 1 then
						a = a / 255
					end

					local hex = string.format(
						"#%02x%02x%02x",
						math.floor(r * a * 255),
						math.floor(g * a * 255),
						math.floor(b * a * 255)
					)

					local hl_group = utils.add_hl(hex)

					local range_start = match.range.start
					local range_end = match.range["end"]

					local opts = {
						end_col = range_end.character,
						hl_group = nil,
						virt_text_pos = "inline",
						virt_text = { { config.virt_text, hl_group } },
					}

					if needs_hl(buf, range_start.line, range_start.character, hl_group, opts) then
						pcall(set_extmark, buf, ns, range_start.line, range_start.character, opts)
					end
				end
			end, buf)
		end
	end
end

return M
