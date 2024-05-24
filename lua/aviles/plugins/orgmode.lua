-- [nfnl] Compiled from fnl/aviles/plugins/orgmode.fnl by https://github.com/Olical/nfnl, do not edit.
local org = require("aviles.org.util")
local function _1_()
  local workspace = (os.getenv("HOME") .. "/notes")
  return (require("orgmode")).setup({org_agenda_files = (workspace .. "/**/*"), org_default_notes_file = "~/notes/refile.org", org_meetings_dir = (workspace .. "/meetings"), org_tickets_dir = (workspace .. "/tickets"), org_workspace_dir = workspace, org_templates_dir = (workspace .. "/templates")})
end
local function _2_()
  return org["new-meeting"]()
end
local function _3_()
  return org["find-in-workspace-dir"]((require("orgmode.config")).org_workspace_dir)
end
local function _4_()
  return org["find-in-workspace-dir"]((require("orgmode.config")).org_meetings_dir)
end
local function _5_()
  return org["find-in-workspace-dir"]((require("orgmode.config")).org_articles_dir)
end
local function _6_()
  return org["find-in-workspace-dir"]((require("orgmode.config")).org_tickets_dir)
end
local function _7_()
  return org["new-file"]((require("orgmode.config")).org_workspace_dir, vim.fn.input("File name: "))
end
local function _8_()
  return org["new-ticket"]()
end
return {{"nvim-orgmode/orgmode", config = _1_, event = "VeryLazy", ft = {"org"}, keys = {{"<leader>onm", _2_, {desc = "New meeting file"}}, {"<leader>oss", _3_, {desc = "Search all org files"}}, {"<leader>osm", _4_, {desc = "Search meetings"}}, {"<leader>osa", _5_, {desc = "Search articles"}}, {"<leader>ost", _6_, {desc = "Search tickets"}}, {"<leader>onf", _7_, {desc = "New org file"}}, {"<leader>ont", _8_, {desc = "New ticket"}}}}}
