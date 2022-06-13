local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
local lspconfig = require("lspconfig")

local function on_attach(client, bufnr)
    -- set up buffer keymaps, etc.
end

lspconfig.sumneko_lua.setup {}
lspconfig.tsserver.setup {}

--lsp_installer.on_server_ready(function(server)
--  local opts = {
--    on_attach = require("lsp.handlers").on_attach,
--    capabilities = require("lsp.handlers").capabilities,
--  }
--
--  if server.name == "jsonls" then
--    local jsonls_opts = require("lsp.settings.jsonls")
--    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
--  end
--
--  if server.name == "sumneko_lua" then
--    local sumneko_opts = require("lsp.settings.sumneko_lua")
--    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
--  end
--
--  server:setup(opts)
--end)
--
