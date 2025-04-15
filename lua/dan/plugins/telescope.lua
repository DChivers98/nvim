return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		{ "nvim-telescope/telescope-file-browser.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local fb_actions = telescope.extensions.file_browser.actions

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<Tab>"] = actions.select_default + actions.center,
					},
					n = {
						["<Tab>"] = actions.select_default + actions.center,
					},
				},
			},
			hidden = true,
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				["file-browser"] = {
					theme = "tokyonight",
					hijack_netrw = true,
					mappings = {
						["i"] = {
							["<Tab>"] = fb_actions.change_cwd,
						},
						["n"] = {
							["<Tab>"] = fb_actions.change_cwd,
						},
					},
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "file-browser")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>", { desc = "Open file browser" })
		vim.keymap.set(
			"n",
			"<leader>ff",
			":Telescope file_browser path=%:p:h select_buffer=true<CR>",
			{ desc = "Open file browser from current buffer" }
		)

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })

		-- Function to open file browser
		local function open_file_browser()
			require("telescope").extensions.file_browser.file_browser({
				path = vim.fn.expand("%:p:h"),
				cwd = vim.fn.expand("%:p:h"),
				respect_gitignore = false,
				hidden = true,
				grouped = true,
				previewer = false,
				initial_mode = "normal",
				layout_config = { height = 40 },
			})
		end

		-- Autocommand to open file browser when starting Neovim with a directory
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				local arg = vim.v.argv[3]
				if arg and vim.fn.isdirectory(arg) ~= 0 then
					vim.cmd.cd(arg)
					open_file_browser()
				end
			end,
		})
	end,
}
