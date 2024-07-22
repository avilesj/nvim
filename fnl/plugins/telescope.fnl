{1 :nvim-telescope/telescope.nvim
 :opts {:defaults {:vimgrep_arguments [:rg
                                       :--color=never
                                       :--no-heading
                                       :--line-number
                                       :--column
                                       :--smart-case
                                       :--hidden
                                       :--glob
                                       "!{**/.git/*,**/node_modules/*,**/pkg/mod/*,**/yarn.lock,**/.local/*}"]}
        :pickers {:find_files {:find_command [:rg
                                              :--files
                                              :--hidden
                                              :--glob
                                              :!**/.git/*]}}}}

