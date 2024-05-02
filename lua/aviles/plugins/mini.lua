-- [nfnl] Compiled from fnl/aviles/plugins/mini.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  do end (require("mini.ai")).setup({n_lines = 500})
  do end (require("mini.surround")).setup()
  local statusline = require("mini.statusline")
  statusline.setup({use_icons = vim.g.have_nerd_font})
  statusline.section_location = function()
    return "%2l:%-2v"
  end
  return statusline.section_location
end
return {{"echasnovski/mini.nvim", config = _1_}}
