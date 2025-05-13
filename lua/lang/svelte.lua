-- [nfnl] Compiled from fnl/lang/svelte.fnl by https://github.com/Olical/nfnl, do not edit.
vim.lsp.config("svelte", {cmd = {"svelteserver", "--stdio"}, filetypes = {"svelte"}, root_markers = {"tsconfig.json", "jsconfig.json", "package.json", ".git"}})
if not require("mason-registry").is_installed("svelte-language-server") then
  vim.cmd(("MasonInstall" .. " " .. "svelte-language-server"))
else
end
return vim.lsp.enable("svelte")
