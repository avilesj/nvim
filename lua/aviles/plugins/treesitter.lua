-- [nfnl] Compiled from fnl/aviles/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  require("nvim-treesitter.install")["prefer_git"] = true
  return (require("nvim-treesitter.configs")).setup(opts)
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = _1_, opts = {auto_install = true, ensure_installed = {"bash", "c", "html", "lua", "dockerfile", "make", "tmux", "luadoc", "markdown", "vim", "vimdoc", "go", "javascript", "typescript", "python", "helm", "templ", "terraform", "hcl", "json", "yaml", "tsx", "sql", "gomod", "gowork", "gosum"}, highlight = {additional_vim_regex_highlighting = {"ruby"}, enable = true}, indent = {disable = {"ruby"}, enable = true}}}, {"windwp/nvim-ts-autotag", opts = {}}}
