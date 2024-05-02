[{1 :stevearc/dressing.nvim
  :init (fn []
          (fn vim.ui.select [...]
            ((. (require :lazy) :load) {:plugins [:dressing.nvim]})
            (vim.ui.select ...))

          (fn vim.ui.input [...]
            ((. (require :lazy) :load) {:plugins [:dressing.nvim]})
            (vim.ui.input ...)))
  :lazy true}
 {1 :akinsho/bufferline.nvim
  :config (fn [_ opts]
            ((. (require :bufferline) :setup) opts)
            (vim.api.nvim_create_autocmd :BufAdd
                                         {:callback (fn []
                                                      (vim.schedule (fn []
                                                                      (pcall nvim-bufferline))))}))
  :event :VeryLazy
  :keys [{1 :<leader>bp 2 :<Cmd>BufferLineTogglePin<CR> :desc "Toggle Pin"}
         {1 :<leader>bP
          2 "<Cmd>BufferLineGroupClose ungrouped<CR>"
          :desc "Delete Non-Pinned Buffers"}
         {1 :<leader>bo
          2 :<Cmd>BufferLineCloseOthers<CR>
          :desc "Delete Other Buffers"}
         {1 :<leader>br
          2 :<Cmd>BufferLineCloseRight<CR>
          :desc "Delete Buffers to the Right"}
         {1 :<leader>bl
          2 :<Cmd>BufferLineCloseLeft<CR>
          :desc "Delete Buffers to the Left"}
         {1 :<S-h> 2 :<cmd>BufferLineCyclePrev<cr> :desc "Prev Buffer"}
         {1 :<S-l> 2 :<cmd>BufferLineCycleNext<cr> :desc "Next Buffer"}
         {1 "[b" 2 :<cmd>BufferLineCyclePrev<cr> :desc "Prev Buffer"}
         {1 "]b" 2 :<cmd>BufferLineCycleNext<cr> :desc "Next Buffer"}]
  :opts {:options {:always_show_bufferline false
                   :close_command (fn [n]
                                    ((. (require :mini.bufremove) :delete) n
                                                                           false))
                   :diagnostics :nvim_lsp
                   :offsets [{:filetype :neo-tree
                              :highlight :Directory
                              :text :Neo-tree
                              :text_align :left}]
                   :right_mouse_command (fn [n]
                                          ((. (require :mini.bufremove) :delete) n
                                                                                 false))}}}
 {1 :nvim-lualine/lualine.nvim
  :event :VeryLazy
  :init (fn []
          (set vim.g.lualine_laststatus vim.o.laststatus)
          (if (> (vim.fn.argc (- 1)) 0) (set vim.o.statusline " ")
              (set vim.o.laststatus 0)))
  :opts (fn []
          (local lualine-require (require :lualine_require))
          (set lualine-require.require require)
          (set vim.o.laststatus vim.g.lualine_laststatus)
          {:extensions [:neo-tree :lazy]
           :options {:disabled_filetypes {:statusline [:dashboard
                                                       :alpha
                                                       :starter]}
                     :globalstatus true
                     :theme :auto}
           :sections {:lualine_a [:mode]
                      :lualine_b [:branch]
                      :lualine_c [{1 :diagnostics
                                   :symbols {:error :ERR
                                             :hint :HINT
                                             :info :INFO
                                             :warn :WARN}}
                                  {1 :filetype
                                   :icon_only true
                                   :padding {:left 1 :right 0}
                                   :separator ""}]
                      :lualine_x [[:copilot]
                                  {1 (fn []
                                       ((. (require :noice) :api :status
                                           :command :get)))
                                   :cond (fn []
                                           (and (. package.loaded :noice)
                                                ((. (require :noice) :api
                                                    :status :command :has))))}
                                  {1 (fn []
                                       ((. (require :noice) :api :status :mode
                                           :get)))
                                   :cond (fn []
                                           (and (. package.loaded :noice)
                                                ((. (require :noice) :api
                                                    :status :mode :has))))}
                                  {1 (fn []
                                       (.. "  " ((. (require :dap) :status))))
                                   :cond (fn []
                                           (and (. package.loaded :dap)
                                                (not= ((. (require :dap)
                                                          :status))
                                                      "")))}
                                  {1 (. (require :lazy.status) :updates)
                                   :cond (. (require :lazy.status) :has_updates)}
                                  {1 :diff
                                   :source (fn []
                                             (local gitsigns
                                                    vim.b.gitsigns_status_dict)
                                             (when gitsigns
                                               {:added gitsigns.added
                                                :modified gitsigns.changed
                                                :removed gitsigns.removed}))
                                   :symbols {}}]
                      :lualine_y [{1 :progress
                                   :padding {:left 1 :right 0}
                                   :separator " "}
                                  {1 :location :padding {:left 0 :right 1}}]
                      :lualine_z [(fn [] (.. " " (os.date "%R")))]}})}]

