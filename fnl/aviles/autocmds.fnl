(local Aviles (vim.api.nvim_create_augroup :Aviles {:clear true}))

(vim.api.nvim_create_autocmd :TextYankPost
                             {:callback (fn [] (vim.highlight.on_yank))
                              :desc "Highlight when yanking (copying) text"
                              :group Aviles})

(vim.api.nvim_create_autocmd :BufWritePost
                             {:callback (fn [] (vim.fn.system "templ generate")
                                          (vim.cmd :LspRestart))
                              :group Aviles
                              :pattern :*.templ})

(vim.api.nvim_create_autocmd [:BufWritePre]
                             {:callback (fn [event]
                                          (when (event.match:match "^%w%w+://")
                                            (lua "return "))
                                          (local file
                                                 (or (vim.loop.fs_realpath event.match)
                                                     event.match))
                                          (vim.fn.mkdir (vim.fn.fnamemodify file
                                                                            ":p:h")
                                                        :p))
                              :group Aviles})

(vim.api.nvim_create_autocmd [:BufWritePre]
                             {:callback (fn []
                                          (vim.api.nvim_buf_call (vim.api.nvim_get_current_buf) (fn [] (vim.cmd "normal gg=G")))
                                          )
                             :pattern :*.fnl
                             :group Aviles})

