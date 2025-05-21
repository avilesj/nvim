(vim.lsp.config :elixir-ls
                {:cmd ["elixir-ls"]
                 :filetypes ["elixir" "heex" "eelixir" "eex" "html-eex"]
                 :root_markers ["mix.exs"]})

(if (not ((. (require :mason-registry) :is_installed) :elixir-ls))
    (vim.cmd (.. :MasonInstall " " :elixir-ls)))

(vim.lsp.enable :elixir-ls)
((. (require :nvim-treesitter.install) :ensure_installed) [:heex :eex])
