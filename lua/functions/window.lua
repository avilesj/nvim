-- [nfnl] Compiled from fnl/functions/window.fnl by https://github.com/Olical/nfnl, do not edit.
local window = {}
window["delete-windows"] = function(list)
  for _, v in ipairs(list) do
    vim.api.nvim_win_close(v, false)
  end
  return nil
end
return window
