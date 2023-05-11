local map = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true, noremap = true })
end

local unmap = function(key)
    local modes = { "n", "v", "s", "c" }
    map(modes, key, "<nop>")
    -- vim.keymap.del(modes, key)
end

local munmap = function(key)
    local modes = { "n", "v", "s" }
    map(modes, key, "<nop>")
end

local allmap = function(lhs, rhs)
    map({ "i", "n", "v", "s" }, lhs, rhs)
end

local cmap = function(lhs, rhs)
    map({ "n", "v", "s" }, lhs, rhs)
end
-- maps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- sensible navigation
cmap("j", "k")
cmap("k", "j")
map("n", "<Space>", "<Nop>", { silent = true })
map("n", "<S-Up>", "v<Up>")
map("n", "<S-Down>", "v<Down>")
map("n", "<S-Left>", "v<Left>")
map("n", "<S-Right>", "v<Right>")
map("v", "<S-Up>", "<Up>")
map("v", "<S-Down>", "<Down>")
map("v", "<S-Left>", "<Left>")
map("v", "<S-Right>", "<Right>")
map("i", "<S-Up>", "<Esc>v<Up>")
map("i", "<S-Down>", "<Esc>v<Down>")
map("i", "<S-Left>", "<Esc>v<Left>")
map("i", "<S-Right>", "<Esc>v<Right>")

-- clipboard
map("v", "<C-c>", "y<Esc>i")
map("v", "<C-x>", "d<Esc>i")
allmap("<C-v>", "pi")
map("i", "<C-v>", "<Esc>pi")
munmap("p")
munmap("x")
munmap("y")
map("n", "<BS>", "dd")
map("v", "<BS>", "d")
cmap("<C-z>", "u")
cmap("<C-y>", "<CMD>redo<CR>")

cmap("<A-Left>", "b")
cmap("<A-Right>", "w")
cmap("˙", "b")
cmap("¬", "w")
cmap("<C-h>", "^")
cmap("<C-l>", "$")
map("i", "<A-Left>", "<Esc>b")
map("i", "<A-Right>", "<Esc>w")
map("i", "<C-Left>", "<Esc>^")
map("i", "<C-Right>", "<Esc>$")
  
-- cmap("<C-.>", "<CMD>vim.lsp.buf.format()<CR>")
-- move across windows
allmap("<C-{>", "<C-W><C-H>")
allmap("<C-}>", "<C-W><C-L>")

-- toggle terminal
unmap("<C-t>")
allmap("<C-`>", "<CMD>lua require('FTerm').toggle()<CR>")
map("t", "<C-`>", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")

-- hide search highlight
cmap("<leader>\\", "<CMD>nohl<CR>")

-- tree
allmap("<C-e>", "<CMD>NvimTreeFocus<CR>")

-- close buffer
allmap("<C-w>", "<CMD>:bp | sp | bn | bd!<CR>")

-- lazygit
map("n", "<leader>g", "<CMD>LazyGit<CR>")
-- COC

vim.keymap.set("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : '<TAB>'",
    { noremap = true, silent = true, expr = true })
vim.keymap.set("i", "<S-TAB>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'", { noremap = true, expr = true })
vim.keymap.set("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'",
    { silent = true, expr = true, noremap = true })
-- vim.keymap.set("i", "<CR>", 'coc#pum#visible() ? coc#pum#confirm() : "<CR>"', {noremap = true, expr = true, silent = true})


vim.keymap.set("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })

vim.keymap.set("n", "K", ":call CocActionAsync('doHover')<CR>", { silent = true, noremap = true })
vim.keymap.set({ "n", "i" }, "<C-d>", "<Plug>(coc-definition)", { silent = true })
vim.keymap.set({ "n", "i" }, "<C-.>", "<Plug>(coc-codeaction)", {})
vim.keymap.set({ "n", "i" }, "<C-r>", "<Plug>(coc-rename)", {})

-- comment.nvim
-- unmap("<C-g>")
-- map("i", "<C-g>", "<Esc>gcc<CR>")
-- map("v", "<leader>/", "gc")
-- map("n", "<leader>/", "gcc")
-- map("v", "<C-A-/>", "gb")
-- map("n", "<C-A-/>", "gb")

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", telescope.find_files)
vim.keymap.set("n", "<C-f>", telescope.live_grep)


-- nvim-tree
-- <C-e> to focus (or toggle)

-- window navigation
-- control hjkl between windows
-- control \ to split vertically and move file to that window

-- general navigation
-- all modes ctrl d deletes
-- v/n hukj for movement
-- v/n ctrl hukj moved faster
-- V alt hukj to move lines
--
-- find the live update for line/block visual update replace
-- look through lazy nvim, neovim boilerplate to yank more controls

-- ctrl c to copy
-- ctrl v to paste
-- ctrl x to cut
-- ctrl z to undo
-- ctrl shift z to redo



-- need EASY lsp commands



-- use leader probably for some more command-palette type stuff

