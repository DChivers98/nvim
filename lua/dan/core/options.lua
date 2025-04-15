vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- Expand tab to spaces
opt.autoindent = true -- Copy indent from current line when starting a new one

opt.wrap = false -- Disable line wrapping

-- search settings
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- If you include mixed case in search, assumes you want case sensitive

opt.cursorline = true -- Highlight current cursor line

-- colourscheme (tokyonight)
opt.termguicolors = true
opt.background = "dark" -- Colour schemes which can be light or dark will be dark
opt.signcolumn = "yes" -- Show sign column so that text doesnt shift

-- backspace
opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- Use the system clipboard as the default register

-- split windows
opt.splitright = true -- Split vertical window to the right
opt.splitbelow = true -- Split horizontal window to the bottom
