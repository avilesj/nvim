-- [nfnl] Compiled from fnl/lang/elixir.fnl by https://github.com/Olical/nfnl, do not edit.
vim.lsp.config("elixir-ls", {cmd = {"elixir-ls"}, filetypes = {"elixir"}, root_markers = {"mix.exs"}})
vim.lsp.enable("elixir-ls")
return require("nvim-treesitter.install").ensure_installed({"heex", "eex"})
