[{1 :neovim/nvim-lspconfig
  :config (fn []
            (vim.api.nvim_create_autocmd :LspAttach
                                         {:callback (fn [event]
                                                      (fn map [keys func desc]
                                                        (vim.keymap.set :n keys
                                                                        func
                                                                        {:buffer event.buf
                                                                         :desc (.. "LSP: "
                                                                                   desc)}))

                                                      (map :gd
                                                           (. (require :telescope.builtin)
                                                              :lsp_definitions)
                                                           "[G]oto [D]efinition")
                                                      (map :gr
                                                           (. (require :telescope.builtin)
                                                              :lsp_references)
                                                           "[G]oto [R]eferences")
                                                      (map :gI
                                                           (. (require :telescope.builtin)
                                                              :lsp_implementations)
                                                           "[G]oto [I]mplementation")
                                                      (map :<leader>D
                                                           (. (require :telescope.builtin)
                                                              :lsp_type_definitions)
                                                           "Type [D]efinition")
                                                      (map :<leader>ds
                                                           (. (require :telescope.builtin)
                                                              :lsp_document_symbols)
                                                           "[D]ocument [S]ymbols")
                                                      (map :<leader>ws
                                                           (. (require :telescope.builtin)
                                                              :lsp_dynamic_workspace_symbols)
                                                           "[W]orkspace [S]ymbols")
                                                      (map :<leader>rn
                                                           vim.lsp.buf.rename
                                                           "[R]e[n]ame")
                                                      (map :<leader>ca
                                                           vim.lsp.buf.code_action
                                                           "[C]ode [A]ction")
                                                      (map :K vim.lsp.buf.hover
                                                           "Hover Documentation")
                                                      (map :gD
                                                           vim.lsp.buf.declaration
                                                           "[G]oto [D]eclaration")
                                                      (local client
                                                             (vim.lsp.get_client_by_id event.data.client_id))
                                                      (when (and client
                                                                 client.server_capabilities.documentHighlightProvider)
                                                        (vim.api.nvim_create_autocmd [:CursorHold
                                                                                      :CursorHoldI]
                                                                                     {:buffer event.buf
                                                                                      :callback vim.lsp.buf.document_highlight})
                                                        (vim.api.nvim_create_autocmd [:CursorMoved
                                                                                      :CursorMovedI]
                                                                                     {:buffer event.buf
                                                                                      :callback vim.lsp.buf.clear_references}))
                                                      (when (and (and client
                                                                      client.server_capabilities.inlayHintProvider)
                                                                 vim.lsp.inlay_hint)
                                                        (map :<leader>th
                                                             (fn []
                                                               (vim.lsp.inlay_hint.enable 0
                                                                                          (not (vim.lsp.inlay_hint.is_enabled))))
                                                             "[T]oggle Inlay [H]ints")))
                                          :group (vim.api.nvim_create_augroup :kickstart-lsp-attach
                                                                              {:clear true})})
            (var capabilities (vim.lsp.protocol.make_client_capabilities))
            (set capabilities
                 (vim.tbl_deep_extend :force capabilities
                                      ((. (require :cmp_nvim_lsp)
                                          :default_capabilities))))
            (local servers
                   {:fennel_ls {:filetypes [:fennel]
                                :root_dir (fn []
                                            (local util
                                                   (require :aviles.util.fs))
                                            (util.find_file_dir :.nfnl.fnl))}
                    :gopls {}
                    :html {}
                    :htmx {}
                    :lua_ls {:settings {:Lua {:completion {:callSnippet :Replace}}}}
                    :tailwindcss {}
                    :templ {}
                    :tsserver {:keys [{1 :<leader>co
                                       2 (fn []
                                           (vim.lsp.buf.code_action {:apply true
                                                                     :context {:diagnostics {}
                                                                               :only [:source.organizeImports.ts]}}))
                                       :desc "Organize Imports"}
                                      {1 :<leader>cR
                                       2 (fn []
                                           (vim.lsp.buf.code_action {:apply true
                                                                     :context {:diagnostics {}
                                                                               :only [:source.removeUnused.ts]}}))
                                       :desc "Remove Unused Imports"}]
                               :root_dir (fn [filename]
                                           (local util
                                                  (require :lspconfig.util))
                                           (or (util.find_package_json_ancestor filename)
                                               (util.find_git_ancestor)))
                               :settings {:completions {:completeFunctionCalls true}}}})
            ((. (require :mason) :setup))
            (local ensure-installed (vim.tbl_keys (or servers {})))
            (vim.list_extend ensure-installed [:stylua])
            ((. (require :mason-tool-installer) :setup) {:ensure_installed ensure-installed})
            ((. (require :mason-lspconfig) :setup) {:handlers [(fn [server-name]
                                                                 (local server
                                                                        (or (. servers
                                                                               server-name)
                                                                            {}))
                                                                 (set server.capabilities
                                                                      (vim.tbl_deep_extend :force
                                                                                           {}
                                                                                           capabilities
                                                                                           (or server.capabilities
                                                                                               {})))
                                                                 ((. (require :lspconfig)
                                                                     server-name
                                                                     :setup) server))]}))
  :dependencies [{1 :williamboman/mason.nvim :config true}
                 :williamboman/mason-lspconfig.nvim
                 :WhoIsSethDaniel/mason-tool-installer.nvim
                 {1 :j-hui/fidget.nvim :opts {}}
                 {1 :folke/neodev.nvim :opts {}}]}]

