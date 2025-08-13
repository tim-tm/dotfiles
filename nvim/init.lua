vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
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
vim.keymap.set("n", "<C-n>", ":Oil<CR>")
vim.keymap.set({ "n", "v", "x" }, "<leader>y", "\"+y")

vim.pack.add({
	{ src = "https://github.com/savq/melange-nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/Saghen/blink.cmp",     version = vim.version.range("1.0") },
})

require("mini.pick").setup()
require("oil").setup()

require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<C-CR>"] = { "select_and_accept" },
	},
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},
	signature = { enabled = true },
})

local on_attach = function(_, _)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end

local capabilities = require("blink.cmp").get_lsp_capabilities()
local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
	},
})

lspconfig.ruff.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")
vim.keymap.set("n", "<leader>fb", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>fg", ":Pick grep_live<CR>")

vim.lsp.enable({ "lua_ls", "ruff", "clangd" })
vim.keymap.set("n", "<leader>mp", vim.lsp.buf.format)

vim.b.virtual_lines_enabled = vim.b.virtual_lines_enabled or false
vim.diagnostic.config({ virtual_lines = vim.b.virtual_lines_enabled })

vim.keymap.set("n", "<leader>l", function()
	vim.b.virtual_lines_enabled = not vim.b.virtual_lines_enabled
	vim.diagnostic.config({ virtual_lines = vim.b.virtual_lines_enabled })
end)

vim.cmd("colorscheme melange")
