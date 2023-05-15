require("raf.packer")

require("raf.keymap")
require("raf.config")

require("raf.plugins.bufferline")
require("raf.plugins.lualine")
require("raf.plugins.nvim-tree")
require("raf.plugins.tree-sitter")
-- require("raf.plugins.coc")
require("raf.plugins.lspsaga")
require("raf.plugins.term")
require("raf.plugins.notify")
require("raf.plugins.autopairs")
require("raf.plugins.comment")
require("raf.plugins.lsp")

require("startup").setup({theme = "dashboard"})


vim.g.sonokai_style = "andromeda"
vim.g.sonokai_better_performance = 1
vim.cmd.colorscheme("sonokai")
