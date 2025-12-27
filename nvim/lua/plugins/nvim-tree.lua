return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	opts = function()
		return {
			filters = { dotfiles = false },
			disable_netrw = true,
			hijack_cursor = true,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
				ignore_list = {},
			},
			reload_on_bufenter = true,
			update_cwd = true,
			view = {
				width = 30,
				preserve_window_proportions = true,
			},
			git = {
				enable = false,
			},
			renderer = {
				root_folder_label = false,
				highlight_git = true,
				highlight_opened_files = "none",
				indent_markers = { enable = true },
				icons = {
					glyphs = {
						default = " ",
						folder = {
							default = " ",
							empty = " ",
							empty_open = " ",
							open = " ",
							symlink = " ",
						},
					},
				},
			},
		}
	end,
}
