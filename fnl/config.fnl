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
;; autocmd
(vim.api.nvim_create_autocmd :TextYankPost
                             {:callback (fn [] (vim.highlight.on_yank))
                              :desc "Highlight when yanking (copying) text"
                              :group (vim.api.nvim_create_augroup :kickstart-highlight-yank
                                                                  {:clear true})})

(vim.diagnostic.config {:virtual_text true})

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

;; Keymaps
(require :keymaps)
;; AutoCMDs
(require :autocmds)

;; Language config files
(local langs [:fennel :elixir :tailwindcss :javascript :python :json :svelte])
(local require-list (. (require :functions.core) :require-list))
(require-list langs "lang.")

;; Theme
(vim.cmd.colorscheme :cyberdream)
