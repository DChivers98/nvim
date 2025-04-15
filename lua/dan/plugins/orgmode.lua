return {
	"nvim-orgmode/orgmode",
	ft = { "org" },
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-orgmode/telescope-orgmode.nvim",
		"nvim-orgmode/org-bullets.nvim",
	},
	event = "VeryLazy",
	config = function()
		require("orgmode").setup({
			org_agenda_files = "~/orgfiles/**/*",
			org_default_notes_file = "~/orgfiles/refile.org",
		})
		require("org-bullets").setup()
		require("telescope").load_extension("orgmode")
	end,
}
