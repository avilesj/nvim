{1 :folke/tokyonight.nvim
 :config (fn []
           ((. (require :tokyonight) :setup) {:styles {:comments {:italic false}}})
           (vim.cmd.colorscheme :tokyonight-night))
 :priority 1000}
