;; PURPOSE: Runs lint on buffer based on filetype
{1 :mfussenegger/nvim-lint
 :config (fn []
           (local lint (require :lint))
           (set lint.linters_by_ft {:fennel [:fennel]})
           (local lint-augroup
                  (vim.api.nvim_create_augroup :lint {:clear true}))
           (vim.api.nvim_create_autocmd [:BufEnter :BufWritePost :InsertLeave]
                                        {:callback (fn []
                                                     (when (vim.opt_local.modifiable:get)
                                                       (lint.try_lint)))
                                         :group lint-augroup}))
 :event [:BufReadPre :BufNewFile]}
