-- [nfnl] Compiled from fnl/plugins/fennel.fnl by https://github.com/Olical/nfnl, do not edit.
do local _ = {{"nvim-treesitter/nvim-treesitter", opts = {ensure_installed = {"fennel"}}}, {"neovim/nvim-lspconfig", opts = {servers = {fennel_ls = {filetypes = {"fennel"}, settings = {Lua = {diagnostics = {globals = {"vim", "jit"}}}}}}, fennel_language_server = {filetypes = {"fennel"}, settings = {fennel = {diagnostics = {globals = {"vim", "jit"}}}}}}}} end
return {{"nvim-treesitter/nvim-treesitter", opts = {ensure_installed = {"fennel"}}}, {"neovim/nvim-lspconfig", opts = {servers = {fennel_ls = {filetypes = {"fennel"}, settings = {Lua = {diagnostics = {globals = {"vim", "jit"}}}}}, fennel_language_server = {filetypes = {"fennel"}, settings = {fennel = {diagnostics = {globals = {"vim", "jit"}}}}}}}}}
