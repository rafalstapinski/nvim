-- null-ls config (formatting)

--[[ local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "null-ls"
        end,
        bufnr = bufnr
    })
end

local null_ls = require("null-ls")
null_ls.setup({
    diagnostics_format = "[#{c}] #{m} (#{s})",
    sources = {
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy,
    },
})
]]

-- end null-ls config

-- LSP Zero Config

local lsp = require("lsp-zero").preset({})

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

lsp.on_attach(function(_, buffno)
    lsp.default_keymaps({
        buffer = buffno
    })

    --[[ if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffno })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = buffno,
            callback = function()
                lsp_formatting(buffno)
            end,
        })
    end ]]
end)

-- End LSP Zero Config


-- Configure Servers

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.pyright.setup({})


-- -- End Servers Config

lsp.setup()

-- CMP Config

local cmp = require("cmp")

local cmp_kinds = {
    Text = '  ',
    Method = '  ',
    Function = '  ',
    Constructor = '  ',
    Field = '  ',
    Variable = '  ',
    Class = '  ',
    Interface = '  ',
    Module = '  ',
    Property = '  ',
    Unit = '  ',
    Value = '  ',
    Enum = '  ',
    Keyword = '  ',
    Snippet = '  ',
    Color = '  ',
    File = '  ',
    Reference = '  ',
    Folder = '  ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  ',
    Event = '  ',
    Operator = '  ',
    TypeParameter = '  ',
}

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            -- kind.kind = " " .. (strings[1] or "") .. " "
            kind.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
            kind.menu = "    (" .. (strings[2] or "") .. ")"
            return kind
        end,
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Esc>"] = cmp.mapping.abort(),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },
        { name = "buffer",                 keyword_length = 3 },
        { name = "path" },
    }),
})

-- End CMP Config
