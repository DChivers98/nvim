vim.g.mapleader = " "

local keymap = vim.keymap -- For conciseness.

-- Exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Greatest remap ever
keymap.set("n", "<leader>p", '"_diwP', { noremap = true, desc = "Delete word under cursor without affecting registry" })

-- Spacemacs keybinding changes
keymap.set("n", "<leader>fs", ":w<CR>", { desc = "File save" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader><tab>", "<Cmd>b#<CR>", { desc = "Go to previous buffer" })

-- Increment / Decrement number
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Buffer close and delete
keymap.set("n", "<leader>bx", ":bd<CR>", { desc = "Close current buffer" })
keymap.set("n", "<leader>bd", ":bp|bd #<CR>", { desc = "Delete current buffer" })

-- Windows
keymap.set("n", "<leader>w|", "<C-w>v", { desc = "Split window vetically" })
keymap.set("n", "<leader>w-", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Makes split equal size" })
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to right window" })
