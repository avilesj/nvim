{1 :saghen/blink.cmp
 :dependencies [{1 :L3MON4D3/LuaSnip
                 :build ((fn []
                           (when (or (= (vim.fn.has :win32) 1)
                                     (= (vim.fn.executable :make) 0))
                             (lua "return "))
                           "make install_jsregexp"))
                 :dependencies {}
                 :opts {}
                 :version :2.*}
                :folke/lazydev.nvim]
 :event :VimEnter
 :opts {:appearance {:nerd_font_variant :mono}
        :completion {:documentation {:auto_show false :auto_show_delay_ms 500}}
        :fuzzy {:implementation :lua}
        :keymap {:preset :default}
        :signature {:enabled true}
        :snippets {:preset :luasnip}
        :sources {:default [:lsp :path :snippets :lazydev]
                  :providers {:lazydev {:module :lazydev.integrations.blink
                                        :score_offset 100}}}}
 :version :1.*}
