[{1 :echasnovski/mini.pairs
  :event :VeryLazy
  :keys [{1 :<leader>up
          2 (fn []
              (set vim.g.minipairs_disable (not vim.g.minipairs_disable))
              (if vim.g.minipairs_disable
                  (print "Disabled auto pairs" {:title :Option})
                  (print "Enabled auto pairs" {:title :Option})))
          :desc "Toggle Auto Pairs"}]
  :opts {:mappings {"`" {:action :closeopen
                         :neigh_pattern "[^\\`]."
                         :pair "``"
                         :register {:cr false}}}}}]

