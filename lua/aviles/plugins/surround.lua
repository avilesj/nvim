-- [nfnl] Compiled from fnl/aviles/plugins/surround.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, keys)
  local plugin = (require("lazy.core.config")).spec.plugins["mini.surround"]
  local opts = (require("lazy.core.plugin")).values(plugin, "opts", false)
  local mappings = {{opts.mappings.add, desc = "Add Surrounding", mode = {"n", "v"}}, {opts.mappings.delete, desc = "Delete Surrounding", mode = {"n", "v"}}, {opts.mappings.find, desc = "Find Right Surrounding"}, {opts.mappings.find_left, desc = "Find Left Surrounding"}, {opts.mappings.highlight, desc = "Highlight Surrounding"}, {opts.mappings.replace, desc = "Replace Surrounding"}, {opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`"}}
  local function _2_(m)
    return (m[1] and (#m[1] > 0))
  end
  mappings = vim.tbl_filter(_2_, mappings)
  return vim.list_extend(mappings, keys)
end
return {{"echasnovski/mini.surround", keys = _1_, opts = {mappings = {add = "gsa", delete = "gsd", find = "gsf", find_left = "gsF", highlight = "gsh", replace = "gsr", update_n_lines = "gsn"}}}}
