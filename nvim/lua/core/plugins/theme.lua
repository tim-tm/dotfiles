return {
    {
        "folke/todo-comments.nvim",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true
    },
    {
        "ribru17/bamboo.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("bamboo").setup({
                code_style = {
                    functions = { bold = true }
                }
            })
            require("bamboo").load()
        end,
    }
}
