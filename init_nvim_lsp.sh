#!/usr/bin/env bash
# init lsp for nvim (after a clean caches)

# https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

# from this file (and wait in nvim for it to finish)
nvim -c 'LspInstall bashls sumneko_lua gopls yamlls omnisharp terraformls marksman' 

# in nvim
# :LspInstall bashls sumneko_lua gopls yamlls omnisharp terraformls remark_ls

