-- [nfnl] Compiled from fnl/lang/docker.fnl by https://github.com/Olical/nfnl, do not edit.
vim.lsp.config("composelsp", {cmd = {"docker-compose-langserver", "--stdio"}, filetypes = {"yaml"}, root_markers = {"docker-compose.yml", "docker-compose.yaml", "compose.yaml", "compose.yml"}})
if not require("mason-registry").is_installed("docker-compose-language-service") then
  vim.cmd(("MasonInstall" .. " " .. "docker-compose-language-service"))
else
end
return vim.lsp.enable("composelsp")
