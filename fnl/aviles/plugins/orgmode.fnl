[{1 :nvim-orgmode/orgmode
  :config (fn []
            (local workspace (.. (os.getenv :HOME) :/notes))
            ((. (require :orgmode) :setup) {:org_agenda_files (.. workspace
                                                                  "/**/*")
                                            :org_default_notes_file "~/notes/refile.org"
                                            :org_meetings_dir (.. workspace
                                                                  :/meetings)
                                            :org_templates_dir (.. workspace
                                                                   :/templates)}))
  :event :VeryLazy
  :ft [:org]
  :keys [{1 :<leader>omn
          2 (fn []
              (local meetings-dir
                     (. (require :orgmode.config) :org_meetings_dir))
              (local meeting-template-file
                     (.. (. (require :orgmode.config) :org_templates_dir)
                         :/meeting.org))
              (print meeting-template-file)
              (local file (io.open meeting-template-file :r))
              (local content nil)
              (if file (do
                         (local current-time (os.date "%Y-%m-%d-%H%M%S"))
                         (local filename
                                (.. meetings-dir "/" current-time :.org))
                         (local bufnr (vim.api.nvim_create_buf true false))
                         (local lines {})
                         (each [line (file:lines)] (table.insert lines line))
                         (file:close)
                         (vim.api.nvim_buf_set_name bufnr filename)
                         (vim.api.nvim_buf_set_lines bufnr 0 (- 1) false lines)
                         (tset (. vim.bo bufnr) :filetype :org)
                         (vim.api.nvim_command (.. "edit " filename))
                         (vim.cmd.only))
                  (print (.. "File not found: " meeting-template-file))))
          :desc "New meeting file"}]}]

