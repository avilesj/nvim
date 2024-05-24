(local M (setmetatable {} {:__call (fn [m ...] (m.open ...))}))

(fn M.find_git_dir [] (M.find_file_dir :.git))

(fn M.find_file_dir [filename]
  (var cwd (vim.loop.cwd))
  (var path (.. cwd "/" filename))
  (var dir cwd)
  (while (not (vim.loop.fs_stat path))
    (local parent-dir (vim.fn.fnamemodify cwd ":h"))
    (when (= parent-dir cwd) (lua "return nil"))
    (set cwd parent-dir)
    (set dir cwd)
    (set path (.. cwd "/" filename)))
  dir)

(fn M.telescope [dir]
  (let [telescope (require :telescope.builtin)]
    (telescope.find_files {:cwd dir}))
  )
M

