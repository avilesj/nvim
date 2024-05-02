[{1 :tpope/vim-fugitive
  :keys [{1 :<leader>gg 2 (fn [] (vim.cmd.Git) (vim.cmd :only)) :desc :Git}
         {1 :<leader>gp 2 (fn [] (vim.cmd.Git :pull)) :desc :pull}
         {1 :<leader>gP 2 (fn [] (vim.cmd.Git :push)) :desc :Push}
         {1 :<leader>gf 2 (fn [] (vim.cmd.Git :fetch)) :desc :Fetch}
         {1 :<leader>gcc
          2 (fn []
              ((. (require :telescope.builtin) :git_commits)))
          :desc "Checkout at commit"}
         {1 :<leader>gcr
          2 (fn [] (local cursor-position (vim.api.nvim_win_get_cursor 0))
              (tset cursor-position 2 0)
              (vim.api.nvim_win_set_cursor 0 cursor-position)
              (local hash (vim.fn.expand :<cword>))
              (vim.cmd.Git (string.format "revert %s" hash)))
          :desc "Revert commit"}
         {1 :<leader>gll
          2 (fn [] (vim.cmd.Git "log --oneline --format=\"%h %s\""))
          :desc :Log}
         {1 :<leader>gld 2 (fn [] (vim.cmd.Git :log)) :desc "Log - default"}
         {1 :<leader>gls
          2 (fn [] (local query (vim.fn.input "Git grep search: "))
              (vim.cmd.Ggrep query))
          :desc :Search}
         {1 :<leader>gbn
          2 (fn []
              (local branch-name (vim.fn.input "New branch name: "))
              (when (= (string.len branch-name) 0)
                (vim.cmd.echo {:args ["Invalid branch name"]})
                (lua "return "))
              (vim.cmd.Git {:args [(.. "checkout -b " branch-name)]}))
          :desc "New branch"}
         {1 :<leader>gbc
          2 (fn []
              ((. (require :telescope.builtin) :git_branches))
              (vim.cmd.Git))
          :desc :Checkout}
         {1 :<leader>gaa 2 (fn [] (vim.cmd.Git "add .")) :desc "Add all"}
         {1 :<leader>gB 2 (fn [] (vim.cmd.Git :blame)) :desc :Blame}
         {1 :<leader>gsP
          2 (fn [] (var stash-message (vim.fn.input "Stash message: "))
              (when (= stash-message "") (set stash-message "No message"))
              (vim.cmd.Git (string.format "stash push -m \"%s\"" stash-message)))
          :desc "Stash push"}
         {1 :<leader>gsp
          2 (fn []
              ((. (require :telescope.builtin) :git_stash))
              (vim.cmd.Git))
          :desc "Stash pop"}]
  :name :fugitive}]

