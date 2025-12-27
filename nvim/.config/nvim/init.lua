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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "h", "hpp" },
  callback = function()
    vim.bo.expandtab  = true  -- use spaces
    vim.bo.shiftwidth = 4     -- indentation size
    vim.bo.tabstop    = 4     -- how wide a <Tab> appears
  end,
})


--old artifact from when i was testing stuff in here
vim.keymap.set("n", "<leader>ttfquick", function()
  print("Hello from <leader>!")
end, { desc = "Base Leader cmd" })

--required!
require("5bread")







