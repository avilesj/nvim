-- [nfnl] Compiled from fnl/aviles/plugins/neogit.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  return (require("neogit")).setup(opts)
end
local function _2_()
  return vim.cmd.Neogit()
end
return {"NeogitOrg/neogit", dependencies = {"nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim"}, config = _1_, keys = {{"<leader>gg", _2_, desc = "Git"}}}
