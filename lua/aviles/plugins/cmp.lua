-- [nfnl] Compiled from fnl/aviles/plugins/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  luasnip.config.setup({})
  local function _2_()
    if luasnip.locally_jumpable(( - 1)) then
      return luasnip.jump(( - 1))
    else
      return nil
    end
  end
  local function _4_()
    if luasnip.expand_or_locally_jumpable() then
      return luasnip.expand_or_jump()
    else
      return nil
    end
  end
  local function _6_(args)
    return luasnip.lsp_expand(args.body)
  end
  return cmp.setup({completion = {completeopt = "menu,menuone,noinsert"}, mapping = cmp.mapping.preset.insert({["<C-Space>"] = cmp.mapping.complete({}), ["<C-b>"] = cmp.mapping.scroll_docs(( - 4)), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-h>"] = cmp.mapping(_2_, {"i", "s"}), ["<C-l>"] = cmp.mapping(_4_, {"i", "s"}), ["<CR>"] = cmp.mapping.confirm({select = true}), ["<S-Tab>"] = cmp.mapping.select_prev_item(), ["<Tab>"] = cmp.mapping.select_next_item()}), snippet = {expand = _6_}, sources = {{group_index = 2, name = "copilot"}, {group_index = 2, name = "conjure"}, {group_index = 2, name = "nvim_lsp"}, {group_index = 2, name = "path"}, {group_index = 2, name = "luasnip"}}})
end
local function _7_()
  if ((vim.fn.has("win32") == 1) or (vim.fn.executable("make") == 0)) then
    return 
  else
  end
  return "make install_jsregexp"
end
return {{"hrsh7th/nvim-cmp", config = _1_, dependencies = {{"L3MON4D3/LuaSnip", build = _7_(), dependencies = {}}, "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path", "hrsh7th/cmp-buffer"}, event = "InsertEnter"}}
