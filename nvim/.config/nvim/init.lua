local ok, _ = pcall(require, 'local')
if not ok then
  print("oh dear")
else
  print("hooray")
end
require 'settings'
require 'scripts'
require 'mappings'
require 'vimplug'
require 'lightline'
require 'nerdtree'
require 'lsp'
require 'colorscheme'

