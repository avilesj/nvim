-- [nfnl] Compiled from fnl/lang/csharp.fnl by https://github.com/Olical/nfnl, do not edit.
vim.lsp.config("omnisharp", {cmd = {"omnisharp", "--languageserver", "--hostPID", vim.fn.getpid()}, filetypes = {"cs"}, root_markers = {"*.sln", "*.csproj", "Directory.Build.props", "Directory.Build.targets"}})
if not require("mason-registry").is_installed("omnisharp") then
  vim.cmd(("MasonInstall" .. " " .. "omnisharp"))
else
end
return vim.lsp.enable("omnisharp")
