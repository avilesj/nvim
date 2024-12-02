(local lazypath (.. (vim.fn.stdpath :data) :/lazy/lazy.nvim))

(when (not (vim.loop.fs_stat lazypath))
  (vim.fn.system [:git
                   :clone
                   "--filter=blob:none"
                   "https://github.com/folke/lazy.nvim.git"
                   :--branch=stable
                   lazypath]))

(vim.opt.rtp:prepend (or vim.env.LAZY lazypath))

((. (require :lazy) :setup) {:checker {:enabled true}
                            :defaults {:lazy false :version false}
                            :install {:colorscheme [:tokyonight :habamax]}
                            :performance {:rtp {:disabled_plugins [:gzip
                                                                    :tarPlugin
                                                                    :tohtml
                                                                    :tutor
                                                                    :zipPlugin]}}
                            :spec [{1 :LazyVim/LazyVim
                                      :import :lazyvim.plugins}
                                      {:import :lazyvim.plugins.extras.lang.typescript}
                                      {:import :lazyvim.plugins.extras.lang.python}
                                      {:import :lazyvim.plugins.extras.lang.go}
                                      {:import :lazyvim.plugins.extras.lang.clojure}
                                      {:import :lazyvim.plugins.extras.lang.json}
                                      {:import :lazyvim.plugins.extras.lang.omnisharp}
                                      {:import :lazyvim.plugins.extras.lang.elixir}
                                      {:import :lazyvim.plugins.extras.lang.tailwind}
                                      {:import :lazyvim.plugins.extras.dap.core}
                                      {:import :lazyvim.plugins.extras.ui.mini-animate}
                                      {:import :lazyvim.plugins.extras.util.project}
                                      {:import :lazyvim.plugins.extras.coding.mini-surround}
                                      {:import :plugins}]})

