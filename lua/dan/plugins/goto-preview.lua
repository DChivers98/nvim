return {
	"rmagatti/goto-preview",
	config = function()
		require("goto-preview").setup({})
		vim.keymap.set("n", "pd", require("goto-preview").goto_preview_definition, { noremap = true })
		vim.keymap.set("n", "pt", require("goto-preview").goto_preview_type_definition, { noremap = true })
		vim.keymap.set("n", "pi", require("goto-preview").goto_preview_implementation, { noremap = true })
		vim.keymap.set("n", "P", require("goto-preview").close_all_win, { noremap = true })
	end,
}
