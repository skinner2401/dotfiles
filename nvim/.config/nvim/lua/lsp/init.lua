local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
        return
end

require("lsp.lsp-installer")
require("lsp.cmp")
require('lsp.fnsignature')
require("lsp.handlers")
