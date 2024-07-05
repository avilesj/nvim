{
1 "NeogitOrg/neogit"
:dependencies ["nvim-lua/plenary.nvim" "sindrets/diffview.nvim" "nvim-telescope/telescope.nvim"]
:config (fn [_ opts]
          ((. (require :neogit) :setup) opts))

:keys [{1 :<leader>gg 2 (fn [] 
                          (let [neogit (require :neogit)]
                            (neogit:open {:cwd "."})
                            )) :desc :Git}]

}
