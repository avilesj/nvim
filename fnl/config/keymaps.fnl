(local map vim.keymap.set)

(local wk (require :which-key))

(wk.add { 
              1 { 1 :<leader>m :group "local leader" :icon { :icon " "}} 
              2 { 1 :<leader>by :group :yank }
              3 { 1 :<leader>l :group :lazy/leetcode}
              4 { 1 :<leader>lc :group :Leet}
              5 { 1 :<leader>p :group :projects :icon { :icon "" :color "brown"}}
              6 { 1 :<leader>t :group :oil :icon { :icon "" :color "green"}}
             }
             )

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
