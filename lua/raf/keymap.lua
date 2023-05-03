-- maps
vim.g.mapleader = " "


-- vim native
vim.keymap.set({ "n", "v" }, "j", "k")
vim.keymap.set({ "n", "v" }, "k", "j")
vim.keymap.set("i", "kj", "<esc>")


local telescope = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", telescope.find_files)
-- vim.keymap.set("n", "<C-f>", function()
--   telescope.grep_string({ search = vim.fn.input("Grep > ") })
-- end)

vim.keymap.set("n", "<C-f>", telescope.live_grep)