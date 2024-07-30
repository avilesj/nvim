-- [nfnl] Compiled from fnl/plugins/project.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  require("project_nvim").setup({})
  return require("telescope").load_extension("projects")
end
local function _2_()
  local function _3_()
    return vim.cmd("Telescope projects")
  end
  return vim.schedule(_3_)
end
return {"ahmedkhalf/project.nvim", config = _1_, dependencies = {"nvim-telescope/telescope.nvim"}, keys = {{"<leader>pr", _2_, desc = "recent projects"}}, lazy = false}
