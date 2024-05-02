(require :aviles.pre-init)
(local lazypath (.. (vim.fn.stdpath :data) :/lazy/lazy.nvim))
(when (not (vim.loop.fs_stat lazypath))
  (local lazyrepo "https://github.com/folke/lazy.nvim.git")
  (vim.fn.system [:git
                  :clone
                  "--filter=blob:none"
                  :--branch=stable
                  lazyrepo
                  lazypath]))
(vim.opt.rtp:prepend lazypath)
((. (require :lazy) :setup) :aviles.plugins
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
(require :aviles.autocmds)
(require :aviles.config)
(require :aviles.keymaps)	
