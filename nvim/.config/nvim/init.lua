--print("starting")
local ok, _ = pcall(require, 'local')
if not ok then
  print("oh no")
  --print("no local lua settings")
else
  print("oh yes")
  --print("loading local lua settings")
end
require 'settings'
require 'scripts'
require 'mappings'
require 'vimplug'
require 'lightline'
require 'nerdtree'
require 'lsp'
require 'colorscheme'
