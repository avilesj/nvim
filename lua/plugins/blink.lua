-- [nfnl] Compiled from fnl/plugins/blink.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  if ((vim.fn.has("win32") == 1) or (vim.fn.executable("make") == 0)) then
    return 
  else
  end
  return "make install_jsregexp"
end
return {"saghen/blink.cmp", dependencies = {{"L3MON4D3/LuaSnip", build = _1_(), dependencies = {}, opts = {}, version = "2.*"}, "folke/lazydev.nvim"}, event = "VimEnter", opts = {appearance = {nerd_font_variant = "mono"}, completion = {documentation = {auto_show_delay_ms = 500, auto_show = false}}, fuzzy = {implementation = "lua"}, keymap = {preset = "default"}, signature = {enabled = true}, snippets = {preset = "luasnip"}, sources = {default = {"lsp", "path", "snippets", "lazydev"}, providers = {lazydev = {module = "lazydev.integrations.blink", score_offset = 100}}}}, version = "1.*"}
