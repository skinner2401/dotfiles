vim.api.nvim_set_keymap( 'n', '<C-e>', ':NERDTreeToggle<CR>', {})
vim.api.nvim_set_keymap( 'n', ',<space>', ':nohlsearch<CR>', { silent = true })
vim.api.nvim_set_keymap( 'n', '<C-A>', ':source ~/.config/nvim/init.lua<CR>:PlugInstall<CR>:PlugClean<CR>', { nowait = true })
vim.api.nvim_set_keymap( 'n', '<C-p>', ':FZF<CR>', { nowait = true, silent = true })
vim.api.nvim_set_keymap( 'n', '<Leader>e', ':Ex<CR>', { nowait = true, silent = true })

-- vim <-> tmux navigation
vim.cmd('let g:tmux_navigator_no_mappings = 1')
vim.api.nvim_set_keymap('n', '<C-h>', ":TmuxNavigateLeft<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ":TmuxNavigateDown<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ":TmuxNavigateUp<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ":TmuxNavigateRight<cr>", { noremap = true, silent = true })
