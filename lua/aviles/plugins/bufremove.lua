-- [nfnl] Compiled from fnl/aviles/plugins/bufremove.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local bd = (require("mini.bufremove")).delete
  if vim.bo.modified then
    local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
    if (choice == 1) then
      vim.cmd.write()
      return bd(0)
    elseif (choice == 2) then
      return bd(0, true)
    else
      return nil
    end
  else
    return bd(0)
  end
end
local function _4_()
  return (require("mini.bufremove")).delete(0, true)
end
return {{"echasnovski/mini.bufremove", keys = {{"<leader>bd", _1_, desc = "Delete Buffer"}, {"<leader>bD", _4_, desc = "Delete Buffer (Force)"}}}}
