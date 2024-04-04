return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-o>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true })
                }),
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "luasnip" }
                })
            })
        end
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        event = "InsertEnter"
    },
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    {
        "saadparwaiz1/cmp_luasnip",
        event = "InsertEnter"
    },
    {
        "rafamadriz/friendly-snippets",
        event = "InsertEnter"
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    {
        "simrat39/rust-tools.nvim",
        event = "InsertEnter",
        config = function()
            local rt = require("rust-tools")

            rt.setup({
                server = {
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    on_attach = function(_, bufnr)
                    vim.keymap.set("n", "<leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
                    vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                    end,
                },
                tools = {
                    hover_actions = {
                        auto_focus = true
                    }
                }
            })
        end
    }
}

