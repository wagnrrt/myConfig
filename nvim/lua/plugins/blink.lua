return {
	"saghen/blink.cmp",
	version = "1.*",
	event = { "InsertEnter", "CmdLineEnter" },
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"L3MON4D3/LuaSnip",
			dependencies = "rafamadriz/friendly-snippets",
			opts = { history = true, updateevents = "TextChanged,TextChangedI" },
			config = function(_, opts)
				require("luasnip").config.set_config(opts)
				-- se quiser usar config padrão do luasnip, pode chamar seu setup aqui
			end,
		},
		{
			"windwp/nvim-autopairs",
			opts = {
				fast_wrap = {},
				disable_filetype = { "TelescopePrompt", "vim" },
			},
		},
	},
	opts = function()
		local M = {}

		local menu_cols = { { "label" }, { "kind_icon" }, { "kind" } }

		M.components = {
			kind_icon = {
				text = function(ctx)
					local icons = {
						Namespace = "󰌗",
						Text = "󰉿",
						Method = "󰆧",
						Function = "󰆧",
						Constructor = "",
						Field = "󰜢",
						Variable = "󰀫",
						Class = "󰠱",
						Interface = "",
						Module = "",
						Property = "󰜢",
						Unit = "󰑭",
						Value = "󰎠",
						Enum = "",
						Keyword = "󰌋",
						Snippet = "",
						Color = "󱓻",
						File = "󰈚",
						Reference = "󰈇",
						Folder = "󰉋",
						EnumMember = "",
						Constant = "󰏿",
						Struct = "󰙅",
						Event = "",
						Operator = "󰆕",
						TypeParameter = "󰊄",
						Table = "",
						Object = "󰅩",
						Tag = "",
						Array = "[]",
						Boolean = "",
						Number = "",
						Null = "󰟢",
						Supermaven = "",
						String = "󰉿",
						Calendar = "",
						Watch = "󰥔",
						Package = "",
						Copilot = "",
						Codeium = "",
						TabNine = "",
						BladeNav = "",
					}
					return icons[ctx.kind] or ""
				end,
			},
			kind = {
				highlight = function()
					return "Comment"
				end,
			},
		}

		M.menu = {
			scrollbar = false,
			border = "rounded",
			draw = {
				padding = { 1, 1 },
				gap = 2,
				columns = menu_cols,
				cursorline_priority = 20000,
				components = M.components,
			},
		}

		local opts = {
			snippets = { preset = "luasnip" },
			cmdline = { enabled = true },
			appearance = { nerd_font_variant = "normal" },
			sources = { default = { "lsp", "snippets", "buffer", "path" } },

			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			},

			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
					window = { border = "rounded" },
				},

				menu = M.menu,
			},
		}

		vim.api.nvim_set_hl(0, "Pmenu", { bg = nil })
		vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#A0A0A0" })
		vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#A0A0A0" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })

		return opts
	end,
}
