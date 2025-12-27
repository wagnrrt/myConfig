vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- defaults:
		-- https://neovim.io/doc/user/news-0.11.html#_defaults

		map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
		map("gD", vim.lsp.buf.declaration, "Goto Declaration")
		map("<leader>la", vim.lsp.buf.code_action, "Code Action")
		map("<leader>lr", vim.lsp.buf.rename, "Rename all references")
		map("<leader>lf", vim.lsp.buf.format, "Format")
		map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

		local function client_supports_method(client, method, bufnr)
			if vim.fn.has("nvim-0.11") == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if
			client
			and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
		then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

			-- When cursor stops moving: Highlights all instances of the symbol under the cursor
			-- When cursor moves: Clears the highlighting
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			-- When LSP detaches: Clears the highlighting
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})

-- Terminal management autocommands
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term", { clear = true }),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("custom-term-focus", { clear = true }),
	pattern = "term://*",
	callback = function()
		vim.cmd("startinsert")
	end,
})

-- Function to toggle terminals
local function toggle_terminal(pos, id)
	local term_buf = vim.fn.bufnr(id)
	if term_buf ~= -1 and vim.api.nvim_buf_is_valid(term_buf) then
		local win = vim.fn.bufwinid(term_buf)
		if win ~= -1 then
			vim.api.nvim_win_close(win, true)
		else
			if pos == "float" then
				vim.cmd("botright 15new")
				vim.api.nvim_win_set_buf(0, term_buf)
				vim.api.nvim_win_set_config(0, {
					relative = "editor",
					width = math.floor(vim.o.columns * 0.8),
					height = math.floor(vim.o.lines * 0.8),
					row = math.floor(vim.o.lines * 0.1),
					col = math.floor(vim.o.columns * 0.1),
					style = "minimal",
					border = "rounded",
				})
			elseif pos == "sp" then
				vim.cmd("belowright 15split")
				vim.api.nvim_win_set_buf(0, term_buf)
			elseif pos == "vsp" then
				vim.cmd("rightbelow vsplit")
				vim.api.nvim_win_set_buf(0, term_buf)
				vim.cmd("vertical resize 40")
			end
			vim.cmd("startinsert")
		end
	else
		if pos == "float" then
			vim.cmd("botright 15new | term")
			vim.api.nvim_buf_set_name(0, id)
			vim.api.nvim_win_set_config(0, {
				relative = "editor",
				width = math.floor(vim.o.columns * 0.8),
				height = math.floor(vim.o.lines * 0.8),
				row = math.floor(vim.o.lines * 0.1),
				col = math.floor(vim.o.columns * 0.1),
				style = "minimal",
				border = "rounded",
			})
		elseif pos == "sp" then
			vim.cmd("belowright 15split | term")
			vim.api.nvim_buf_set_name(0, id)
		elseif pos == "vsp" then
			vim.cmd("rightbelow vsplit | term")
			vim.api.nvim_buf_set_name(0, id)
			vim.cmd("vertical resize 45")
		end
		vim.cmd("startinsert")
	end
end

-- Create commands for terminal toggling
vim.api.nvim_create_user_command("ToggleTermHorizontal", function()
	toggle_terminal("sp", "htoggleTerm")
end, {})
vim.api.nvim_create_user_command("ToggleTermVertical", function()
	toggle_terminal("vsp", "vtoggleTerm")
end, {})
vim.api.nvim_create_user_command("ToggleTermFloat", function()
	toggle_terminal("float", "floatTerm")
end, {})
