return {
    {
        "folke/todo-comments.nvim",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true
    },
    {
        "luisiacc/gruvbox-baby",
        lazy = false,
        setup = {},
        config = function ()
            vim.o.termguicolors = true
            vim.g.gruvbox_baby_background_color = "dark"
            vim.cmd [[ colorscheme gruvbox-baby ]]
        end
    }
}
