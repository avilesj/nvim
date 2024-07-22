(local map vim.keymap.set)

(local wk (require :which-key))

(wk.register {:<leader>by {:name :+yank}
              :<leader>l {:name :+lazy/leetcode}
              :<leader>lc {:name :+Leet}})

(map :n :<leader>ll :<cmd>Lazy<cr> {:desc :Lazy})

(map :n :<leader>byp
     (fn []
       (let [current-file (vim.fn.expand "%:p")
             relative-path (vim.fn.fnamemodify current-file ":.")]
         (vim.fn.setreg "+" relative-path)
         (vim.api.nvim_out_write (.. "Relative path copied to clipboard: "
                                     relative-path "\n"))))
     {:desc "Copy path"})

(map :n :<leader>byP
     (fn []
       (let [current-file (vim.fn.expand "%:p")]
         (vim.fn.setreg "+" current-file)
         (vim.api.nvim_out_write (.. "Relative path copied to clipboard: "
                                     current-file "\n"))))
     {:desc "Relative path"})

(map :n :<leader>byf
     (fn []
       (let [current-file (vim.fn.expand "%:p")
             file-name (vim.fn.fnamemodify current-file ":t")]
         (vim.fn.setreg "+" file-name)
         (vim.api.nvim_out_write (.. "File name copied to clipboard: "
                                     file-name "\n"))))
     {:desc "Copy full path"})
