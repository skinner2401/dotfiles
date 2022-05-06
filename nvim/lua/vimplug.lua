require('vimplug-pre')

vim.cmd([[
" installs vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
]])

vim.cmd([[
call plug#begin('~/.vim/plugged')
]])

vim.cmd([[
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
"
"   " Any valid git URL is allowed
"   Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"   " Multiple Plug commands can be written in a single line using | separators
"   Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"   " On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"   Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"   " Using a non-master branch
"   Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
"   " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"   Plug 'fatih/vim-go', { 'tag': '*' }
"
"   " Plugin options
"   Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'"
"   " Unmanaged plugin (manually installed and updated)
"   Plug '~/my-prototype-plugin'
"
"   " Initialize plugin system
Plug 'itchyny/lightline.vim' " ~/.vimrc.lightline
Plug 'xolox/vim-notes'       " ~/.vimrc.vimnotes
Plug 'xolox/vim-misc'        " <none>
Plug 'vim-scripts/bash-support.vim' " bash linting
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'artanikin/vim-synthwave84'
Plug 'semibran/vim-colors-synthetic'
Plug 'typescript-eslint/typescript-eslint'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim'
Plug 'christoomey/vim-tmux-navigator'

" adds eslint capability to vim
Plug 'dense-analysis/ale'

call plug#end()

" Then reload .vimrc and :PlugInstall to install plugins.
"
" Plug options:
"

]])

require ('vimplug-post')
