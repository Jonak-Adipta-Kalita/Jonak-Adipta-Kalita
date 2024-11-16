vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = "a"
vim.opt.encoding = "utf-8"
vim.opt.completeopt = vim.o.completeopt:gsub("preview", "")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				vim.cmd([[colorscheme tokyonight-night]])
			end,
		},
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			build = "cd app && yarn install",
			init = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		},
		{
			"vim-airline/vim-airline",
		},
		{
			"preservim/nerdtree"
		},
		{
			"ap/vim-css-color"
		},
		{
			"ryanoasis/vim-devicons",
		},
		{
			"terryma/vim-multiple-cursors",
		}
	},

	ui = {
		border = "double",
		size = {
			width = 0.8,
			height = 0.8,
		},
	},
})


vim.g.NERDTreeDirArrowExpandable = "+"
vim.g.NERDTreeDirArrowCollapsible = "~"

vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
