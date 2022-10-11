local cmd = vim.cmd
local lsp_installer = require 'nvim-lsp-installer'

require('lspfuzzy').setup {}

lsp_installer.on_server_ready(function(server)
    local opts = {}

    server:setup(opts)
    cmd [[ do User LspAttachBuffers ]]
end)
