-- [nfnl] Compiled from fnl/aviles/init.fnl by https://github.com/Olical/nfnl, do not edit.
require("aviles.pre-init")
local lazypath = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
else
end
do end (vim.opt.rtp):prepend(lazypath)
do end (require("lazy")).setup("aviles.plugins", {ui = {icons = ((vim.g.have_nerd_font and {}) or {cmd = "\226\140\152", config = "\240\159\155\160", event = "\240\159\147\133", ft = "\240\159\147\130", init = "\226\154\153", keys = "\240\159\151\157", lazy = "\240\159\146\164 ", plugin = "\240\159\148\140", require = "\240\159\140\153", runtime = "\240\159\146\187", source = "\240\159\147\132", start = "\240\159\154\128", task = "\240\159\147\140"})}})
require("aviles.autocmds")
require("aviles.config")
return require("aviles.keymaps")
