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
        opts = {
            auto_update = true,
            neovim_image_text = "nvim is the goat",
            main_image = "neovim",
            client_id = "793271441293967371",
            log_level = nil,
            debounce_timeout = 10,
            enable_line_number = true,
            blacklist = {},
            buttons = true,
            file_assets = {},
            show_time = true,

            editing_text = "Editing %s",
            file_explorer_text = "Browsing %s",
            git_commit_text = "Committing changes",
            plugin_manager_text = "Managing plugins",
            reading_text = "Reading %s",
            workspace_text = "Working on %s",
            line_number_text = "Line %s out of %s",
        }
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

