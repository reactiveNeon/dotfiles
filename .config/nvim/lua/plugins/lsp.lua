return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- note: diagnostics are not exclusive to lsp servers
            -- so these can be global keybindings
            vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
            vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
            vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }

                    -- these will be buffer-local keybindings
                    -- because they only work if you have an active language server
                    vim.keymap.set('n', "<leader>bf", vim.lsp.buf.format, opts)
                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                end
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

            local default_setup = function(server)
                require("lspconfig")[server].setup({
                    capabilities = lsp_capabilities,
                })
            end

            local lua_ls_setup = function()
                require("lspconfig").lua_ls.setup({
                    capabilities = lsp_capabilities,
                    settings = {
                        Lua = {
                            runtime = {
                                version = 'LuaJIT'
                            },
                            diagnostics = {
                                globals = { 'vim' },
                            },
                            workspace = {
                                library = {
                                    vim.env.VIMRUNTIME,
                                }
                            }
                        }
                    }
                })
            end

            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" },
                handlers = {
                    default_setup,
                    lua_ls = lua_ls_setup,
                }
            })
        end
    },
}
