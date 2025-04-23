-- [nfnl] Compiled from fnl/config.fnl by https://github.com/Olical/nfnl, do not edit.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.showmode = false
local function _1_()
  vim.opt.clipboard = "unnamedplus"
  return nil
end
vim.schedule(_1_)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = {nbsp = "\226\144\163", tab = "\194\187 ", trail = "\194\183"}
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {desc = "Open diagnostic [Q]uickfix list"})
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {desc = "Exit terminal mode"})
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", {desc = "Move focus to the left window"})
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", {desc = "Move focus to the right window"})
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", {desc = "Move focus to the lower window"})
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", {desc = "Move focus to the upper window"})
local function _2_()
  vim.wo.wrap = not vim.wo.wrap
  return nil
end
vim.keymap.set("n", "<leader>uw", _2_, {desc = "Toggle wrap"})
vim.keymap.set("n", "<leader>bb", "<C-^>", {desc = "Back to previous active buffer", noremap = true, silent = true})
local function filter(list, value)
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
local function delete_buffers(list)
  for _, v in ipairs(list) do
    vim.api.nvim_buf_delete(v, {force = false})
  end
  return nil
end
vim.keymap.set("n", "<leader>bd", ":bd<CR>", {desc = "Delete current buffer", noremap = true, silent = true})
local function _5_()
  local current_buffer = vim.api.nvim_get_current_buf()
  local list_of_buffers = vim.api.nvim_list_bufs()
  return delete_buffers(filter(list_of_buffers, current_buffer))
end
vim.keymap.set("n", "<leader>bo", _5_, {desc = "Close other buffers", noremap = true, silent = true})
local function delete_windows(list)
  for _, v in ipairs(list) do
    vim.api.nvim_win_close(v, false)
  end
  return nil
end
local function _6_()
  local current_window = vim.api.nvim_get_current_win()
  local list_of_windows = vim.api.nvim_list_wins()
  return delete_windows(filter(list_of_windows, current_window))
end
vim.keymap.set("n", "<leader>wo", _6_, {desc = "Close other windows", noremap = true, silent = true})
local function _7_()
  return vim.highlight.on_yank()
end
vim.api.nvim_create_autocmd("TextYankPost", {callback = _7_, desc = "Highlight when yanking (copying) text", group = vim.api.nvim_create_augroup("kickstart-highlight-yank", {clear = true})})
local function telescope_builtin()
end
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "Code actions"})
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {desc = "Rename", noremap = true, silent = true})
vim.keymap.set("n", "<leader>cs", vim.lsp.buf.document_symbol, {desc = "Symbols", noremap = true, silent = true})
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "gri")
vim.keymap.set("n", "gr", vim.lsp.buf.references, {desc = "Go to references", noremap = true, silent = true})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {desc = "Go to declaration", noremap = true, silent = true})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {desc = "Go to definition", noremap = true, silent = true})
local lazypath = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
  if (vim.v.shell_error ~= 0) then
    error(("Error cloning lazy.nvim:\n" .. out))
  else
  end
else
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", {ui = {icons = ((vim.g.have_nerd_font and {}) or {cmd = "\226\140\152", config = "\240\159\155\160", event = "\240\159\147\133", ft = "\240\159\147\130", init = "\226\154\153", keys = "\240\159\151\157", lazy = "\240\159\146\164 ", plugin = "\240\159\148\140", require = "\240\159\140\153", runtime = "\240\159\146\187", source = "\240\159\147\132", start = "\240\159\154\128", task = "\240\159\147\140"})}})
local function load_langs(languages)
  for k, v in ipairs(languages) do
    require(("lang" .. "." .. v))
  end
  return nil
end
return load_langs({"fennel", "elixir", "tailwindcss", "javascript"})
