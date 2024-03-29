-- ripgrep
vim.cmd([[
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --sort-files
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  function! MySearch()
    let grep_term = input("Enter search term: ")
    if !empty(grep_term)
      execute 'silent grep!' grep_term | copen
    else
      echo "Empty search term"
    endif
    redraw!
  endfunction
  command! Search call MySearch()
  nnoremap \ :Search<CR>

  augroup global_search
    autocmd!
    autocmd Filetype * if &ft!="git"|nnoremap K "ayiw :Search<CR><C-r>a<CR>|endif
    autocmd Filetype * if &ft!="git"|vnoremap K "ay :Search<CR>'<C-r>a'<CR>|endif
  augroup end
endif

]])
