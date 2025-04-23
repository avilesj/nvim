-- [nfnl] Compiled from fnl/lang/python.fnl by https://github.com/Olical/nfnl, do not edit.
vim.lsp.config("pyright", {cmd = {"pyright-langserver", "--stdio"}, filetypes = {"python"}, settings = {python = {analysis = {autoSearchPaths = true, useLibraryCodeForTypes = true}}}, root_markers = {"Pipfile", "pyrightconfig.json"}})
if not require("mason-registry").is_installed("pyright") then
  vim.cmd(("MasonInstall" .. " " .. "pyright"))
else
end
return vim.lsp.enable("pyright")
