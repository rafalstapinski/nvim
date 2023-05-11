vim.cmd [[packadd packer.nvim]]


return require("packer").startup(function(use)
  -- packer (self)
  use({
    "wbthomason/packer.nvim"
  })

  use({ "sainnhe/sonokai" })

--[[
  use({
      "xiyaowong/transparent.nvim",
      config = function() require("transparent").setup({
          groups = {
              'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
          }
      }) end
  })

  --]]

  -- web icons
  use({
    "nvim-tree/nvim-web-devicons"
  })

  -- nvim tree (file tree)
  use({
    "nvim-tree/nvim-tree.lua"
  })

  -- bufferline (tab bar)
  use({
    "akinsho/bufferline.nvim",
    tag = "*",
    requires = "nvim-tree/nvim-web-devicons"
  })

  --  (statusbar)
  use({
    "nvim-lualine/lualine.nvim",
    requires = "nvim-tree/nvim-web-devicons"
  })

  --nvim-treesitter (syntax highlighting)
  use({
    "nvim-treesitter/nvim-treesitter",
    -- run = ":TSUpdate"
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  use({
    "nvim-treesitter/playground"
  })

  -- telescope (fuzzy finding)
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = { { "nvim-lua/plenary.nvim" } }
  })

  --- git blame
  use({
    "f-person/git-blame.nvim"
  })

  -- greeter/dashboard
  use({ "startup-nvim/startup.nvim" }) 

  use({ "kdheepak/lazygit.nvim" })

  --[[
  use({
    "neoclide/coc.nvim",
    branch = "release"
  })

  use({
    "williamboman/mason.nvim",
    run = function()
      pcall(vim.cmd, "MasonUpdate")
    end,
  })
  use({
    "WhoIsSethDaniel/mason-tool-installer.nvim"
  })

  --]]
  use({
    "numToStr/FTerm.nvim"
  })

  use({
    "nvim-treesitter/nvim-treesitter-context"
  })

  use({
    "windwp/nvim-autopairs",
   -- config = function() require("nvim-autopairs").setup({}) end
  })

  use({
      "neoclide/coc.nvim",
      branch = "release",
  })



  use({
    "numToStr/Comment.nvim",
   -- config = function() require("Comment") end,
  })

  use({
      "rcarriga/nvim-notify",
  })

end)
--[[
  use({
      "kosayoda/nvim-lightbulb",
      rquires = "antoinemadec/FixCursorHold.nvim"
  })

  use({
      "weilbith/nvim-code-action-menu",
      cmd = "CodeActionMenu"
  })

  use({
      "j-hui/fidget.nvim"
  })


  use({
      "jose-elias-alvarez/null-ls.nvim"
  })

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
                               -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'onsails/lspkind-nvim'},
    }
  }

  use({"simrat39/rust-tools.nvim"})

  -- lsp
  -- use({
  --   "VonHeikemen/lsp-zero.nvim",
  --   branch = "v2.x",
  --   requires = {
  --     -- LSP Support
  --     { "neovim/nvim-lspconfig" },
  --     --- mason (auto download)
  --     {
  --       "williamboman/mason.nvim",
  --       run = function()
  --         pcall(vim.cmd, "MasonUpdate")
  --       end,
  --     },
  --     { "williamboman/mason-lspconfig.nvim" },

  --     --- autocompletion
  --     { "hrsh7th/nvim-cmp" },
  --     { "hrsh7th/cmp-nvim-lsp" },
  --     { "hrsh7th/cmp-buffer" },
  --     { "hrsh7th/cmp-path" },
  --     { "L3MON4D3/LuaSnip" },
  --     { "onsails/lspkind-nvim" }
  --   }
  -- })

  -- use({
  --   "neovim/nvim-lspconfig",
  --   requires = {
  --     {
  --       "williamboman/mason.nvim",
  --       run = function()
  --         pcall(vim.cmd, "MasonUpdate")
  --       end
  --     },
  --     { "williamboman/mason-lspconfig.nvim" },
  --     { "RubixDev/mason-update-all" },
  --     { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  --     -- cmp
  --     { "hrsh7th/nvim-cmp" },
  --     { "hrsh7th/cmp-nvim-lsp" },
  --     { "hrsh7th/cmp-nvim-lua" },
  --     { "hrsh7th/cmp-buffer" },
  --     { "hrsh7th/cmp-path" },
  --     { "hrsh7th/cmp-nvim-lsp-signature-help" },
  --     { "saadparwaiz1/cmp_luasnip" },
  --     { "onsails/lspkind-nvim" },

  --     -- snip
  --     { "L3MON4D3/LuaSnip" },
  --   }
  -- })
end)

--]]

