[{1 :neovim/nvim-lspconfig
  :opts {:servers {:tsserver {:root_dir ((. (require :lspconfig.util)
                                            :root_pattern) :package.json)
                              :single_file_support false}}}}
 {1 :mfussenegger/nvim-dap
  :opts (fn []
          (local dap (require :dap))
          (each [_ language (ipairs [:typescript :javascript])]
            (tset dap.configurations language
                  [{:cwd "${workspaceFolder}"
                    :name "Auto attach to NodeJS process"
                    :processId (fn []
                                 ((. (require :dap.utils) :pick_process) {:filter :--inspect}))
                    :request :attach
                    :type :pwa-node}
                   {:cwd "${workspaceFolder}"
                    :name "Attach to NodeJS process"
                    :processId (. (require :dap.utils) :pick_process)
                    :request :attach
                    :type :pwa-node}
                   {:cwd "${workspaceFolder}"
                    :name "Launch file"
                    :program "${file}"
                    :request :launch
                    :type :pwa-node}])))}]

