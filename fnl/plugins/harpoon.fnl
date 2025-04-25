{1 :ThePrimeagen/harpoon
 :branch :harpoon2
 :keys (fn []
         (local keys [{1 :<leader>H
                       2 (fn []
                           (: (: (require :harpoon) :list) :add))
                       :desc "Harpoon File"}
                      {1 :<leader>h
                       2 (fn [] (local harpoon (require :harpoon))
                           (harpoon.ui:toggle_quick_menu (harpoon:list)))
                       :desc "Harpoon Quick Menu"}])
         (for [i 1 5]
           (table.insert keys
                         {1 (.. :<leader> i)
                          2 (fn []
                              (: (: (require :harpoon) :list) :select i))
                          :desc (.. "Harpoon to File " i)}))
         keys)
 :opts {:menu {:width (- (vim.api.nvim_win_get_width 0) 4)}
        :settings {:save_on_toggle true}}}
