" my vim settings
source ~/.vimrc.settings
" my vim scripts
source ~/.vimrc.scripts

" loads key mappings
" good refresher / tutorial here:
" https://medium.com/vim-drops/understand-vim-mappings-and-create-your-own-shortcuts-f52ee4a6b8ed
source ~/.vimrc.mappings

" plugin stuff, I use vim-plug as my plugin manager,
" very easy to use and scriptable
" https://github.com/junegunn/vim-plug
source ~/.vimrc.vimplug

" Individual plugin configurations separated for organization
source ~/.vimrc.splitnav
source ~/.vimrc.easyalign
source ~/.vimrc.lightline
source ~/.vimrc.nerdtree
source ~/.vimrc.fzf.vim
source ~/.vimrc.tmuxsplits


let uname = substitute(system('uname'),'\n','','')
if uname == 'Linux'
  let lines = readfile("/proc/version")
  if lines[0] =~ "Microsoft"
    source ~/.vimrc.wsl
  endif
endif
