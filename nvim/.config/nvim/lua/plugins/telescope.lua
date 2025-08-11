return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
	--cmd = "Telescope",
  config = function()
    local ts = require("telescope")
    local bin = require("telescope.builtin")
    ts.setup({})
    vim.keymap.set("n","<leader>ff", function()
	    bin.find_files({hidden = true, no_ignore=true})
    end, {desc = "Find Files"})
    vim.keymap.set("n","<leader>km", function()
	    bin.keymaps()
    end, {desc = "Key maps"})
    vim.keymap.set("n","<leader>fg", function()
	    bin.live_grep()
    end, {desc = "Live grep"})
    vim.keymap.set("n","<leader>fb", function()
	    bin.buffers()
    end, {desc = "buffas"})
  end,
}
