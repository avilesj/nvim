-- [nfnl] Compiled from fnl/plugins/leetcode.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return vim.cmd("Leet")
end
local function _2_()
  return vim.cmd("Leet test")
end
local function _3_()
  return vim.cmd("Leet menu")
end
local function _4_()
  return vim.cmd("Leet reset")
end
local function _5_()
  return vim.cmd("Leet submit")
end
local function _6_()
  return vim.cmd("Copilot disable")
end
return {"kawre/leetcode.nvim", build = ":TSUpdate html", cmd = "Leet", dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-treesitter/nvim-treesitter", "rcarriga/nvim-notify", "nvim-tree/nvim-web-devicons"}, keys = {{"<leader>lcl", _1_, desc = "Launch Leet"}, {"<leader>lct", _2_, desc = "Run test"}, {"<leader>lcm", _3_, desc = "Menu"}, {"<leader>lcr", _4_, desc = "Reset"}, {"<leader>lcs", _5_, desc = "Submit"}}, lazy = true, opts = {hooks = {enter = {_6_}}, injector = {golang = {before = "package main"}}, lang = "golang"}}
