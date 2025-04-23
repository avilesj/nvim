-- [nfnl] Compiled from fnl/functions/core.fnl by https://github.com/Olical/nfnl, do not edit.
local core = {}
core.filter = function(list, value)
  local tbl_21_auto = {}
  local i_22_auto = 0
  for _, v in ipairs(list) do
    local val_23_auto
    if (v ~= value) then
      val_23_auto = v
    else
      val_23_auto = nil
    end
    if (nil ~= val_23_auto) then
      i_22_auto = (i_22_auto + 1)
      tbl_21_auto[i_22_auto] = val_23_auto
    else
    end
  end
  return tbl_21_auto
end
core.te = function()
  return print("test")
end
return core
