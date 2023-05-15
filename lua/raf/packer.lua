vim.cmd [[packadd packer.nvim]]


return require("packer").startup(function(use)
    -- packer (self)
    use({
        "wbthomason/packer.nvim"
    })

    -- theme
    use({ "sainnhe/sonokai" })

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

    -- statusbar
    use({
        "nvim-lualine/lualine.nvim",
        requires = "nvim-tree/nvim-web-devicons"
    })

    --nvim-treesitter (syntax highlighting)
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })

    -- treesitter ast
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

    -- git thingy
    use({ "kdheepak/lazygit.nvim" })

    use({
        "numToStr/FTerm.nvim"
    })

    use({
        "nvim-treesitter/nvim-treesitter-context"
    })

    use({
        "windwp/nvim-autopairs",
    })

    use({
        "numToStr/Comment.nvim",
    })

    use({
        "rcarriga/nvim-notify",
    })

    -- window mgmt
    use({
        "beauwilliams/focus.nvim"
    })

    use({
        "neoclide/coc.nvim"
    })

    --[[ use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            { "neovim/nvim-lspconfig" },
            -- mason
            {
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end
            },
            { "williamboman/mason-lspconfig.nvim" },
            -- autocomp
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
            { "hrsh7th/cmp-cmdline" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-path" },
            { "lithammer/nvim-pylance" },
            -- misc
            { "onsails/lspkind.nvim" },
            { "simrat39/inlay-hints.nvim" },
            {
                "nvimdev/lspsaga.nvim",
                event = "LspAttach",
                config = function()
                    require("lspsaga").setup({})
                end
            },
            { "jose-elias-alvarez/null-ls.nvim",

            },
            -- nvim cmp buf
            -- nvim cmp snip
            -- nvim cmp path
            -- null ls
            -- null ls mason
            -- inlay hints
        }
    }) ]]
end)
