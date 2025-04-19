(vim.lsp.config :tailwindcss-language-server
                {:cmd ["tailwindcss-language-server" "--stdio"]
                 :filetypes ["elixir"
                             "heex"
                             "eelixir"
                             "eex"
                             "html-eex"
                             "javascript"
                             "html"
                             "svelte"]
                 :init_options {:userLanguages {:eelixir "html-eex"
                                                :elixir "html-eex"
                                                :heex "html-eex"}}
                 :settings {:tailwindCSS {:includeLanguages {:eelixir :html-eex
                                                             :elixir :html-eex
                                                             :heex :html-eex}
                                          :validate true
                                          :lint {:cssConflict "warning"
                                                 :invalidApply "error"
                                                 :invalidScreen "error"
                                                 :invalidVariant "error"
                                                 :invalidConfigPath "error"
                                                 :invalidTailwindDirective "error"
                                                 :recommendedVariantOrder "warning"}
                                          :classAttributes ["class"
                                                            "className"
                                                            "class:list"
                                                            "classList"
                                                            "ngClass"]
                                          ;; Tailwind v3, Elixir
                                          :experimental {:configFile {"assets/tailwind.config.js" "lib/**"}}}}
                 :root_markers ["mix.exs" "tailwind.config.js"]})

(vim.lsp.enable :tailwindcss-language-server)
(if (not ((. (require :mason-registry) :is_installed) :tailwindcss-language-server))
    (vim.cmd (.. :MasonInstall " " :tailwindcss-language-server)))
