-- [nfnl] Compiled from fnl/aviles/plugins/copilot.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return (require("copilot_cmp")).setup()
end
return {{"zbirenbaum/copilot.lua", build = ":Copilot auth", cmd = "Copilot", event = "InsertEnter", opts = {filetypes = {help = true, markdown = true, yaml = true}, suggestion = {enabled = false}}}, {"zbirenbaum/copilot-cmp", config = _1_, dependencies = "copilot.lua"}, {"AndreM222/copilot-lualine"}}
