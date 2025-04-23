(vim.lsp.config :json-lsp
                {:cmd ["vscode-json-language-server" "--stdio"]
                 :filetypes ["json"]
                 :settings {:json {:format {:enable true}
                                   :validate {:enable true}}}})

(if (not ((. (require :mason-registry) :is_installed) :json-lsp))
    (vim.cmd (.. :MasonInstall " " :json-lsp)))

(vim.lsp.enable :json-lsp)
