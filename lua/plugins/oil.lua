-- [nfnl] Compiled from fnl/plugins/oil.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local oil = require("oil")
  local git = require("aviles.util.fs")
  local cwd = vim.fn.getcwd()
  local git_dir = git.find_git_dir()
  local file_path = vim.fn.expand("%:p:h")
  if (git_dir ~= nil) then
    local ___antifnl_rtns_1___ = {oil.open(git_dir)}
    return (table.unpack or _G.unpack)(___antifnl_rtns_1___)
  else
  end
  local file_path_length = string.len(file_path)
  local cwd_length = string.len(cwd)
  if (cwd_length > file_path_length) then
    return oil.open(file_path)
  else
    return oil.open(cwd)
  end
end
local function _4_()
  local oil = require("oil")
  local file_path = vim.fn.expand("%:p:h")
  return oil.open(file_path)
end
local function _5_()
  local oil = require("oil")
  local git_dir = (require("aviles.util.fs")).find_git_dir()
  if (git_dir ~= nil) then
    local ___antifnl_rtns_1___ = {oil.open(git_dir)}
    return (table.unpack or _G.unpack)(___antifnl_rtns_1___)
  else
  end
  return print("No git directory found")
end
local function _7_()
  local oil = require("oil")
  return oil.open(vim.fn.getcwd())
end
return {{"stevearc/oil.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}, event = "Syntax", keys = {{"<leader>te", _1_, desc = "Oil"}, {"<leader>tr", _4_, desc = "Explore current file directory"}, {"<leader>tp", _5_, desc = "Explore project"}, {"<leader>tc", _7_, desc = "Explore current directory"}}, opts = {keymaps = {["<BS>"] = "actions.parent", ["<C-c>"] = "actions.close", ["<C-h>"] = "actions.select_split", ["<C-l>"] = "actions.refresh", ["<C-p>"] = "actions.preview", ["<C-s>"] = "actions.select_vsplit", ["<C-t>"] = "actions.select_tab", ["<CR>"] = "actions.select", _ = "actions.open_cwd", ["`"] = "actions.cd", ["g."] = "actions.toggle_hidden", ["g?"] = "actions.show_help", ["g\\"] = "actions.toggle_trash", gs = "actions.change_sort", gx = "actions.open_external", ["~"] = "actions.tcd"}}}}
