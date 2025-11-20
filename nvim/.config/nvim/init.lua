--stuff i copied, p basic
vim.g.have_nerd_font = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--i like numbers on it
vim.opt.relativenumber = true
vim.wo.number = true

--so kitty tabs play nice
vim.o.title = true      
vim.o.titlestring = "%t"

--old artifact from when i was testing stuff in here
vim.keymap.set("n", "<leader>ttfquick", function()
  print("Hello from <leader>!")
end, { desc = "Base Leader cmd" })

--required!
require("5bread")







