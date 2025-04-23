(local buffer {})

(fn buffer.delete-buffers [list]
  ;; Deletes all buffers in the list
  (each [_ v (ipairs list)]
    (vim.api.nvim_buf_delete v {:force false})))

buffer
