return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install && git restore .",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
	keys = {
		{ "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Toggle Markdown Preview" },
	},
}
