(vim.lsp.config :pyright
                {:cmd ["pyright-langserver" "--stdio"]
                 :filetypes ["python"]
                 :settings {:python {:analysis {:autoSearchPaths true
                                                :useLibraryCodeForTypes true}}}
                 :root_markers ["Pipfile" "pyrightconfig.json"]})

(if (not ((. (require :mason-registry) :is_installed) :pyright))
    (vim.cmd (.. :MasonInstall " " :pyright)))

(vim.lsp.enable :pyright)
