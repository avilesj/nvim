-- [nfnl] Compiled from fnl/functions/buffer.fnl by https://github.com/Olical/nfnl, do not edit.
local buffer = {}
buffer["delete-buffers"] = function(list)
  for _, v in ipairs(list) do
    vim.api.nvim_buf_delete(v, {force = false})
  end
  return nil
end
return buffer
