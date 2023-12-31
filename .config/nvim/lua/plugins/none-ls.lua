return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            require("null-ls").setup()
        end
    },
    {
        -- note: this might break, cuz of dependency on null-ls which is as of now archived
        -- read this (last section) if that happens, https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                handlers = {},
            })
        end
    },
}
