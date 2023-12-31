local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        -- or   branch = "0.1.x",
        dependencies = { {"nvim-lua/plenary.nvim"} }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = {{'nvim-tree/nvim-web-devicons'}},
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },
    "folke/trouble.nvim",
    "nvim-treesitter/playground",
    "nvim-tree/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-tree.lua",
    "mbbill/undotree",
    -- for java lang support
    "mfussenegger/nvim-jdtls",
    -- tpope stuff, yoooo
    "tpope/vim-surround",
    "tpope/vim-commentary",
    -- winbars
    "fgheng/winbar.nvim",
    {
       'akinsho/bufferline.nvim',
       version = "*",
    },
    -- LSP, Autocompletion, Linting
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    },
    -- color schemes
    "ellisonleao/gruvbox.nvim",
    "savq/melange-nvim",
}

local opts = {}

require("lazy").setup(plugins, opts)
