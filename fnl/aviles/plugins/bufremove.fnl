[{1 :echasnovski/mini.bufremove
  :keys [{1 :<leader>bd
          2 (fn []
              (local bd (. (require :mini.bufremove) :delete))
              (if vim.bo.modified
                  (do
                    (local choice
                           (vim.fn.confirm (: "Save changes to %q?" :format
                                              (vim.fn.bufname))
                                           "&Yes\n&No\n&Cancel"))
                    (if (= choice 1) (do
                                       (vim.cmd.write)
                                       (bd 0))
                        (= choice 2) (bd 0 true))) (bd 0)))
          :desc "Delete Buffer"}
         {1 :<leader>bD
          2 (fn []
              ((. (require :mini.bufremove) :delete) 0 true))
          :desc "Delete Buffer (Force)"}]}]

