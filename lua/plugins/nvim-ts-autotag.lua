-- [nfnl] Compiled from fnl/plugins/nvim-ts-autotag.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, _0)
  return require("nvim-ts-autotag").setup({opts = {enable_close = true, enable_rename = true, enable_close_on_slash = false}})
end
return {"windwp/nvim-ts-autotag", opts = _1_}
