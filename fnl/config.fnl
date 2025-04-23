(local filter (. (require :functions.core) :filter))
(set vim.g.mapleader " ")
(set vim.g.maplocalleader "\\")
(set vim.g.have_nerd_font true)
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
(set vim.opt.relativenumber true)
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
(vim.keymap.set :n :<leader>uw
                (fn []
                  (set vim.wo.wrap (not vim.wo.wrap)))
                {:desc "Toggle wrap"})

;; Buffer management
(vim.keymap.set :n :<leader>bb "<C-^>"
                {:desc "Back to previous active buffer"
                 :noremap true
                 :silent true})

(fn delete-buffers [list]
  ;; Deletes all buffers in the list
  (each [_ v (ipairs list)]
    (vim.api.nvim_buf_delete v {:force false})))

(vim.keymap.set :n :<leader>bd ":bd<CR>"
                {:desc "Delete current buffer" :noremap true :silent true})

(vim.keymap.set :n :<leader>bo
                (fn []
                  (let [current-buffer (vim.api.nvim_get_current_buf)
                        list-of-buffers (vim.api.nvim_list_bufs)]
                    (-> list-of-buffers
                        (filter current-buffer)
                        delete-buffers)))
                {:desc "Close other buffers" :noremap true :silent true})

;; Window management
(fn delete-windows [list]
  ;; Deletes all windows in the list
  (each [_ v (ipairs list)]
    (vim.api.nvim_win_close v false)))

(vim.keymap.set :n :<leader>wo
                (fn []
                  (let [current-window (vim.api.nvim_get_current_win)
                        list-of-windows (vim.api.nvim_list_wins)]
                    (-> list-of-windows
                        (filter current-window)
                        delete-windows)))
                {:desc "Close other windows" :noremap true :silent true})

;; autocmd
(vim.api.nvim_create_autocmd :TextYankPost
                             {:callback (fn [] (vim.highlight.on_yank))
                              :desc "Highlight when yanking (copying) text"
                              :group (vim.api.nvim_create_augroup :kickstart-highlight-yank
                                                                  {:clear true})})

;; LSP keybinds
(fn telescope-builtin []
  ;; implement me :)
  )

(vim.keymap.set :n :<leader>ca vim.lsp.buf.code_action {:desc "Code actions"})
(vim.keymap.set :n :<leader>cr vim.lsp.buf.rename
                {:desc "Rename" :noremap true :silent true})

(vim.keymap.set :n :<leader>cs vim.lsp.buf.document_symbol
                {:desc "Symbols" :noremap true :silent true})

;; [LSP] remove default keybinds
(vim.keymap.del :n :grr)
(vim.keymap.del :n :grn)
(vim.keymap.del :n :gra)
(vim.keymap.del :n :gri)
(vim.keymap.set :n :gr vim.lsp.buf.references
                {:desc "Go to references" :noremap true :silent true})

(vim.keymap.set :n :gD vim.lsp.buf.declaration
                {:desc "Go to declaration" :noremap true :silent true})

(vim.keymap.set :n :gd vim.lsp.buf.definition
                {:desc "Go to definition" :noremap true :silent true})

;; Lazyvim load
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
((. (require :lazy) :setup) "plugins"
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

(fn load-langs [languages]
  ;; Load languages configurations
  (each [k v (ipairs languages)]
    (require (.. "lang" "." v))))

(load-langs ["fennel" "elixir" "tailwindcss" "javascript"])
