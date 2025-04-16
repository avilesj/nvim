(vim.lsp.config :fennel-ls
                {:cmd ["fennel-ls"]
                 :filetypes ["fennel"]
                 :root_markers ["flsproject.fnl"]})

(vim.lsp.enable :fennel-ls)
