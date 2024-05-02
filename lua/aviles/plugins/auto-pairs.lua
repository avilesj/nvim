-- [nfnl] Compiled from fnl/aviles/plugins/auto-pairs.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.g.minipairs_disable = not vim.g.minipairs_disable
  if vim.g.minipairs_disable then
    return print("Disabled auto pairs", {title = "Option"})
  else
    return print("Enabled auto pairs", {title = "Option"})
  end
end
return {{"echasnovski/mini.pairs", event = "VeryLazy", keys = {{"<leader>up", _1_, desc = "Toggle Auto Pairs"}}, opts = {mappings = {["`"] = {action = "closeopen", neigh_pattern = "[^\\`].", pair = "``", register = {cr = false}}}}}}
