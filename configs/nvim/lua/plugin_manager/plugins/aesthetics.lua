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

	{
		"ap/vim-css-color",
	},
	{
		"terryma/vim-multiple-cursors",
		lazy = true,
	},
	{
		"wakatime/vim-wakatime",
		lazy = false
	}
}
