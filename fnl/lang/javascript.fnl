(vim.lsp.config :tsserver {:cmd ["typescript-language-server" "--stdio"]
                           :filetypes ["javascript"
                                       "javascriptreact"
                                       "javascript.jsx"
                                       "typescript"
                                       "typescriptreact"
                                       "typescript.tsx"]
                           :root_markers [:tsconfig.json
                                          :jsconfig.json
                                          :package.json
                                          :.git]})

(if (not ((. (require :mason-registry) :is_installed) :typescript-language-server))
    (vim.cmd (.. :MasonInstall " " :typescript-language-server)))

(vim.lsp.enable :tsserver)
