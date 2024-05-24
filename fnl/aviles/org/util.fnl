(local M (setmetatable {} {:__call (fn [m ...] (m.open ...))}))

(fn M.build-org-filepath [dir filename]
  "
  Concats directory and filename and adds the .org extension
  "
  (.. dir "/" filename :.org)
  )
(fn M.get-workspace-subdir-path [subdir]
  (. (require :orgmode.config) subdir)
  )
(fn M.new-file [dir name]
  (local filename (M.build-org-filepath dir name))
  (local bufnr (vim.api.nvim_create_buf true false))
  (vim.api.nvim_buf_set_name bufnr filename)
  (tset (. vim.bo bufnr) :filetype :org)
  (vim.api.nvim_command (.. "edit " filename))
  (vim.cmd.only))

(fn M.new-ticket []
  (let [ticket (string.upper (vim.fn.input "Ticket name: "))]
    (M.new-file (M.get-workspace-subdir-path :org_tickets_dir) ticket)
    )
  )
(fn M.new-file-from-template [template destination name]
  (local destination-dir
         (.. (M.get-workspace-subdir-path :org_workspace_dir) destination))
  (local template-file
         (M.build-org-filepath (M.get-workspace-subdir-path :org_templates_dir) template))
  (local file (io.open template-file :r))
  (if file (do
             (local filename
                    (.. destination-dir "/" name :.org))
             (local bufnr (vim.api.nvim_create_buf true false))
             (local lines {})
             (each [line (file:lines)] (table.insert lines line))
             (file:close)
             (vim.api.nvim_buf_set_name bufnr filename)
             (vim.api.nvim_buf_set_lines bufnr 0 (- 1) false lines)
             (tset (. vim.bo bufnr) :filetype :org)
             (vim.api.nvim_command (.. "edit " filename))
             (vim.cmd.only))
      (print (.. "File not found: " template-file))))

(fn M.new-meeting []
  (let [template "meeting"
                 destination (M.get-workspace-subdir-path :org_meetings_dir)
                 filename (os.date "%Y-%m-%d-%H%M%S")
                 ] 
    (M.new-file-from-template template destination filename)
    )
  )

(fn M.find-in-workspace-dir [dir] 
  (let [search (require :aviles.util.fs)]
    (search.telescope dir)
    )
  )

M
