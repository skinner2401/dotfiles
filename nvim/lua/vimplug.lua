vim.cmd([[

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim' " ~/.vimrc.lightline

Plug 'vim-scripts/bash-support.vim' " bash linting
Plug 'artanikin/vim-synthwave84'
Plug 'semibran/vim-colors-synthetic'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'alexghergh/nvim-tmux-navigation'
Plug 'tpope/vim-fugitive'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'L3MON4D3/LuaSnip'

" adds eslint capability to vim
"Plug 'dense-analysis/ale'

call plug#end()

]])
