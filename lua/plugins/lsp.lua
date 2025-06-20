return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'saghen/blink.cmp',
            'nvim-telescope/telescope.nvim' -- Add telescope as dependency
        },
        config = function()
            local lspconfig = require("lspconfig")

            local function go_to_definition_with_telescope()
                local params = vim.lsp.util.make_position_params(0, 'utf-8')
                vim.lsp.buf_request(0, 'textDocument/definition', params, function(err, result, _, _)
                    if err then
                        vim.notify('Error getting definition: ' .. err.message, vim.log.levels.ERROR)
                        return
                    end
                    if not result or vim.tbl_isempty(result) then
                        vim.notify('No definition found', vim.log.levels.INFO)
                        return
                    end
                    if #result == 1 then
                        vim.lsp.util.show_document(result[1], 'utf-8')
                    else
                        require('telescope.builtin').lsp_definitions()
                    end
                end)
            end

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(ev)
                    local bufnr = ev.buf
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    local opts = { buffer = bufnr, noremap = true, silent = true }

                    vim.keymap.set('n', 'gd', go_to_definition_with_telescope, opts)
                    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
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
                            -- Recognize the vim global
                            globals = { "vim" },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = {
                                vim.env.VIMRUNTIME,
                                "${3rd}/luv/library", -- For vim.loop
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
