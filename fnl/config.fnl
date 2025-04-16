(set vim.g.mapleader " ")
(set vim.g.maplocalleader " ")
(set vim.g.have_nerd_font false)
(set vim.opt.number true)
(set vim.opt.mouse :a)
(set vim.opt.showmode false)
(vim.schedule (fn [] (set vim.opt.clipboard :unnamedplus)))
(set vim.opt.breakindent true)
(set vim.opt.undofile true)
(set vim.opt.ignorecase true)
(set vim.opt.smartcase true)
(set vim.opt.signcolumn :yes)
(set vim.opt.updatetime 250)
(set vim.opt.timeoutlen 300)
(set vim.opt.splitright true)
(set vim.opt.splitbelow true)
(set vim.opt.list true)
(set vim.opt.listchars {:nbsp "␣" :tab "» " :trail "·"})
(set vim.opt.inccommand :split)
(set vim.opt.cursorline true)
(set vim.opt.scrolloff 10)
(set vim.opt.confirm true)
(vim.keymap.set :n :<Esc> :<cmd>nohlsearch<CR>)
(vim.keymap.set :n :<leader>q vim.diagnostic.setloclist
                {:desc "Open diagnostic [Q]uickfix list"})

(vim.keymap.set :t :<Esc><Esc> "<C-\\><C-n>" {:desc "Exit terminal mode"})
(vim.keymap.set :n :<C-h> :<C-w><C-h> {:desc "Move focus to the left window"})
(vim.keymap.set :n :<C-l> :<C-w><C-l> {:desc "Move focus to the right window"})
(vim.keymap.set :n :<C-j> :<C-w><C-j> {:desc "Move focus to the lower window"})
(vim.keymap.set :n :<C-k> :<C-w><C-k> {:desc "Move focus to the upper window"})
(vim.api.nvim_create_autocmd :TextYankPost
                             {:callback (fn [] (vim.highlight.on_yank))
                              :desc "Highlight when yanking (copying) text"
                              :group (vim.api.nvim_create_augroup :kickstart-highlight-yank
                                                                  {:clear true})})

(local lazypath (.. (vim.fn.stdpath :data) :/lazy/lazy.nvim))
(when (not ((. (or vim.uv vim.loop) :fs_stat) lazypath))
  (local lazyrepo "https://github.com/folke/lazy.nvim.git")
  (local out (vim.fn.system [:git
                             :clone
                             "--filter=blob:none"
                             :--branch=stable
                             lazyrepo
                             lazypath]))
  (when (not= vim.v.shell_error 0)
    (error (.. "Error cloning lazy.nvim:\n" out))))

(vim.opt.rtp:prepend lazypath)
((. (require :lazy) :setup) [:tpope/vim-sleuth
                             {1 :lewis6991/gitsigns.nvim
                              :opts {:signs {:add {:text "+"}
                                             :change {:text "~"}
                                             :changedelete {:text "~"}
                                             :delete {:text "_"}
                                             :topdelete {:text "‾"}}}}
                             {1 :mfussenegger/nvim-lint
                              :config (fn []
                                        (local lint (require :lint))
                                        (set lint.linters_by_ft
                                             {:fennel [:fennel]
                                              :markdown [:markdownlint]})
                                        (local lint-augroup
                                               (vim.api.nvim_create_augroup :lint
                                                                            {:clear true}))
                                        (vim.api.nvim_create_autocmd [:BufEnter
                                                                      :BufWritePost
                                                                      :InsertLeave]
                                                                     {:callback (fn []
                                                                                  (when (vim.opt_local.modifiable:get)
                                                                                    (lint.try_lint)))
                                                                      :group lint-augroup}))
                              :event [:BufReadPre :BufNewFile]}
                             {1 :folke/which-key.nvim
                              :event :VimEnter
                              :opts {:delay 0
                                     :icons {:keys (or (and vim.g.have_nerd_font
                                                            {})
                                                       {:BS "<BS> "
                                                        :C "<C-…> "
                                                        :CR "<CR> "
                                                        :D "<D-…> "
                                                        :Down "<Down> "
                                                        :Esc "<Esc> "
                                                        :F1 :<F1>
                                                        :F10 :<F10>
                                                        :F11 :<F11>
                                                        :F12 :<F12>
                                                        :F2 :<F2>
                                                        :F3 :<F3>
                                                        :F4 :<F4>
                                                        :F5 :<F5>
                                                        :F6 :<F6>
                                                        :F7 :<F7>
                                                        :F8 :<F8>
                                                        :F9 :<F9>
                                                        :Left "<Left> "
                                                        :M "<M-…> "
                                                        :NL "<NL> "
                                                        :Right "<Right> "
                                                        :S "<S-…> "
                                                        :ScrollWheelDown "<ScrollWheelDown> "
                                                        :ScrollWheelUp "<ScrollWheelUp> "
                                                        :Space "<Space> "
                                                        :Tab "<Tab> "
                                                        :Up "<Up> "})
                                             :mappings vim.g.have_nerd_font}
                                     :spec [{1 :<leader>s :group "[S]earch"}
                                            {1 :<leader>t :group "[T]oggle"}
                                            {1 :<leader>h
                                             :group "Git [H]unk"
                                             :mode [:n :v]}]}}
                             {1 :nvim-telescope/telescope.nvim
                              :config (fn []
                                        ((. (require :telescope) :setup) {:extensions {:ui-select [((. (require :telescope.themes)
                                                                                                       :get_dropdown))]}})
                                        (pcall (. (require :telescope)
                                                  :load_extension)
                                               :fzf)
                                        (pcall (. (require :telescope)
                                                  :load_extension)
                                               :ui-select)
                                        (local builtin
                                               (require :telescope.builtin))
                                        (vim.keymap.set :n :<leader>sh
                                                        builtin.help_tags
                                                        {:desc "[S]earch [H]elp"})
                                        (vim.keymap.set :n :<leader>sk
                                                        builtin.keymaps
                                                        {:desc "[S]earch [K]eymaps"})
                                        (vim.keymap.set :n :<leader>sf
                                                        builtin.find_files
                                                        {:desc "[S]earch [F]iles"})
                                        (vim.keymap.set :n :<leader>ss
                                                        builtin.builtin
                                                        {:desc "[S]earch [S]elect Telescope"})
                                        (vim.keymap.set :n :<leader>sw
                                                        builtin.grep_string
                                                        {:desc "[S]earch current [W]ord"})
                                        (vim.keymap.set :n :<leader>sg
                                                        builtin.live_grep
                                                        {:desc "[S]earch by [G]rep"})
                                        (vim.keymap.set :n :<leader>sd
                                                        builtin.diagnostics
                                                        {:desc "[S]earch [D]iagnostics"})
                                        (vim.keymap.set :n :<leader>sr
                                                        builtin.resume
                                                        {:desc "[S]earch [R]esume"})
                                        (vim.keymap.set :n :<leader>s.
                                                        builtin.oldfiles
                                                        {:desc "[S]earch Recent Files (\".\" for repeat)"})
                                        (vim.keymap.set :n :<leader><leader>
                                                        builtin.buffers
                                                        {:desc "[ ] Find existing buffers"})
                                        (vim.keymap.set :n :<leader>/
                                                        (fn []
                                                          (builtin.current_buffer_fuzzy_find ((. (require :telescope.themes)
                                                                                                 :get_dropdown) {:previewer false
                                                                                                                 :winblend 10})))
                                                        {:desc "[/] Fuzzily search in current buffer"})
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
                                              :cond (fn []
                                                      (= (vim.fn.executable :make)
                                                         1))}
                                             [:nvim-telescope/telescope-ui-select.nvim]
                                             {1 :nvim-tree/nvim-web-devicons
                                              :enabled vim.g.have_nerd_font}]
                              :event :VimEnter}
                             {1 :Olical/nfnl :ft :fennel :version :1.1.0}
                             {1 :folke/lazydev.nvim
                              :ft :lua
                              :opts {:library [{:path "${3rd}/luv/library"
                                                :words ["vim%.uv"]}]}}
                             {1 :stevearc/conform.nvim
                              :cmd [:ConformInfo]
                              :event [:BufWritePre]
                              :keys [{1 :<leader>f
                                      2 (fn []
                                          ((. (require :conform) :format) {:async true
                                                                           :lsp_format :fallback}))
                                      :desc "[F]ormat buffer"
                                      :mode ""}]
                              :opts {:format_on_save (fn [bufnr]
                                                       (local disable-filetypes
                                                              {:c true
                                                               :cpp true})
                                                       (if (. disable-filetypes
                                                              (. vim.bo bufnr
                                                                 :filetype))
                                                           nil
                                                           {:lsp_format :fallback
                                                            :timeout_ms 500}))
                                     :formatters_by_ft {:lua [:stylua]
                                                        :fennel [:fnlfmt]}
                                     :notify_on_error false}}
                             {1 :saghen/blink.cmp
                              :dependencies [{1 :L3MON4D3/LuaSnip
                                              :build ((fn []
                                                        (when (or (= (vim.fn.has :win32)
                                                                     1)
                                                                  (= (vim.fn.executable :make)
                                                                     0))
                                                          (lua "return "))
                                                        "make install_jsregexp"))
                                              :dependencies {}
                                              :opts {}
                                              :version :2.*}
                                             :folke/lazydev.nvim]
                              :event :VimEnter
                              :opts {:appearance {:nerd_font_variant :mono}
                                     :completion {:documentation {:auto_show false
                                                                  :auto_show_delay_ms 500}}
                                     :fuzzy {:implementation :lua}
                                     :keymap {:preset :default}
                                     :signature {:enabled true}
                                     :snippets {:preset :luasnip}
                                     :sources {:default [:lsp
                                                         :path
                                                         :snippets
                                                         :lazydev]
                                               :providers {:lazydev {:module :lazydev.integrations.blink
                                                                     :score_offset 100}}}}
                              :version :1.*}
                             {1 :folke/tokyonight.nvim
                              :config (fn []
                                        ((. (require :tokyonight) :setup) {:styles {:comments {:italic false}}})
                                        (vim.cmd.colorscheme :tokyonight-night))
                              :priority 1000}
                             {1 :folke/todo-comments.nvim
                              :dependencies [:nvim-lua/plenary.nvim]
                              :event :VimEnter
                              :opts {:signs false}}
                             {1 :echasnovski/mini.nvim
                              :config (fn []
                                        ((. (require :mini.ai) :setup) {:n_lines 500})
                                        ((. (require :mini.surround) :setup))
                                        (local statusline
                                               (require :mini.statusline))
                                        (statusline.setup {:use_icons vim.g.have_nerd_font})

                                        (fn statusline.section_location []
                                          "%2l:%-2v"))}
                             {1 :nvim-treesitter/nvim-treesitter
                              :build ":TSUpdate"
                              :main :nvim-treesitter.configs
                              :opts {:auto_install true
                                     :ensure_installed [:bash
                                                        :c
                                                        :diff
                                                        :html
                                                        :lua
                                                        :luadoc
                                                        :markdown
                                                        :markdown_inline
                                                        :query
                                                        :vim
                                                        :vimdoc]
                                     :highlight {:additional_vim_regex_highlighting [:ruby]
                                                 :enable true}
                                     :indent {:disable [:ruby] :enable true}}}]
                            {:ui {:icons (or (and vim.g.have_nerd_font {})
                                             {:cmd "⌘"
                                              :config "🛠"
                                              :event "📅"
                                              :ft "📂"
                                              :init "⚙"
                                              :keys "🗝"
                                              :lazy "💤 "
                                              :plugin "🔌"
                                              :require "🌙"
                                              :runtime "💻"
                                              :source "📄"
                                              :start "🚀"
                                              :task "📌"})}})

(vim.lsp.config :fennel-ls
                {:cmd ["fennel-ls"]
                 :filetypes ["fennel"]
                 :root_markers ["flsproject.fnl"]})

(vim.lsp.enable :fennel-ls)
