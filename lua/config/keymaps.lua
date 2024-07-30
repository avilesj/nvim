-- [nfnl] Compiled from fnl/config/keymaps.fnl by https://github.com/Olical/nfnl, do not edit.
local map = vim.keymap.set
local wk = require("which-key")
wk.add({{"<leader>m", group = "local leader", icon = {icon = "\238\137\174 "}}, {"<leader>by", group = "yank"}, {"<leader>l", group = "lazy/leetcode"}, {"<leader>lc", group = "Leet"}, {"<leader>p", group = "projects", icon = {icon = "\239\131\178", color = "brown"}}, {"<leader>t", group = "oil", icon = {icon = "\238\137\181", color = "green"}}})
map("n", "<leader>ll", "<cmd>Lazy<cr>", {desc = "Lazy"})
local function _1_()
  local current_file = vim.fn.expand("%:p")
  local relative_path = vim.fn.fnamemodify(current_file, ":.")
  vim.fn.setreg("+", relative_path)
  return vim.api.nvim_out_write(("Relative path copied to clipboard: " .. relative_path .. "\n"))
end
map("n", "<leader>byp", _1_, {desc = "Copy path"})
local function _2_()
  local current_file = vim.fn.expand("%:p")
  vim.fn.setreg("+", current_file)
  return vim.api.nvim_out_write(("Relative path copied to clipboard: " .. current_file .. "\n"))
end
map("n", "<leader>byP", _2_, {desc = "Relative path"})
local function _3_()
  local current_file = vim.fn.expand("%:p")
  local file_name = vim.fn.fnamemodify(current_file, ":t")
  vim.fn.setreg("+", file_name)
  return vim.api.nvim_out_write(("File name copied to clipboard: " .. file_name .. "\n"))
end
return map("n", "<leader>byf", _3_, {desc = "Copy full path"})
