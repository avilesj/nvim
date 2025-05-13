-- [nfnl] Compiled from fnl/lang/tailwindcss.fnl by https://github.com/Olical/nfnl, do not edit.
vim.lsp.config("tailwindcss-language-server", {cmd = {"tailwindcss-language-server", "--stdio"}, filetypes = {"elixir", "heex", "eelixir", "eex", "html-eex", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "astro", "typescript.tsx", "html", "svelte"}, settings = {tailwindCSS = {includeLanguages = {eelixir = "html-eex", elixir = "html-eex", heex = "html-eex"}, validate = true, lint = {cssConflict = "warning", invalidApply = "error", invalidScreen = "error", invalidVariant = "error", invalidConfigPath = "error", invalidTailwindDirective = "error", recommendedVariantOrder = "warning"}, classAttributes = {"class", "className", "class:list", "classList", "ngClass"}, experimental = {configFile = {["assets/tailwind.config.js"] = {"lib/**", "assets/**"}, ["src/styles/global.css"] = "src/**", ["tailwind.config.js"] = "src/**"}}}}, root_markers = {"mix.exs", "package.json", "tailwind.config.js", "tailwind.config.ts"}})
vim.lsp.enable("tailwindcss-language-server")
if not require("mason-registry").is_installed("tailwindcss-language-server") then
  return vim.cmd(("MasonInstall" .. " " .. "tailwindcss-language-server"))
else
  return nil
end
