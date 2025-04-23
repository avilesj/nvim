(local window {})

(fn window.delete-windows [list]
  ;; Deletes all windows in the list
  (each [_ v (ipairs list)]
    (vim.api.nvim_win_close v false)))

window
