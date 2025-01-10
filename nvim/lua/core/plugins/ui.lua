return {
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        keys = {
            { "<C-n>", "<cmd>NvimTreeFindFileToggle<CR>" }
        },
        config = function()
            vim.g.luaded_netrw = true
            vim.g.luaded_netrwPlugin = true

            require("nvim-tree").setup()
        end
    },
    {
        "nvim-tree/nvim-web-devicons"
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            local lazy_status = require("lazy.status")
            require("lualine").setup({
                options = {
                    theme = "auto"
                },
                sections = {
                    lualine_a = {
                        {
                            lazy_status.updates,
                            cond = lazy_status.has_updates,
                            color = { fg = "#ff9e64" }
                        },
                        { "encoding" },
                        { "fileformat" },
                        { "filetype" },
                    }
                }
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "cpp", "rust", "lua", "java", "bash", "cmake", "vim", "vimdoc", "query", "latex", "glsl", "typescript" },

                sync_install = false,
                auto_install = true,

                highlight = {
                    enable = true,
                }
            })
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<CR>" },
            { "<leader>fg", "<cmd>Telescope live_grep<CR>" },
            { "<leader>fb", "<cmd>Telescope buffers<CR>" },
            { "<leader>fh", "<cmd>Telescope help_tags<CR>" },
            { "<leader>ftd", "<cmd>TodoTelescope <CR>" }
        }
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    diagnostics = "nvim_lsp",
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            highlight = "Directory",
                            separator = true
                        }
                    }
                }
            })
            vim.keymap.set("n", "<leader>blp", ":BufferLinePick<CR>")
        end
    },
    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup({
                auto_load = true,
                close_on_bdelete = true,
                syntax = true,
                theme = "dark",
                update_on_change = true,
                app = "browser",
                filetype = { "markdown" },
                throttle_at = 200000,
                throttle_time = "auto"
            })
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end
    },
    {
        "tanvirtin/vgit.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>gdf", "<cmd>VGit project_diff_preview<CR>" }
        },
        config = function()
            vim.o.updatetime = 300
            vim.o.incsearch = false
            vim.wo.signcolumn = "yes"

            require("vgit").setup()
        end
    }
}
