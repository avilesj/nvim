[{1 :hrsh7th/nvim-cmp
  :config (fn []
            (local cmp (require :cmp))
            (local luasnip (require :luasnip))
            (luasnip.config.setup {})
            (cmp.setup {:completion {:completeopt "menu,menuone,noinsert"}
                        :mapping (cmp.mapping.preset.insert {:<C-Space> (cmp.mapping.complete {})
                                                             :<C-b> (cmp.mapping.scroll_docs (- 4))
                                                             :<C-f> (cmp.mapping.scroll_docs 4)
                                                             :<C-h> (cmp.mapping (fn []
                                                                                   (when (luasnip.locally_jumpable (- 1))
                                                                                     (luasnip.jump (- 1))))
                                                                                 [:i
                                                                                  :s])
                                                             :<C-l> (cmp.mapping (fn []
                                                                                   (when (luasnip.expand_or_locally_jumpable)
                                                                                     (luasnip.expand_or_jump)))
                                                                                 [:i
                                                                                  :s])
                                                             :<CR> (cmp.mapping.confirm {:select true})
                                                             :<S-Tab> (cmp.mapping.select_prev_item)
                                                             :<Tab> (cmp.mapping.select_next_item)})
                        :snippet {:expand (fn [args]
                                            (luasnip.lsp_expand args.body))}
                        :sources [{:group_index 2 :name :copilot}
                                  {:group_index 2 :name :conjure}
                                  {:group_index 2 :name :nvim_lsp}
                                  {:group_index 2 :name :path}
                                  {:group_index 2 :name :luasnip}]}))
  :dependencies [{1 :L3MON4D3/LuaSnip
                  :build ((fn []
                            (when (or (= (vim.fn.has :win32) 1)
                                      (= (vim.fn.executable :make) 0))
                              (lua "return "))
                            "make install_jsregexp"))
                  :dependencies {}}
                 :saadparwaiz1/cmp_luasnip
                 :hrsh7th/cmp-nvim-lsp
                 :hrsh7th/cmp-path
                 :hrsh7th/cmp-buffer]
  :event :InsertEnter}]

