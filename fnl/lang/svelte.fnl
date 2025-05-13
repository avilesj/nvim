(vim.lsp.config :svelte {:cmd ["svelteserver" "--stdio"]
                         :filetypes ["svelte"]
                         :root_markers [:tsconfig.json
                                        :jsconfig.json
                                        :package.json
                                        :.git]})

(if (not ((. (require :mason-registry) :is_installed) :svelte-language-server))
    (vim.cmd (.. :MasonInstall " " :svelte-language-server)))

(vim.lsp.enable :svelte)
