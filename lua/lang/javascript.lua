-- [nfnl] Compiled from fnl/lang/javascript.fnl by https://github.com/Olical/nfnl, do not edit.
vim.lsp.config("tsserver", {cmd = {"typescript-language-server", "--stdio"}, filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"}, root_markers = {"tsconfig.json", "jsconfig.json", "package.json", ".git"}})
if not require("mason-registry").is_installed("typescript-language-server") then
  vim.cmd(("MasonInstall" .. " " .. "typescript-language-server"))
else
end
vim.lsp.enable("tsserver")
vim.lsp.config("astro-language-server", {cmd = {"astro-ls", "--stdio"}, filetypes = {"astro"}, init_options = {typescript = {tsdk = "./node_modules/typescript/lib"}}, root_markers = {"astro.config.mjs"}})
if not require("mason-registry").is_installed("astro-language-server") then
  vim.cmd(("MasonInstall" .. " " .. "astro-language-server"))
else
end
return vim.lsp.enable("astro-language-server")
