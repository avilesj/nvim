[{1 :stevearc/oil.nvim
  :dependencies [:nvim-tree/nvim-web-devicons]
  :event :Syntax
  :keys [{1 :<leader>te
          2 (fn []
              (local oil (require :oil))
              (local git (require :aviles.util.fs))
              (local cwd (vim.fn.getcwd))
              (local git-dir (git.find_git_dir))
              (local file-path (vim.fn.expand "%:p:h"))
              (when (not= git-dir nil)
                (let [___antifnl_rtns_1___ [(oil.open git-dir)]]
                  (lua "return (table.unpack or _G.unpack)(___antifnl_rtns_1___)")))
              (local file-path-length (string.len file-path))
              (local cwd-length (string.len cwd))
              (if (> cwd-length file-path-length) (oil.open file-path)
                  (oil.open cwd)))
          :desc :Oil}
         {1 :<leader>tr
          2 (fn [] (local oil (require :oil))
              (local file-path (vim.fn.expand "%:p:h"))
              (oil.open file-path))
          :desc "Explore current file directory"}
         {1 :<leader>tp
          2 (fn []
              (local oil (require :oil))
              (local git-dir ((. (require :aviles.util.fs) :find_git_dir)))
              (when (not= git-dir nil)
                (let [___antifnl_rtns_1___ [(oil.open git-dir)]]
                  (lua "return (table.unpack or _G.unpack)(___antifnl_rtns_1___)")))
              (print "No git directory found"))
          :desc "Explore project"}
         {1 :<leader>tc
          2 (fn [] (local oil (require :oil)) (oil.open (vim.fn.getcwd)))
          :desc "Explore current directory"}]
  :opts {:keymaps {:<BS> :actions.parent
                   :<C-c> :actions.close
                   :<C-h> :actions.select_split
                   :<C-l> :actions.refresh
                   :<C-p> :actions.preview
                   :<C-s> :actions.select_vsplit
                   :<C-t> :actions.select_tab
                   :<CR> :actions.select
                   :_ :actions.open_cwd
                   "`" :actions.cd
                   :g. :actions.toggle_hidden
                   :g? :actions.show_help
                   "g\\" :actions.toggle_trash
                   :gs :actions.change_sort
                   :gx :actions.open_external
                   "~" :actions.tcd}}}]

