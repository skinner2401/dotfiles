let scriptPath = fnamemodify(resolve(expand('<sfile>:p')), ':h')

"echo "blah1"
"echo scriptPath
"echo "blah2"
"echo "vimruntime"
"echo $VIMRUNTIME
"echo "vim"
"echo $VIM

" my vim settings
exec "source " . scriptPath . "/.vimrc.settings"
" my vim scripts
exec "source " . scriptPath . "/.vimrc.scripts"

" loads key mappings
" good refresher / tutorial here:
" https://medium.com/vim-drops/understand-vim-mappings-and-create-your-own-shortcuts-f52ee4a6b8ed
exec "source " . scriptPath . "/.vimrc.mappings"

" " plugin stuff, I use vim-plug as my plugin manager,
" " very easy to use and scriptable
" " https://github.com/junegunn/vim-plug
exec "source " . scriptPath . "/.vimrc.vimplug"
" 
" " Individual plugin configurations separated for organization
exec "source " . scriptPath . "/.vimrc.splitnav"
exec "source " . scriptPath . "/.vimrc.easyalign"
exec "source " . scriptPath . "/.vimrc.lightline"
exec "source " . scriptPath . "/.vimrc.nerdtree"
exec "source " . scriptPath . "/.vimrc.fzf.vim"
exec "source " . scriptPath . "/.vimrc.tmuxsplits"

let uname = substitute(system('uname'),'\n','','')
if uname == 'Linux'
  let lines = readfile("/proc/version")
  if lines[0] =~ "Microsoft"
    exec "source " . scriptPath . "/.vimrc.wsl"
  endif
endif
