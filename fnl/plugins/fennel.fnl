[{1 :nvim-treesitter/nvim-treesitter :opts {:ensure_installed [:fennel]}}
 {1 :neovim/nvim-lspconfig
  :opts {:servers {:fennel_ls {:filetypes [:fennel]
                               :settings {:Lua {:diagnostics {:globals [:vim
                                                                        :jit]}}}}}
 :fennel_language_server {:filetypes [:fennel]
                           :settings {:fennel {:diagnostics {:globals [:vim
                                                                       :jit]}}}}}}
                           ]

[{1 :nvim-treesitter/nvim-treesitter :opts {:ensure_installed [:fennel]}}
 {1 :neovim/nvim-lspconfig
  :opts {:servers {:fennel_ls {:filetypes [:fennel]
                               :settings {:Lua {:diagnostics {:globals [:vim
                                                                        :jit]}}}}
                   :fennel_language_server {:filetypes [:fennel]
                                             :settings {:fennel {:diagnostics {:globals [:vim
                                                                                         :jit]}}}}}}}]

