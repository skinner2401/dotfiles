let s:script_path = expand('<sfile>:p') 

echo "blah"
echo "{s:script_path}"
echo "blah"

" my vim settings
source {s:script_path}/.vimrc.settings
" my vim scripts
source {s:script_path}/.vimrc.scripts

" loads key mappings
" good refresher / tutorial here:
" https://medium.com/vim-drops/understand-vim-mappings-and-create-your-own-shortcuts-f52ee4a6b8ed
source {s:script_path}/.vimrc.mappings

" plugin stuff, I use vim-plug as my plugin manager,
" very easy to use and scriptable
" https://github.com/junegunn/vim-plug
source {s:script_path}/.vimrc.vimplug

" Individual plugin configurations separated for organization
source {s:script_path}/vimrc.splitnav
source {s:script_path}/vimrc.easyalign
source {s:script_path}/vimrc.lightline
source {s:script_path}/vimrc.nerdtree
" source .vimrc.fzf.vim
source {s:script_path}/.vimrc.tmuxsplits


let uname = substitute(system('uname'),'\n','','')
if uname == 'Linux' let lines = readfile("/proc/version")
  if lines[0] =~ "Microsoft"
    source {s:script_path}/.vimrc.wsl
  endif
endif
