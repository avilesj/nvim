-- [nfnl] Compiled from fnl/plugins/harpoon.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local keys
  local function _2_()
    return require("harpoon"):list():add()
  end
  local function _3_()
    local harpoon = require("harpoon")
    return harpoon.ui:toggle_quick_menu(harpoon:list())
  end
  keys = {{"<leader>H", _2_, desc = "Harpoon File"}, {"<leader>h", _3_, desc = "Harpoon Quick Menu"}}
  for i = 1, 5 do
    local function _4_()
      return require("harpoon"):list():select(i)
    end
    table.insert(keys, {("<leader>" .. i), _4_, desc = ("Harpoon to File " .. i)})
  end
  return keys
end
return {"ThePrimeagen/harpoon", branch = "harpoon2", keys = _1_, opts = {menu = {width = (vim.api.nvim_win_get_width(0) - 4)}, settings = {save_on_toggle = true}}}
