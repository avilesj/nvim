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

;; ASTRO
(vim.lsp.config :astro-language-server
                {:cmd ["astro-ls" "--stdio"]
                 :filetypes ["astro"]
                 :init_options {:typescript {:tsdk "./node_modules/typescript/lib"}}
                 :root_markers [:astro.config.mjs]})

(if (not ((. (require :mason-registry) :is_installed) :astro-language-server))
    (vim.cmd (.. :MasonInstall " " :astro-language-server)))

(vim.lsp.enable :astro-language-server)
