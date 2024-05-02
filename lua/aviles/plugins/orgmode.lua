-- [nfnl] Compiled from fnl/aviles/plugins/orgmode.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local workspace = (os.getenv("HOME") .. "/notes")
  return (require("orgmode")).setup({org_agenda_files = (workspace .. "/**/*"), org_default_notes_file = "~/notes/refile.org", org_meetings_dir = (workspace .. "/meetings"), org_templates_dir = (workspace .. "/templates")})
end
local function _2_()
  local meetings_dir = (require("orgmode.config")).org_meetings_dir
  local meeting_template_file = ((require("orgmode.config")).org_templates_dir .. "/meeting.org")
  print(meeting_template_file)
  local file = io.open(meeting_template_file, "r")
  local content = nil
  if file then
    local current_time = os.date("%Y-%m-%d-%H%M%S")
    local filename = (meetings_dir .. "/" .. current_time .. ".org")
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
    return print(("File not found: " .. meeting_template_file))
  end
end
return {{"nvim-orgmode/orgmode", config = _1_, event = "VeryLazy", ft = {"org"}, keys = {{"<leader>omn", _2_, desc = "New meeting file"}}}}
