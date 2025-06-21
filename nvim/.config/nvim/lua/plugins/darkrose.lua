return{
	{
		"water-sucks/darkrose.nvim",
		lazy = false,
		priority = 1000,
		config = function()
      			require("darkrose").setup({ transparent = true })
      			vim.cmd.colorscheme("darkrose")
	        end,
	},
}
