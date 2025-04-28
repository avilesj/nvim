-- [nfnl] Compiled from fnl/keymaps.fnl by https://github.com/Olical/nfnl, do not edit.
local filter = require("functions.core").filter
local delete_windows = require("functions.window")["delete-windows"]
local delete_buffers = require("functions.buffer")["delete-buffers"]
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {desc = "Open diagnostic [Q]uickfix list"})
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {desc = "Exit terminal mode"})
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", {desc = "Move focus to the left window"})
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", {desc = "Move focus to the right window"})
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", {desc = "Move focus to the lower window"})
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", {desc = "Move focus to the upper window"})
local function _1_()
  vim.wo.wrap = not vim.wo.wrap
  return nil
end
vim.keymap.set("n", "<leader>uw", _1_, {desc = "Toggle wrap"})
vim.keymap.set("n", "<leader>bb", "<C-^>", {desc = "Back to previous active buffer", noremap = true, silent = true})
vim.keymap.set("n", "<leader>bd", ":bd<CR>", {desc = "Delete current buffer", noremap = true, silent = true})
local function _2_()
  local current_buffer = vim.api.nvim_get_current_buf()
  local list_of_buffers = vim.api.nvim_list_bufs()
  return delete_buffers(filter(list_of_buffers, current_buffer))
end
vim.keymap.set("n", "<leader>bo", _2_, {desc = "Close other buffers", noremap = true, silent = true})
local function _3_()
  local current_window = vim.api.nvim_get_current_win()
  local list_of_windows = vim.api.nvim_list_wins()
  return delete_windows(filter(list_of_windows, current_window))
end
vim.keymap.set("n", "<leader>wo", _3_, {desc = "Close other windows", noremap = true, silent = true})
local function _4_()
  return vim.cmd("checkhealth lsp")
end
vim.keymap.set("n", "<leader>cl", _4_, {desc = "LSP Info"})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "Code actions"})
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {desc = "Rename", noremap = true, silent = true})
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, {desc = "Line Diagnostics"})
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "gri")
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {desc = "Go to declaration", noremap = true, silent = true})
local function _5_()
  return vim.cmd(("e " .. require("lazy.core.config").plugins.orgmode._.cache.opts.org_default_notes_file))
end
vim.keymap.set("n", "<leader>oR", _5_, {desc = "Open refiler", noremap = true, silent = true})
local function _6_()
  return require("telescope.builtin").find_files({cwd = require("lazy.core.config").plugins.orgmode._.cache.opts.org_default_dir})
end
return vim.keymap.set("n", "<leader>of", _6_, {desc = "Search org files", noremap = true, silent = true})
