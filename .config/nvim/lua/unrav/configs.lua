vim.g.mapleader = " "

local set = vim.opt

--- uncomment this if you don't want winbar plugin
-- vim.cmd([[set winbar=%=%m\ %f]])

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.wrap = false

set.number = true
set.relativenumber = true

set.termguicolors = true

set.scrolloff = 4
set.signcolumn = "yes"

set.autoindent = true
set.smartindent = true

set.guifont = "FiraCode Nerd Font Mono:h12"

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- TODO: what the hell is updatetime??

-- default colorscheme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
