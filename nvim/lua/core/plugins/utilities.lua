return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
	{
		"lervag/vimtex",
		lazy = false,
		config = function()
			vim.g.vimtex_compiler_latexmk = {
				out_dir = "build",
				options = {
					"-shell-escape",
					"-verbose",
					"-file-line-error",
					"-interaction=nonstopmode",
					"-synctex=1",
				},
			}
			vim.g.vimtex_view_method = "zathura"
		end,
	},
}
