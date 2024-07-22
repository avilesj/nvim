[[:jparise/vim-graphql]
 {1 :williamboman/mason.nvim
  :opts (fn [_ opts]
          (vim.list_extend opts.ensure_installed
                           [:graphql-language-service-cli]))}
 {1 :nvim-treesitter/nvim-treesitter :opts {:ensure_installed [:graphql]}}
 {1 :neovim/nvim-lspconfig
  :dependencies {}
  :opts {:servers {:graphql {:filetypes [:graphql :typescript :typescriptreact]}}}}]

