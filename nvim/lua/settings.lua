-- os clipboard support
vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"

-- / search settings
vim.opt.hlsearch = true
-- display search matches in each window as you type
vim.opt.incsearch = true

vim.opt.ignorecase = true

-- display line numbers
vim.opt.number = true

-- line wrapping
vim.opt.whichwrap = vim.opt.whichwrap + "<,>,h,l,[,]"

-- add fzf to the runtime path
vim.opt.rtp = vim.opt.rtp + "/usr/local/opt/fzf"

-- when switching between buffers, automatically save 
-- modifications to the buffer's window
vim.opt.autowriteall = true

-- intuit how to indent
vim.opt.smartindent = true

-- allow more buffer editing
-- when backspacing from the start of a line
-- when deleting from the end of a line
-- when editing from a current spot
vim.opt.backspace = "indent,eol,start"

-- On pressing tab, insert 2 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 2

-- disable vim swap file
--vim.opt.noswapfile = true

-- jump to next/previous linting error
-- nmap <silent> [c <Plug>(ale_previous_wrap)
-- nmap <silent> ]c <Plug>(ale_next_wrap)
-- 
-- -- F6 is now auto-indent
-- nmap <F6> <Plug>(ale_fix)
--
vim.opt.termguicolors = tue

vim.cmd([[
autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
]])



