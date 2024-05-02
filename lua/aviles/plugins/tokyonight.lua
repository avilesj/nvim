-- [nfnl] Compiled from fnl/aviles/plugins/tokyonight.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.cmd.colorscheme("tokyonight-night")
  return vim.cmd.hi("Comment gui=none")
end
return {{"folke/tokyonight.nvim", init = _1_, priority = 1000}}
