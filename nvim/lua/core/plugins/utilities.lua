return {
    {
        "akinsho/toggleterm.nvim",
        keys = {
            { "<leader>th", "<cmd>ToggleTerm size=30 direction=horizontal<CR>" },
            { "<leader>tv", "<cmd>ToggleTerm size=100 direction=vertical<CR>" }
        },
        opts = {
            shade_terminals = false,
        }
    },
    {
        "andweeb/presence.nvim",
        opts = {}
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    }
}

