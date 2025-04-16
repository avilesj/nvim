-- [nfnl] Compiled from fnl/plugins/conform.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return require("conform").format({async = true, lsp_format = "fallback"})
end
local function _2_(bufnr)
  local disable_filetypes = {c = true, cpp = true}
  if disable_filetypes[vim.bo[bufnr].filetype] then
    return nil
  else
    return {lsp_format = "fallback", timeout_ms = 500}
  end
end
return {"stevearc/conform.nvim", cmd = {"ConformInfo"}, event = {"BufWritePre"}, keys = {{"<leader>f", _1_, desc = "[F]ormat buffer", mode = ""}}, opts = {format_on_save = _2_, formatters_by_ft = {lua = {"stylua"}, fennel = {"fnlfmt"}}, notify_on_error = false}}
