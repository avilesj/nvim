-- [nfnl] Compiled from fnl/aviles/plugins/gh.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return (require("litee.lib")).setup
end
local function _2_()
  return (require("litee.gh")).setup
end
return {{"ldelossa/gh.nvim", dependencies = {{"ldelossa/litee.nvim", config = _1_}}, config = _2_}}
