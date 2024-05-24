-- [nfnl] Compiled from fnl/aviles/org/templating.fnl by https://github.com/Olical/nfnl, do not edit.
local M
local function _1_(m, ...)
  return m.open(...)
end
M = setmetatable({}, {__call = _1_})
M["build-org-filepath"] = function(dir, filename)
  return (dir .. "/" .. filename .. ".org")
end
M["get-workspace-subdir-path"] = function(subdir)
  return (require("orgmode.config"))[subdir]
end
M["new-file"] = function(dir, name)
  local filename = M["build-org-filepath"](dir, name)
  local bufnr = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_buf_set_name(bufnr, filename)
  do end (vim.bo[bufnr])["filetype"] = "org"
  vim.api.nvim_command(("edit " .. filename))
  return vim.cmd.only()
end
M["new-ticket"] = function()
  local ticket = string.upper(vim.fn.input("Ticket name: "))
  return M["new-file"](M["get-workspace-subdir-path"]("org_tickets_dir"), ticket)
end
M["new-file-from-template"] = function(template, destination, name)
  local destination_dir = (M["get-workspace-subdir-path"]("org_workspace_dir") .. destination)
  local template_file = M["build-org-filepath"](M["get-workspace-subdir-path"]("org_templates_dir"), template)
  local file = io.open(template_file, "r")
  if file then
    local filename = (destination_dir .. "/" .. name .. ".org")
    local bufnr = vim.api.nvim_create_buf(true, false)
    local lines = {}
    for line in file:lines() do
      table.insert(lines, line)
    end
    file:close()
    vim.api.nvim_buf_set_name(bufnr, filename)
    vim.api.nvim_buf_set_lines(bufnr, 0, ( - 1), false, lines)
    do end (vim.bo[bufnr])["filetype"] = "org"
    vim.api.nvim_command(("edit " .. filename))
    return vim.cmd.only()
  else
    return print(("File not found: " .. template_file))
  end
end
M["new-meeting"] = function()
  local template = "meeting"
  local destination = M["get-workspace-subdir-path"]("org_meetings_dir")
  local filename = os.date("%Y-%m-%d-%H%M%S")
  return M["new-file-from-template"](template, destination, filename)
end
M["find-in-workspace-dir"] = function(dir)
  local search = require("aviles.util.fs")
  return search.telescope(dir)
end
return M
