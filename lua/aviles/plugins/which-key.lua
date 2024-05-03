-- [nfnl] Compiled from fnl/aviles/plugins/which-key.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  do end (require("which-key")).setup()
  do end (require("which-key")).register({{prefix = "<leader>"}, ["<leader>by"] = {name = "+yank"}, ["<leader>c"] = {_ = "which_key_ignore", name = "[C]ode"}, ["<leader>d"] = {i = {e = {vim.diagnostic.open_float, "Show diagnostic [E]rror messages"}, q = {vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list"}}}, ["<leader>h"] = {_ = "which_key_ignore", name = "Git [H]unk"}, ["<leader>l"] = {name = "+lazy/leetcode"}, ["<leader>lc"] = {name = "+Leet"}, ["<leader>r"] = {_ = "which_key_ignore", name = "[R]ename"}, ["<leader>s"] = {_ = "which_key_ignore", name = "[S]earch"}, ["<leader>t"] = {_ = "which_key_ignore", name = "Tree explore"}, ["<leader>w"] = {_ = "which_key_ignore", name = "[W]orkspace"}})
  return (require("which-key")).register({["<leader>h"] = {"Git [H]unk"}}, {mode = "v"})
end
return {{"folke/which-key.nvim", config = _1_, event = "VimEnter"}}
