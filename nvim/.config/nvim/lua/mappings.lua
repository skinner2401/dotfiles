vim.api.nvim_set_keymap( 'n', '<C-e>', ':NERDTreeToggle<CR>', {})
vim.api.nvim_set_keymap( 'n', ',<space>', ':nohlsearch<CR>', { silent = true })
vim.api.nvim_set_keymap( 'n', '<C-A>', ':source ~/.config/nvim/init.lua<CR>:PlugInstall<CR>:PlugClean<CR>', { nowait = true })
vim.api.nvim_set_keymap( 'n', '<C-p>', ':GFiles<CR>', { nowait = true, silent = true })
vim.api.nvim_set_keymap( 'n', '<Leader><C-p>', ':FZF<CR>', { nowait = true, silent = true })
vim.api.nvim_set_keymap( 'n', '<Leader>e', ':Ex<CR>', { nowait = true, silent = true })

-- vim <-> tmux navigation
vim.cmd('let g:tmux_navigator_no_mappings = 1')
vim.api.nvim_set_keymap('n', '<C-h>', ":TmuxNavigateLeft<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ":TmuxNavigateDown<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ":TmuxNavigateUp<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ":TmuxNavigateRight<cr>", { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<c-]>', ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gD', ":lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', ":lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '1gD', ":lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', ":lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g0', ":lua vim.lsp.buf.document_symbol()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gW', ":lua vim.lsp.buf.workspace_symbol()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gd', ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', 'p', '"_dP', { noremap = true })
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { noremap=true, silent=true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap=true, silent=true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap=true, silent=true })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { noremap=true, silent=true })
