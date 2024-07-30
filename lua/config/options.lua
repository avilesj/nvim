-- [nfnl] Compiled from fnl/config/options.fnl by https://github.com/Olical/nfnl, do not edit.
local opt = vim.opt
local g = vim.g
g.maplocalleader = " m"
opt.ttimeoutlen = 50
return vim.filetype.add({extension = {templ = "templ"}})
