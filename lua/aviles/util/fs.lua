-- [nfnl] Compiled from fnl/aviles/util/fs.fnl by https://github.com/Olical/nfnl, do not edit.
local M
local function _1_(m, ...)
  return m.open(...)
end
M = setmetatable({}, {__call = _1_})
M.find_git_dir = function()
  return M.find_file_dir(".git")
end
M.find_file_dir = function(filename)
  local cwd = vim.loop.cwd()
  local path = (cwd .. "/" .. filename)
  local dir = cwd
  while not vim.loop.fs_stat(path) do
    local parent_dir = vim.fn.fnamemodify(cwd, ":h")
    if (parent_dir == cwd) then
      return nil
    else
    end
    cwd = parent_dir
    dir = cwd
    path = (cwd .. "/" .. filename)
  end
  return dir
end
M.telescope = function(dir)
  local telescope = require("telescope.builtin")
  return telescope.find_files({cwd = dir})
end
return M
