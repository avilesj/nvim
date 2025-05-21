-- [nfnl] Compiled from fnl/lang/elixir.fnl by https://github.com/Olical/nfnl, do not edit.
vim.lsp.config("elixir-ls", {cmd = {"elixir-ls"}, filetypes = {"elixir", "heex", "eelixir", "eex", "html-eex"}, root_markers = {"mix.exs"}})
if not require("mason-registry").is_installed("elixir-ls") then
  vim.cmd(("MasonInstall" .. " " .. "elixir-ls"))
else
end
vim.lsp.enable("elixir-ls")
return require("nvim-treesitter.install").ensure_installed({"heex", "eex"})
