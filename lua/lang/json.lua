-- [nfnl] Compiled from fnl/lang/json.fnl by https://github.com/Olical/nfnl, do not edit.
vim.lsp.config("json-lsp", {cmd = {"vscode-json-language-server", "--stdio"}, filetypes = {"json"}, settings = {json = {format = {enable = true}, validate = {enable = true}}}})
if not require("mason-registry").is_installed("json-lsp") then
  vim.cmd(("MasonInstall" .. " " .. "json-lsp"))
else
end
return vim.lsp.enable("json-lsp")
