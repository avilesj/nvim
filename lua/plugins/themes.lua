-- [nfnl] Compiled from fnl/plugins/themes.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  require("tokyonight").setup({styles = {comments = {italic = false}}})
  return vim.cmd.colorscheme("tokyonight-night")
end
return {"folke/tokyonight.nvim", config = _1_, priority = 1000}
