(local org (require :aviles.org.util))

[{1 :nvim-orgmode/orgmode
    :config (fn []
              (local workspace (.. (os.getenv :HOME) :/notes))
              ((. (require :orgmode) :setup) {:org_agenda_files (.. workspace
                                                                    "/**/*")
                                             :org_default_notes_file "~/notes/refile.org"
                                             :org_meetings_dir (.. workspace
                                                                   :/meetings)
                                             :org_tickets_dir (.. workspace
                                                                  :/tickets)
                                             :org_workspace_dir workspace
                                             :org_templates_dir (.. workspace
                                                                    :/templates)}))
    :event :VeryLazy
    :ft [:org]
    :keys [[:<leader>onm
             #(org.new-meeting)
             {:desc "New meeting file"}]
           [:<leader>oss
             #(org.find-in-workspace-dir (. (require :orgmode.config ) :org_workspace_dir))
             {:desc "Search all org files"}
             ]
           [:<leader>osm
             #(org.find-in-workspace-dir (. (require :orgmode.config ) :org_meetings_dir))
             {:desc "Search meetings"}
             ]
           [:<leader>osa
             #(org.find-in-workspace-dir (. (require :orgmode.config ) :org_articles_dir))
             {:desc "Search articles"}
             ]
           [:<leader>ost
             #(org.find-in-workspace-dir (. (require :orgmode.config ) :org_tickets_dir))
             {:desc "Search tickets"}
             ]
           [:<leader>onf
             #(org.new-file (. (require :orgmode.config) :org_workspace_dir) (vim.fn.input "File name: "))
             {:desc "New org file"}]

           [:<leader>ont
             #(org.new-ticket)
             {:desc "New ticket"}]
           ]}
    ]

