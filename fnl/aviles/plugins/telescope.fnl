[{1 :nvim-telescope/telescope.nvim
  :branch :0.1.x
  :config (fn []
            ((. (require :telescope) :setup) {:extensions {:ui-select [((. (require :telescope.themes)
                                                                           :get_dropdown))]}})
            (pcall (. (require :telescope) :load_extension) :fzf)
            (pcall (. (require :telescope) :load_extension) :ui-select)
            (local builtin (require :telescope.builtin))
            (vim.keymap.set :n :<leader>sh builtin.help_tags
                            {:desc "[S]earch [H]elp"})
            (vim.keymap.set :n :<leader>sk builtin.keymaps
                            {:desc "[S]earch [K]eymaps"})
            (vim.keymap.set :n :<leader>sf builtin.find_files
                            {:desc "[S]earch [F]iles"})
            (vim.keymap.set :n :<leader>ss builtin.builtin
                            {:desc "[S]earch [S]elect Telescope"})
            (vim.keymap.set :n :<leader>sw builtin.grep_string
                            {:desc "[S]earch current [W]ord"})
            (vim.keymap.set :n :<leader>s/ builtin.live_grep
                            {:desc "[S]earch by [/]Grep"})
            (vim.keymap.set :n :<leader>/ builtin.live_grep
                            {:desc "Search by [/]Grep"})
            (vim.keymap.set :n :<leader>sd builtin.diagnostics
                            {:desc "[S]earch [D]iagnostics"})
            (vim.keymap.set :n :<leader>sr builtin.resume
                            {:desc "[S]earch [R]esume"})
            (vim.keymap.set :n :<leader>s. builtin.oldfiles
                            {:desc "[S]earch Recent Files (\".\" for repeat)"})
            (vim.keymap.set :n "<leader>," builtin.buffers
                            {:desc "[,] Find existing buffers"})
            (vim.keymap.set :n :<leader><leader>
                            (fn [] (local status (pcall builtin.git_files))
                              (when (not status) (builtin.find_files)))
                            {:desc "[ ] Find git files"})
            (vim.keymap.set :n :<leader>sb
                            (fn [] (builtin.current_buffer_fuzzy_find))
                            {:desc "Fuzzily [s]earch in current [b]uffer"})
            (vim.keymap.set :n :<leader>s/
                            (fn []
                              (builtin.live_grep {:grep_open_files true
                                                  :prompt_title "Live Grep in Open Files"}))
                            {:desc "[S]earch [/] in Open Files"})
            (vim.keymap.set :n :<leader>sn
                            (fn []
                              (builtin.find_files {:cwd (vim.fn.stdpath :config)}))
                            {:desc "[S]earch [N]eovim files"}))
  :dependencies [:nvim-lua/plenary.nvim
                 {1 :nvim-telescope/telescope-fzf-native.nvim
                  :build :make
                  :cond (fn [] (= (vim.fn.executable :make) 1))}
                 [:nvim-telescope/telescope-ui-select.nvim]
                 {1 :nvim-tree/nvim-web-devicons :enabled vim.g.have_nerd_font}]
  :event :VimEnter}]

