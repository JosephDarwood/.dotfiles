return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({
	    border = "single",      
	    padding = { 0, 1, 0, 1 },
	    winblend = 0,           
    })
  end,
}

