return {
  "tpope/vim-fugitive",
  config = function()
    local map = vim.keymap.set

    map("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })

    map("n", "<leader>ga", ":Gwrite<CR>", { desc = "Git add (stage current file)" })

    map("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })

    map("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })

    map("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git diff current file" })

    map("n", "<leader>gb", ":Gblame<CR>", { desc = "Git blame" })
  end,
}
