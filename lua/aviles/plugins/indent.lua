-- [nfnl] Compiled from fnl/aviles/plugins/indent.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local highlight = {"RainbowYellow", "RainbowCyan"}
  local hooks = require("ibl.hooks")
  local function _2_()
    vim.api.nvim_set_hl(0, "RainbowYellow", {fg = "#E5C07B"})
    return vim.api.nvim_set_hl(0, "RainbowCyan", {fg = "#56B6C2"})
  end
  hooks.register(hooks.type.HIGHLIGHT_SETUP, _2_)
  return (require("ibl")).setup({indent = {char = "\226\148\130", highlight = {"RainbowYellow"}, tab_char = "\226\148\130"}, scope = {char = "\226\148\130", highlight = {"RainbowCyan"}}})
end
return {{"lukas-reineke/indent-blankline.nvim", config = _1_, event = "BufEnter", main = "ibl", opts = {}}}
