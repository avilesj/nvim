(vim.lsp.config :composelsp
                {:cmd ["docker-compose-langserver" "--stdio"]
                 :filetypes ["yaml"]
                 :root_markers ["docker-compose.yml"
                                "docker-compose.yaml"
                                "compose.yaml"
                                "compose.yml"]})

(if (not ((. (require :mason-registry) :is_installed) :docker-compose-language-service))
    (vim.cmd (.. :MasonInstall " " :docker-compose-language-service)))

(vim.lsp.enable :composelsp)
