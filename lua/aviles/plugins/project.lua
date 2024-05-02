-- [nfnl] Compiled from fnl/aviles/plugins/project.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  do end (require("project_nvim")).setup({})
  return (require("telescope")).load_extension("projects")
end
local function _2_()
  local function _3_()
    return vim.cmd("Telescope projects")
  end
  return vim.schedule(_3_)
end
return {{"folke/which-key.nvim", optional = true, opts = {defaults = {["<leader>p"] = {name = "+projects"}}}}, {"ahmedkhalf/project.nvim", config = _1_, dependencies = {"nvim-telescope/telescope.nvim"}, keys = {{"<leader>pr", _2_, desc = "recent projects"}}, lazy = false}}
