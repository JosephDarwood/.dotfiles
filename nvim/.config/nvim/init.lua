vim.g.have_nerd_font = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.relativenumber = true
vim.keymap.set("n", "<leader>ttfquick", function()
  print("Hello from <leader>!")
end, { desc = "Base Leader cmd" })
require("5bread")







