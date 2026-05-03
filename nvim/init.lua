vim.g.mapleader = " "

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.tabstop = 8
vim.o.softtabstop = 0
vim.o.list = true
vim.opt.listchars = { tab = ">~" }
vim.o.swapfile = false
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<C-s>", ":wa<CR>")
vim.keymap.set("n", "<C-q>", ":wqa<CR>")
vim.keymap.set("n", "<leader>.", ":t.<CR>")
vim.keymap.set("n", "<leader>n", ":bnext<CR>")
vim.keymap.set("n", "<leader>p", ":bprevious<CR>")
vim.keymap.set("n", "<leader><tab>", ":bnext<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")
vim.keymap.set({ "n", "v", "x" }, "<leader>y", "\"+y")

vim.pack.add({
    { src = "https://github.com/savq/melange-nvim" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/Saghen/blink.cmp",     version = "v1.10.2" },
})

require("mini.pick").setup()
require("blink.cmp").setup({
    keymap = {
        preset = "default",
        ["<C-CR>"] = { "select_and_accept" },
    },
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
    },
    fuzzy = {
        prebuilt_binaries = {
            download = false,
        }
    }
})

vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")
vim.keymap.set("n", "<leader>fb", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>fg", ":Pick grep_live<CR>")

vim.lsp.enable({
    "lua_ls",
    "ruff",
    "clangd",
    "tinymist",
    "rust_analyzer",
    "nil_ls",
    "texlab",
    "html",
    "denols",
    "jdtls",
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    }
})
vim.lsp.config("tinymist", {
    settings = {
        formatterMode = "typstyle",
    }
})
vim.lsp.config("nil_ls", {
    settings = {
        formatting = {
            command = { "nixfmt" }
        }
    }
})
vim.lsp.config("jdtls", {
    init_options = {
        jvm_args = { "-Xms256M", "-Xmx512M" }
    }
})
vim.keymap.set("n", "<leader>mp", vim.lsp.buf.format)

vim.b.virtual_lines_enabled = vim.b.virtual_lines_enabled or false
vim.diagnostic.config({ virtual_lines = vim.b.virtual_lines_enabled })

vim.keymap.set("n", "<leader>l", function()
    vim.b.virtual_lines_enabled = not vim.b.virtual_lines_enabled
    vim.diagnostic.config({ virtual_lines = vim.b.virtual_lines_enabled })
end)

vim.cmd("colorscheme melange")
