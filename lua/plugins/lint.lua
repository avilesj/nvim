-- [nfnl] Compiled from fnl/plugins/lint.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local lint = require("lint")
  lint.linters_by_ft = {fennel = {"fennel"}}
  local lint_augroup = vim.api.nvim_create_augroup("lint", {clear = true})
  local function _2_()
    if vim.opt_local.modifiable:get() then
      return lint.try_lint()
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "InsertLeave"}, {callback = _2_, group = lint_augroup})
end
return {"mfussenegger/nvim-lint", config = _1_, event = {"BufReadPre", "BufNewFile"}}
