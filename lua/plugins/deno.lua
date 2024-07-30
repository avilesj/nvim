-- [nfnl] Compiled from fnl/plugins/deno.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  if (type(opts.ensure_installed) == "table") then
    return vim.list_extend(opts.ensure_installed, {"typescript", "tsx"})
  else
    return nil
  end
end
return {{"nvim-treesitter/nvim-treesitter", opts = _1_}, {"neovim/nvim-lspconfig", opts = {servers = {denols = {setup = {settings = {deno = {enable = true, suggest = {autoImports = true, completeFunctionCalls = true, imports = {autoDiscover = true, hosts = {["https://crux.land"] = true, ["https://deno.land"] = true, ["https://x.nest.land"] = true}}, names = true, paths = true}}, root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")}}}}}}}
