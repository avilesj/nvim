[{1 :folke/which-key.nvim
  :config (fn []
            ((. (require :which-key) :setup))
            ((. (require :which-key) :register) {1 {:prefix :<leader>}
                                                 :<leader>by {:name :+yank}
                                                 :<leader>c {:_ :which_key_ignore
                                                             :name "[C]ode"}
                                                 :<leader>d {:i {:e [vim.diagnostic.open_float
                                                                     "Show diagnostic [E]rror messages"]
                                                                 :q [vim.diagnostic.setloclist
                                                                     "Open diagnostic [Q]uickfix list"]}}
                                                 :<leader>h {:_ :which_key_ignore
                                                             :name "Git [H]unk"}
                                                 :<leader>l {:name :+lazy/leetcode}
                                                 :<leader>lc {:name :+Leet}
                                                 :<leader>r {:_ :which_key_ignore
                                                             :name "[R]ename"}
                                                 :<leader>s {:_ :which_key_ignore
                                                             :name "[S]earch"}
                                                 :<leader>t {:_ :which_key_ignore
                                                             :name "[T]oggle"}
                                                 :<leader>w {:_ :which_key_ignore
                                                             :name "[W]orkspace"}})
            ((. (require :which-key) :register) {:<leader>h ["Git [H]unk"]}
                                                {:mode :v}))
  :event :VimEnter}]

