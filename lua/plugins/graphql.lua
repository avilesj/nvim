-- [nfnl] Compiled from fnl/plugins/graphql.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  return vim.list_extend(opts.ensure_installed, {"graphql-language-service-cli"})
end
return {{"jparise/vim-graphql"}, {"williamboman/mason.nvim", opts = _1_}, {"nvim-treesitter/nvim-treesitter", opts = {ensure_installed = {"graphql"}}}, {"neovim/nvim-lspconfig", dependencies = {}, opts = {servers = {graphql = {filetypes = {"graphql", "typescript", "typescriptreact"}}}}}}
