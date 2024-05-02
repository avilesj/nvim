[{1 :echasnovski/mini.surround
  :keys (fn [_ keys]
          (local plugin (. (require :lazy.core.config) :spec :plugins
                           :mini.surround))
          (local opts
                 ((. (require :lazy.core.plugin) :values) plugin :opts false))
          (var mappings
               [{1 opts.mappings.add :desc "Add Surrounding" :mode [:n :v]}
                {1 opts.mappings.delete
                 :desc "Delete Surrounding"
                 :mode [:n :v]}
                {1 opts.mappings.find :desc "Find Right Surrounding"}
                {1 opts.mappings.find_left :desc "Find Left Surrounding"}
                {1 opts.mappings.highlight :desc "Highlight Surrounding"}
                {1 opts.mappings.replace :desc "Replace Surrounding"}
                {1 opts.mappings.update_n_lines
                 :desc "Update `MiniSurround.config.n_lines`"}])
          (set mappings (vim.tbl_filter (fn [m]
                                          (and (. m 1) (> (length (. m 1)) 0)))
                                        mappings))
          (vim.list_extend mappings keys))
  :opts {:mappings {:add :gsa
                    :delete :gsd
                    :find :gsf
                    :find_left :gsF
                    :highlight :gsh
                    :replace :gsr
                    :update_n_lines :gsn}}}]

