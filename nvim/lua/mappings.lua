vim.api.nvim_set_keymap( 'n', '<C-e>', ':NERDTreeToggle<CR>', {})
vim.api.nvim_set_keymap( 'n', ',<space>', ':nohlsearch<CR>', { silent = true })
vim.api.nvim_set_keymap( 'n', '<C-A>', ':source ~/.config/nvim/init.lua<CR>:PlugInstall<CR>', { nowait = true })
vim.api.nvim_set_keymap( 'n', '<C-p>', ':FZF<CR>', { nowait = true, silent = true })


