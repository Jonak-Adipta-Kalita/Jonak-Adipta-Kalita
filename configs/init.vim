:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " Markdown Preview
Plug 'https://github.com/folke/tokyonight.nvim' " TokyoNight Theme
" Mason
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

set encoding=UTF-8

call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>

colorscheme tokyonight-night

:set completeopt-=preview" For No Previews

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"


lua << EOF
	require("mason").setup({
		ui = {
		  border = "rounded", -- Optional: adds rounded borders to Mason UI
		}
	})
	require("mason-lspconfig").setup({
	  ensure_installed = { "clangd" },
	})

	local lspconfig = require("lspconfig")
	require("mason-lspconfig").setup_handlers({
	  function(server_name)
		lspconfig[server_name].setup({})
	  end,
	})
EOF

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
