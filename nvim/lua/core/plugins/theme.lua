return {
    {
        "folke/todo-comments.nvim",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true
    },
    -- {
    --     "ficcdaf/ashen.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("ashen").load()
    --     end
    -- },
    {
        "savq/melange-nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "melange"
        end
    }
}
