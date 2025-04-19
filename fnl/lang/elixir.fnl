(vim.lsp.config :elixir-ls
                {:cmd ["elixir-ls"]
                 :filetypes ["elixir"]
                 :root_markers ["mix.exs"]})

(vim.lsp.enable :elixir-ls)
((. (require :nvim-treesitter.install) :ensure_installed) [:heex :eex])
