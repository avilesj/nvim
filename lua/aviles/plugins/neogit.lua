-- [nfnl] Compiled from fnl/aviles/plugins/neogit.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local neogit = require("neogit")
  return neogit:open({cwd = "."})
end
return {"NeogitOrg/neogit", dependencies = {"nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim"}, opts = {}, keys = {{"<leader>gg", _1_, desc = "Git"}}}
