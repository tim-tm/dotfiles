return {
    {
        "williamboman/mason.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = true
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            ensure_installed = {
                "lua_ls",
                "clangd",
                "neocmake",
                "rust_analyzer",
                "jdtls",
                "jsonls",
                "texlab",
                "marksman",
                "ts_ls",
                "zls",
                "pylsp"
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local on_attach = function(_, buf)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
                vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
                vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            end

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }

            lspconfig.clangd.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu"
                }
            }

            lspconfig.neocmake.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }

            lspconfig.jdtls.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }

            lspconfig.jsonls.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }

            lspconfig.texlab.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }

            lspconfig.marksman.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }

            lspconfig.rust_analyzer.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }

            lspconfig.glslls.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }

            lspconfig.ts_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }

            lspconfig.zls.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }

            lspconfig.pylsp.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }
        end
    }
}


