[{
  1 :ldelossa/gh.nvim
  2 :dependencies [{
                    1 :ldelossa/litee.nvim
                    :config (fn []
                              (. (require :litee.lib) :setup)
                              )
                    }]
  3 :config (fn []
              (. (require :litee.gh) :setup)
              )
  }]
