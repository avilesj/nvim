-- [nfnl] Compiled from fnl/lang/fennel.fnl by https://github.com/Olical/nfnl, do not edit.
vim.lsp.config("fennel-ls", {cmd = {"fennel-ls"}, filetypes = {"fennel"}, root_markers = {"flsproject.fnl"}})
return vim.lsp.enable("fennel-ls")
