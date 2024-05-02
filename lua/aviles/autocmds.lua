-- [nfnl] Compiled from fnl/aviles/autocmds.fnl by https://github.com/Olical/nfnl, do not edit.
local Aviles = vim.api.nvim_create_augroup("Aviles", {clear = true})
local function _1_()
  return vim.highlight.on_yank()
end
vim.api.nvim_create_autocmd("TextYankPost", {callback = _1_, desc = "Highlight when yanking (copying) text", group = Aviles})
local function _2_()
  vim.fn.system("templ generate")
  return vim.cmd("LspRestart")
end
vim.api.nvim_create_autocmd("BufWritePost", {callback = _2_, group = Aviles, pattern = "*.templ"})
local function _3_(event)
  if (event.match):match("^%w%w+://") then
    return 
  else
  end
  local file = (vim.loop.fs_realpath(event.match) or event.match)
  return vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
end
return vim.api.nvim_create_autocmd({"BufWritePre"}, {callback = _3_, group = Aviles})
