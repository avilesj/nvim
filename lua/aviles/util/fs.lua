---@class aviles.util.git
local M = setmetatable({}, {
  __call = function(m, ...)
    return m.open(...)
  end,
})

---@return string | nil
function M.find_git_dir()
  return M.find_file_dir(".git")
end

---@return string | nil
function M.find_file_dir(filename)
  local cwd = vim.loop.cwd()
  local path = cwd .. "/" .. filename
  local dir = cwd

  while not vim.loop.fs_stat(path) do
    local parent_dir = vim.fn.fnamemodify(cwd, ":h")
    if parent_dir == cwd then
      return nil
    end
    cwd = parent_dir
    dir = cwd
    path = cwd .. "/" .. filename
  end

  return dir
end
return M
