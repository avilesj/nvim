[{1 :lukas-reineke/indent-blankline.nvim
  :config (fn []
            (local highlight [:RainbowYellow :RainbowCyan])
            (local hooks (require :ibl.hooks))
            (hooks.register hooks.type.HIGHLIGHT_SETUP
                            (fn []
                              (vim.api.nvim_set_hl 0 :RainbowYellow
                                                   {:fg "#E5C07B"})
                              (vim.api.nvim_set_hl 0 :RainbowCyan
                                                   {:fg "#56B6C2"})))
            ((. (require :ibl) :setup) {:indent {:char "│"
                                                 :highlight [:RainbowYellow]
                                                 :tab_char "│"}
                                        :scope {:char "│"
                                                :highlight [:RainbowCyan]}}))
  :event :BufEnter
  :main :ibl
  :opts {}}]

