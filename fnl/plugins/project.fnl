{1 :ahmedkhalf/project.nvim
  :config (fn []
            ((. (require :project_nvim) :setup) {})
            ((. (require :telescope) :load_extension) :projects))
  :dependencies [:nvim-telescope/telescope.nvim]
  :keys [{1 :<leader>pr
          2 (fn []
              (vim.schedule (fn [] (vim.cmd "Telescope projects"))))
          :desc "recent projects"}]
  :lazy false}
