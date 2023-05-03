vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
  -- packer (self)
  use({
    'wbthomason/packer.nvim'
  })

  -- web icons
  use({
    "nvim-tree/nvim-web-devicons"
  })

  -- nvim tree (file tree)
  use({
    "nvim-tree/nvim-tree.lua"
  })

  --bufferline (tab bar)
  use({
    "akinsho/bufferline.nvim",
    tag = "*",
    requires = "nvim-tree/nvim-web-devicons"
  })

  -- lualine (statusbar)
  use({
    "nvim-lualine/lualine.nvim",
    requires = "nvim-tree/nvim-web-devicons"
  })

  --nvim-treesitter (syntax highlighting)
  use({
    "nvim-treesitter/nvim-treesitter",
    -- run = ":TSUpdate"
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  })

  use({
    "nvim-treesitter/playground"
  })

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = { { "nvim-lua/plenary.nvim" } }
  })
end)
