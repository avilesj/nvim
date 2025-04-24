;; PURPOSE: It enhances some builtin textobjects (like a(, a), a', and more), creates new ones (like a*, a<Space>, af, a?, and more), and allows user to create their own (like based on treesitter, and more).
;; Could be a bit too abstract -- might not need it.
{1 :echasnovski/mini.nvim
 :config (fn []
           ((. (require :mini.ai) :setup) {:n_lines 500})
           ((. (require :mini.surround) :setup) {:mappings {:add "gsa"
                                                            :delete "gsd"
                                                            :find "gsf"
                                                            :find_left "gsF"
                                                            :highlight "gsh"
                                                            :replace "gsr"
                                                            :update_n_lines "gsn"}})
           (local statusline (require :mini.statusline))
           (statusline.setup {:use_icons vim.g.have_nerd_font})

           (fn statusline.section_location []
             "%2l:%-2v"))}
