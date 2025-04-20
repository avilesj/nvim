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
local function _3_()
  return vim.highlight.on_yank()
end
vim.api.nvim_create_autocmd("TextYankPost", {callback = _3_, desc = "Highlight when yanking (copying) text", group = vim.api.nvim_create_augroup("kickstart-highlight-yank", {clear = true})})
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
return load_langs({"fennel", "elixir", "tailwindcss"})
