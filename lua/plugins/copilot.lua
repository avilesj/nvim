-- [nfnl] Compiled from fnl/plugins/copilot.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return require("copilot").setup({suggestion = {enabled = false}, panel = {enabled = false}})
end
return {"zbirenbaum/copilot.lua", cmd = "Copilot", config = _1_}
