return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    "stevearc/conform.nvim",
    "j-hui/fidget.nvim",
  },

  config = function()
    ---------------------------------------------------------------------------
    -- 1. LSP capabilities & diagnostics
    ---------------------------------------------------------------------------
    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_lsp.default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )

    vim.diagnostic.config({
      float = {
        border = "rounded",
        source = "always",
        style = "minimal",
        header = "",
        prefix = "",
        focusable = false,
      },
    })

    ---------------------------------------------------------------------------
    -- 2. Mason + mason-lspconfig + lspconfig
    ---------------------------------------------------------------------------
    require("fidget").setup({})
    require("mason").setup()

    local lspconfig = require("lspconfig")
    require("mason-lspconfig").setup({
      -- start small; you can add more here later
      ensure_installed = {
        "lua_ls",
	"clangd",
      },

      handlers = {
        -- default handler for anything not explicitly configured below
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,

        -- example of a slightly customized server
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }, -- don't warn about vim global in configs
                },
                workspace = {
                  checkThirdParty = false,
                },
              },
            },
          })
        end,
	["clangd"] = function()
  	lspconfig.clangd.setup({
    	  capabilities = capabilities,
    	  cmd = {
    	    "clangd",
      	    "--compile-commands-dir=build",
      	    "--clang-tidy",                 -- enable clang-tidy integration
            "--completion-style=detailed",  -- richer completion info
   	    "--header-insertion=never",     -- or "iwyu" if you want auto-includes
      	    "--cross-file-rename=true",     -- better renames across files
    	  },
	  })
	end,
      },
    })

    ---------------------------------------------------------------------------
    -- 3. nvim-cmp + LuaSnip (as infra, not in-your-face)
    ---------------------------------------------------------------------------
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          -- LSP snippets & completion snippets expand through LuaSnip
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        -- note: no <Tab> mapping here, so snippets stay out of your way
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- mostly for future use; harmless for now
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })

    ---------------------------------------------------------------------------
    -- 4. Conform (formatter manager) – minimal, ready to extend
    ---------------------------------------------------------------------------
    require("conform").setup({
      formatters_by_ft = {
        -- example: add when you’re ready
        -- lua = { "stylua" },
      },
    })
    ---------------------------------------------------------------------------
    -- 5. Keymaps: format + diagnostics float
    ---------------------------------------------------------------------------
    local map = vim.keymap.set

    -- Format current buffer using Conform (with LSP fallback)
    map("n", "<leader>ft", function()
      require("conform").format({
        async = true,
        lsp_fallback = true,
      })
    end, { desc = "Format current buffer" })

    -- Show diagnostics for the current line in a floating window
    map("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Line diagnostics" })
  end,
}

