return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Jump to definition
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- Jump to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["pyright"] = function()
				local venv_path = vim.fn.getcwd() .. "/.venv"
				local python_path = venv_path .. "/bin/python"

				lspconfig["pyright"].setup({
					capabilities = capabilities,
					settings = {
						python = {
							pythonPath = python_path,
							analysis = {
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
								diagnosticMode = "workspace",
								typeCheckingMode = "basic",
							},
						},
					},
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["elixirls"] = function()
				lspconfig["elixirls"].setup({
					cmd = { "elixir-ls" },
					capabilities = capabilities,
					filetypes = { "elixir", "eelixir", "heex" },
					settings = { elixirLS = { dialyzerEnabled = false } },
				})
			end,
			["tailwindcss"] = function()
				lspconfig["tailwindcss"].setup({
					capabilities = capabilities,
					filetypes = { "html", "elixir", "eelixir", "heex" },
					init_options = {
						userLanguages = {
							elixir = "html-eex",
							eelixir = "html-eex",
							heex = "html-eex",
						},
						settings = {
							tailwindCSS = {
								experimental = {
									classRegex = {
										'class[:]\\s*"([^"]*)"',
									},
								},
							},
						},
					},
				})
			end,
			["emmet_ls"] = function()
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = { "html", "css", "elixir", "eelixir", "heex" },
				})
			end,
		})
	end,
}
