local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- options ------------------------------------------

o.statusline = "%!v:lua.require('stl.default')()"

g.mapleader = ","

o.laststatus = 3
o.showmode = false
o.splitkeep = "screen"

o.termguicolors = true
o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append("sI")

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- add binaries installed by mason.nvim to path
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, "/") .. ":" .. vim.env.PATH
