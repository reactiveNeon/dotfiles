local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = true}),
  }
})

local lsp = require('lsp-zero').preset("recommended")

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require('lspconfig').denols.setup({
  single_file_support = true,
  filetypes = { "javascript", "typescript" },
})

lsp.setup()
