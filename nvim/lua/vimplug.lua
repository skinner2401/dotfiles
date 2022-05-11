vim.cmd([[
"setup vim-plug {{{

  "Note: install vim-plug if not present
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif

  "Note: Skip initialization for vim-tiny or vim-small.
  if !1 | finish | endif
  if has('vim_starting')
    set nocompatible               " Be iMproved
    " Required:
    call plug#begin()
  endif

"}}}

" installs vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'"

Plug 'itchyny/lightline.vim' " ~/.vimrc.lightline

"Plug 'xolox/vim-misc'        " <none>
"Plug 'xolox/vim-notes'       " ~/.vimrc.vimnotes
Plug 'vim-scripts/bash-support.vim' " bash linting
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'artanikin/vim-synthwave84'
Plug 'semibran/vim-colors-synthetic'
"Plug 'typescript-eslint/typescript-eslint'
"Plug 'sheerun/vim-polyglot'
"Plug 'neoclide/coc.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'

" adds eslint capability to vim
Plug 'dense-analysis/ale'

call plug#end()

]])
