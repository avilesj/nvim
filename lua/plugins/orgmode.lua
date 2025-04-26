-- [nfnl] Compiled from fnl/plugins/orgmode.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return require("orgmode").setup({org_agenda_files = "~/orgfiles/agenda/**/*", org_default_notes_file = "~/orgfiles/refile.org"})
end
return {"nvim-orgmode/orgmode", config = _1_, event = "VeryLazy", ft = {"org"}}
