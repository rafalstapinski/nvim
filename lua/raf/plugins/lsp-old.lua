local lspconfig = require("lspconfig")
local lspkind = require("lspkind")
local cmp = require("cmp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local luasnip = require("luasnip")

require("mason").setup({
  ui = {
    icons = {
      package_installed = "",
      package_pending = "",
      package_uninstalled = "",
    },
  }
})
require("mason-lspconfig").setup()
-- require("mason-update-all").setup()

local server_packages = {
  "pyright",
  -- python-lsp-server
  "rust-analyzer",
  "typescript-language-server",
  "lua-language-server",
}

local servers_lspconfigs = {
  "pyright",
  -- pylsp
  "rust_analyzer",
  "tsserver",
  "lua_ls"
}

require("mason-tool-installer").setup({
  ensure_installed = server_packages,
  auto_update = true,
  run_on_start = true,
  -- start_delay = 3000,
})

lspkind.init()

for _, lsp in ipairs(servers_lspconfigs) do
  lspconfig[lsp].setup({
    capabilities = capabilities
  })
end

local cmp = require 'cmp'
cmp.setup({
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<c-y>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
    ["<c-space>"] = cmp.mapping.complete(),
  },
  sources = {
    -- { name = "gh_issues"},
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "path" },
    { name = "luasnip" },
    {
      name = "buffer",
      keyword_length = 3
    },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
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
        -- gh_issues = "[gh]"
      }
    })
  },
  experimental = {
    -- native_menu = true,
    ghost_text = true,
  }
})




vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
