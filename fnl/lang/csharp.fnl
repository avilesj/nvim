(vim.lsp.config :omnisharp
                {:cmd ["omnisharp"
                       "--languageserver"
                       "--hostPID"
                       (.. (vim.fn.getpid))]
                 :filetypes ["cs"]
                 :root_markers ["*.sln"
                                "*.csproj"
                                "Directory.Build.props"
                                "Directory.Build.targets"]})

(if (not ((. (require :mason-registry) :is_installed) :omnisharp))
    (vim.cmd (.. :MasonInstall " " :omnisharp)))

(vim.lsp.enable :omnisharp)
