-- [nfnl] Compiled from fnl/aviles/plugins/ui.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.ui.select = function(...)
    do end (require("lazy")).load({plugins = {"dressing.nvim"}})
    return vim.ui.select(...)
  end
  vim.ui.input = function(...)
    do end (require("lazy")).load({plugins = {"dressing.nvim"}})
    return vim.ui.input(...)
  end
  return vim.ui.input
end
local function _2_(_, opts)
  do end (require("bufferline")).setup(opts)
  local function _3_()
    local function _4_()
      return pcall(__fnl_global__nvim_2dbufferline)
    end
    return vim.schedule(_4_)
  end
  return vim.api.nvim_create_autocmd("BufAdd", {callback = _3_})
end
local function _5_(n)
  return (require("mini.bufremove")).delete(n, false)
end
local function _6_(n)
  return (require("mini.bufremove")).delete(n, false)
end
local function _7_()
  vim.g.lualine_laststatus = vim.o.laststatus
  if (vim.fn.argc(( - 1)) > 0) then
    vim.o.statusline = " "
    return nil
  else
    vim.o.laststatus = 0
    return nil
  end
end
local function _9_()
  local lualine_require = require("lualine_require")
  lualine_require.require = require
  vim.o.laststatus = vim.g.lualine_laststatus
  local function _10_()
    return (require("noice")).api.status.command.get()
  end
  local function _11_()
    return (package.loaded.noice and (require("noice")).api.status.command.has())
  end
  local function _12_()
    return (require("noice")).api.status.mode.get()
  end
  local function _13_()
    return (package.loaded.noice and (require("noice")).api.status.mode.has())
  end
  local function _14_()
    return ("\239\145\175  " .. (require("dap")).status())
  end
  local function _15_()
    return (package.loaded.dap and ((require("dap")).status() ~= ""))
  end
  local function _16_()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed}
    else
      return nil
    end
  end
  local function _18_()
    return ("\239\144\186 " .. os.date("%R"))
  end
  return {extensions = {"neo-tree", "lazy"}, options = {disabled_filetypes = {statusline = {"dashboard", "alpha", "starter"}}, globalstatus = true, theme = "auto"}, sections = {lualine_a = {"mode"}, lualine_b = {"branch"}, lualine_c = {{"diagnostics", symbols = {error = "ERR", hint = "HINT", info = "INFO", warn = "WARN"}}, {"filetype", icon_only = true, padding = {left = 1, right = 0}, separator = ""}}, lualine_x = {{"copilot"}, {_10_, cond = _11_}, {_12_, cond = _13_}, {_14_, cond = _15_}, {(require("lazy.status")).updates, cond = (require("lazy.status")).has_updates}, {"diff", source = _16_, symbols = {}}}, lualine_y = {{"progress", padding = {left = 1, right = 0}, separator = " "}, {"location", padding = {left = 0, right = 1}}}, lualine_z = {_18_}}}
end
return {{"stevearc/dressing.nvim", init = _1_, lazy = true}, {"akinsho/bufferline.nvim", config = _2_, event = "VeryLazy", keys = {{"<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin"}, {"<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers"}, {"<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers"}, {"<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right"}, {"<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left"}, {"<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer"}, {"<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer"}, {"[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer"}, {"]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer"}}, opts = {options = {close_command = _5_, diagnostics = "nvim_lsp", offsets = {{filetype = "neo-tree", highlight = "Directory", text = "Neo-tree", text_align = "left"}}, right_mouse_command = _6_, always_show_bufferline = false}}}, {"nvim-lualine/lualine.nvim", event = "VeryLazy", init = _7_, opts = _9_}}
