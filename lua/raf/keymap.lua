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
map("n", "<Space>", "<Nop>")
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
map("i", "kj", "<Esc>")
map("n", "<A-Tab>", "<CMD>bnext<CR>")
map("n", "<S-A-Tab>", "<CMD>bprev<CR>")
map("i", "˙", "<Esc>bi")
map("i", "¬", "<Esc>ea")
cmap("˙", "b")
cmap("¬", "e")

map("i", "∆", "<Esc><CMD>move -2<CR>i<Right>")
map("i", "˚", "<Esc><CMD>move +1<CR>i<Right>")
cmap("˚", "<CMD>move +1<CR>")
cmap("∆", "<CMD>move -2<CR>")


cmap("<C-h>", "^")
cmap("<C-l>", "$")

cmap("<A-Left>", "b")
cmap("<A-Right>", "e")
map("i", "<A-Left>", "<Esc>bi")
map("i", "<A-Right>", "<Esc>ea")

map("i", "<C-h>", "<Esc>^i")
map("i", "<C-l>", "<Esc>$a")
map("i", "<C-Left>", "<Esc>^i")
map("i", "<C-Right>", "<Esc>$a")

unmap("<C-j>")

-- clipboard-y things
map("v", "<C-c>", "y<Esc>i")
map("v", "<C-x>", "d<Esc>i")
allmap("<C-v>", "pi")
map("i", "<C-v>", "<Esc>pi")
map("n", "<BS>", "dd")
map("v", "<BS>", "d")
map("i", "<C-z>", "<Esc>ui")
map("i", "<C-y>", "<Esc><CMD>redo<CR>i")
cmap("<C-z>", "u")
cmap("<C-y>", "<CMD>redo<CR>")
munmap("p")
munmap("x")
munmap("y")
munmap("u")

-- window mgmt
allmap("<C-{>", "<C-W><C-H>")
allmap("<C-}>", "<C-W><C-L>")
map("n", "<C-]>", "<CMD>bnext<CR>")
map("n", "<C-[>", "<CMD>bprev<CR>")
allmap("<C-q>", "<CMD>bd!<CR><CMD>bnext<CR>")
map("i", "<C-q>", "<Esc><CMD>bd!<CR><CMD>bnext<CR>")
map("n", "<C-\\>", "<CMD>vsplit<CR><CMD>FocusEqualise<CR><CMD>FocusDisable<CR>")
map("n", "<C-w>", "<C-w>q")
map("n", "<Esc>", "<nop>")

-- toggle terminal
unmap("<C-t>")
allmap("<C-`>", "<CMD>lua require('FTerm').toggle()<CR>")
map("t", "<C-`>", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")

-- hide search highlight
cmap("<leader>\\", "<CMD>nohl<CR>")

-- tree
allmap("<C-e>", "<CMD>NvimTreeFocus<CR>")

-- close buffer
-- allmap("<C-w>", "<CMD>:bp | sp | bn | bd!<CR>")

-- lazygit
map("n", "<leader>g", "<CMD>LazyGit<CR>")

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", telescope.find_files)
vim.keymap.set("n", "<C-f>", telescope.live_grep)

-- coc

-- comment.nvim
-- unmap("<C-g>")
-- map("i", "<C-g>", "<Esc>gcc<CR>")
-- map("v", "<leader>/", "gc")
-- map("n", "<leader>/", "gcc")
-- map("v", "<C-A-/>", "gb")
-- map("n", "<C-A-/>", "gb")


-- cmap("<C-.>", "<CMD>vim.lsp.buf.format()<CR>")



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
