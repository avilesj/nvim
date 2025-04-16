{1 :stevearc/conform.nvim
 :cmd [:ConformInfo]
 :event [:BufWritePre]
 :keys [{1 :<leader>f
         2 (fn []
             ((. (require :conform) :format) {:async true
                                              :lsp_format :fallback}))
         :desc "[F]ormat buffer"
         :mode ""}]
 :opts {:format_on_save (fn [bufnr]
                          (local disable-filetypes {:c true :cpp true})
                          (if (. disable-filetypes (. vim.bo bufnr :filetype))
                              nil
                              {:lsp_format :fallback :timeout_ms 500}))
        :formatters_by_ft {:lua [:stylua] :fennel [:fnlfmt]}
        :notify_on_error false}}
