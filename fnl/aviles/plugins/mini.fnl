[{1 :echasnovski/mini.nvim
  :config (fn []
            ((. (require :mini.ai) :setup) {:n_lines 500})
            ((. (require :mini.surround) :setup))
            (local statusline (require :mini.statusline))
            (statusline.setup {:use_icons vim.g.have_nerd_font})

            (fn statusline.section_location []
              "%2l:%-2v"))}]

