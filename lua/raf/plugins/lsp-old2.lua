local lsp = require("lsp-zero").preset("recommended")

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
require("lspconfig").pyright.setup({
    python = {
        analysis = {
            autoSearchPath = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true,
        }
    }
})

local null_ls = require("null-ls")
null_ls.setup({
    debug = true,
    sources = {
        null_ls.builtins.diagnostics.pylint.with({
            diagnostics_postprocess = function(diagnostic)
                diagnostic.code = diagnostic.message_id
            end,
            prefer_local = ".venv/bin",
            env = function (params)
                return { PYTHONPATH = params.root }
            end,
            -- pylint searches for pyproject.toml by itself
        }),
        null_ls.builtins.formatting.isort.with({
            extra_args = {"--sp", "pyproject.toml"},
            prefer_local = ".venv/bin",
            env = function (params)
                return { PYTHONPATH = params.root }
            end,
        }),
        null_ls.builtins.formatting.black.with({
            extra_args = {"--config pyproject.toml"},
            prefer_local = ".venv/bin",
            env = function (params)
                return { PYTHONPATH = params.root }
            end,
        }),
    }
})

local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, {buffer = bufnr})
            vim.keymap.set("n", "<Leader>a", rt.code_actions_group.code_actions_group, {buffer = bufnr})
        end
    }
})

lsp.setup()

local cmp = require("cmp")
local lspkind = require('lspkind')
cmp.setup({
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({select = false, behavior = cmp.ConfirmBehavior.Insert, }),
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[lsp]",
                nvim_lua = "[lua]",
                path = "[path]",
                luasnip = "[snip]",
            },
        })
    },
    sources = {
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "path" },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 3 },
    },
    experimental = {
        ghost_text = true,
    }
})

require("nvim-lightbulb").setup({autocmd = {enabled = true}})

require("nvim-lightbulb").setup({
    autocmd = {
        enabled = true,
    },
    status_text = {
        enabled = true,
    },
    virtual_text = {
        enabled = false,
    },
    float = {
        enabled = false,
    },

})

require("fidget").setup({})
