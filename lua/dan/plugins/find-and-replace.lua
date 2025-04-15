return {
	"nvim-pack/nvim-spectre",
	requires = { "nvim-lua/plenary.nvim" },
	config = function()
		require("spectre")
		vim.keymap.set("n", "<leader>sr", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
	end,
}
