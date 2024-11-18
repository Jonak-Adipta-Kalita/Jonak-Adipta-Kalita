return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
	{
		"vim-airline/vim-airline",
	},
	{
		"ryanoasis/vim-devicons",
		priority = 500,
	},
	{
		"preservim/nerdtree",
	},
}
