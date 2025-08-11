return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Core Treesitter modules
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",       -- Enter key: start selection
          node_incremental = "<CR>",     -- Enter key: expand selection
          node_decremental = "<BS>",     -- Backspace key: shrink selection
          scope_incremental = "<TAB>",   -- Tab key: expand by scope
        },
      },
      auto_install = true,
      ensure_installed = {
        "python",
        "cpp",
        "java",
        "bash",
        "json",
        "yaml",
        "lua",
        "markdown",
        "html",
        "css",
	},

    })

    -- Folding powered by Treesitter (no keybinds changed here)
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt.foldlevel = 99 -- don't start with everything folded
  end,
}

