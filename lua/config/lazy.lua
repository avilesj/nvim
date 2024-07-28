-- [nfnl] Compiled from fnl/config/lazy.fnl by https://github.com/Olical/nfnl, do not edit.
local lazypath = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
else
end
vim.opt.rtp:prepend((vim.env.LAZY or lazypath))
return require("lazy").setup({checker = {enabled = true}, defaults = {lazy = false, version = false}, install = {colorscheme = {"tokyonight", "habamax"}}, performance = {rtp = {disabled_plugins = {"gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin"}}}, spec = {{"LazyVim/LazyVim", import = "lazyvim.plugins"}, {import = "lazyvim.plugins.extras.lang.typescript"}, {import = "lazyvim.plugins.extras.lang.python"}, {import = "lazyvim.plugins.extras.lang.go"}, {import = "lazyvim.plugins.extras.lang.clojure"}, {import = "lazyvim.plugins.extras.lang.json"}, {import = "lazyvim.plugins.extras.lang.elixir"}, {import = "lazyvim.plugins.extras.lang.tailwind"}, {import = "lazyvim.plugins.extras.dap.core"}, {import = "lazyvim.plugins.extras.ui.mini-animate"}, {import = "lazyvim.plugins.extras.util.project"}, {import = "lazyvim.plugins.extras.coding.copilot"}, {import = "lazyvim.plugins.extras.coding.mini-surround"}, {import = "plugins"}}})
