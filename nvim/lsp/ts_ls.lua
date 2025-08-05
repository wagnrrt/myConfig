return {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_markers = {
		"tsconfig.json",
		"jsconfig.json",
		"package.json",
		".git",
	},
	init_options = {
		hostInfo = "neovim",
	},
	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
}
