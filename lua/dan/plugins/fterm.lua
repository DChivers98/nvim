return {
	"numToStr/FTerm.nvim",
	config = function()
		local fterm = require("FTerm")

		-- Default terminal toggle
		vim.keymap.set("n", "<leader>tt", function()
			fterm:toggle()
		end, { desc = "[T]oggle [T]erminal" })
		vim.keymap.set("t", "<leader>tt", function()
			fterm:toggle()
		end, { desc = "[T]oggle [T]erminal" })

		-- LazyGit terminal instance
		local lazygit = fterm:new({
			cmd = "lazygit",
		})

		vim.keymap.set("n", "<leader>lg", function()
			lazygit:toggle()
		end, { desc = "Toggle [L]azy[G]it" })
		vim.keymap.set("t", "<leader>lg", function()
			lazygit:toggle()
		end, { desc = "Toggle [L]azy[G]it" })

		-- LazyDocker terminal instance
		local lazygit = fterm:new({
			cmd = "lazydocker",
		})

		vim.keymap.set("n", "<leader>ld", function()
			lazygit:toggle()
		end, { desc = "Toggle [L]azy[G]it" })
		vim.keymap.set("t", "<leader>lg", function()
			lazygit:toggle()
		end, { desc = "Toggle [L]azy[G]it" })
	end,
}
