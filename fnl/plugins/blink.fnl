;; PURPOSE: Auto completion engine
[{1 :saghen/blink.compat :version "*" :lazy true :opts {}}
 {1 :saghen/blink.cmp
  :dependencies [:folke/lazydev.nvim]
  :event :VimEnter
  :opts {:appearance {:nerd_font_variant :mono}
         :cmdline {:enabled false}
         :completion {:accept {:auto_brackets {:enabled true}}
                      :documentation {:auto_show true :auto_show_delay_ms 200}
                      :menu {:draw {:treesitter {1 :lsp}}}}
         :sources {:default [:lsp :path :snippets :buffer :lazydev]
                   :providers {:lazydev {:name "LazyDev"
                                         :module "lazydev.integrations.blink"
                                         :score_offset 100}}}}
  :version :1.*}]
