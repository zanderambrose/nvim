return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'saghen/blink.cmp'
        },
        config = function()
            local lspconfig = require("lspconfig")

            -- Set up global on_attach logic for all LSPs
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(ev)
                    local bufnr = ev.buf
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)

                    local opts = { buffer = bufnr, noremap = true, silent = true }

                    -- LSP Keymaps
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                    -- References keymap is set in telescope
                    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<leader>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)

                    -- Example: disable formatting if using a separate formatter
                    if client.name == "tsserver" then
                        client.server_capabilities.documentFormattingProvider = false
                    end
                end,
            })

            -- Lua LSP
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the server you're using Neovim's Lua
                            version = "LuaJIT",
                            path = vim.split(package.path, ";"),
                        },
                        diagnostics = {
                            -- Recognize the `vim` global
                            globals = { "vim" },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = {
                                vim.env.VIMRUNTIME,
                                "${3rd}/luv/library", -- For `vim.loop`
                                "${3rd}/busted/library", -- For tests, optional
                            },
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            })


            -- TypeScript LSP
            lspconfig.ts_ls.setup({
                filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
                root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
            })

            -- CPP LSP
            lspconfig.clangd.setup({
                filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
                root_markers = { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git" }
            })
        end
    }
}
