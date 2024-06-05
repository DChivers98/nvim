return {
        {
                "tpope/vim-fugitive",
                config = function()
                        vim.keymap.set("n", "<leader>gg", ":Git <CR>", { desc = "Git interactive" })
                        vim.keymap.set("n", "<leader>gac", ":Git add <CR>", { desc = "Git add current buffer" })
                        vim.keymap.set("n", "<leader>ga.", ":Git add .<CR>", { desc = "Git add all files in current directory" })
                        vim.keymap.set("n", "<leader>gc", ":Git commit <CR>", { desc = "Git commit" })
                        vim.keymap.set("n", "<leader>gp", ":Git push <CR>", { desc = "Git push" })
                        vim.keymap.set("n", "<leader>gl", ":Git log <CR>", { desc = "Git log" })
                        vim.keymap.set("n", "<leader>gs", ":Git status <CR>", { desc = "Git status" })
                        vim.keymap.set("n", "<leader>gdd", ":Git diff <CR>", { desc = "Git diff" })
                        vim.keymap.set("n", "<leader>gds", ":Gdiffsplit <CR>", { desc = "Git diff split" })
                end,
        },
        {
                "lewis6991/gitsigns.nvim",
                config = function()
                        require("gitsigns").setup()

                        vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Show git hunk preview" })
                        vim.keymap.set(
                                "n",
                                "<leader>gt",
                                ":Gitsigns toggle_current_line_blame<CR>",
                                { desc = "Show current line blame" }
                        )
                end,
        },
}
