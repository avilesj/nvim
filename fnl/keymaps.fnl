(local filter (. (require :functions.core) :filter))
(local delete-windows (. (require :functions.window) :delete-windows))
(local delete-buffers (. (require :functions.buffer) :delete-buffers))
(vim.keymap.set :n :<Esc> :<cmd>nohlsearch<CR>)
(vim.keymap.set :n :<leader>q vim.diagnostic.setloclist
                {:desc "Open diagnostic [Q]uickfix list"})

(vim.keymap.set :t :<Esc><Esc> "<C-\\><C-n>" {:desc "Exit terminal mode"})
(vim.keymap.set :n :<C-h> :<C-w><C-h> {:desc "Move focus to the left window"})
(vim.keymap.set :n :<C-l> :<C-w><C-l> {:desc "Move focus to the right window"})
(vim.keymap.set :n :<C-j> :<C-w><C-j> {:desc "Move focus to the lower window"})
(vim.keymap.set :n :<C-k> :<C-w><C-k> {:desc "Move focus to the upper window"})
(vim.keymap.set :n :<leader>uw
                (fn []
                  (set vim.wo.wrap (not vim.wo.wrap)))
                {:desc "Toggle wrap"})

;; Buffer management
(vim.keymap.set :n :<leader>bb "<C-^>"
                {:desc "Back to previous active buffer"
                 :noremap true
                 :silent true})

(vim.keymap.set :n :<leader>bd ":bd<CR>"
                {:desc "Delete current buffer" :noremap true :silent true})

(vim.keymap.set :n :<leader>bo
                (fn []
                  (let [current-buffer (vim.api.nvim_get_current_buf)
                        list-of-buffers (vim.api.nvim_list_bufs)]
                    (-> list-of-buffers
                        (filter current-buffer)
                        delete-buffers)))
                {:desc "Close other buffers" :noremap true :silent true})

;; Window management
(vim.keymap.set :n :<leader>wo
                (fn []
                  (let [current-window (vim.api.nvim_get_current_win)
                        list-of-windows (vim.api.nvim_list_wins)]
                    (-> list-of-windows
                        (filter current-window)
                        delete-windows)))
                {:desc "Close other windows" :noremap true :silent true})

;; LSP keybinds
(vim.keymap.set :n :<leader>ca vim.lsp.buf.code_action {:desc "Code actions"})
(vim.keymap.set :n :<leader>cr vim.lsp.buf.rename
                {:desc "Rename" :noremap true :silent true})

(vim.keymap.set :n :<leader>cs vim.lsp.buf.document_symbol
                {:desc "Symbols" :noremap true :silent true})

;; Diagnostics
(vim.keymap.set :n :<leader>cd vim.diagnostic.open_float
                {:desc "Line Diagnostics"})

;; [LSP] remove default keybinds
(vim.keymap.del :n :grr)
(vim.keymap.del :n :grn)
(vim.keymap.del :n :gra)
(vim.keymap.del :n :gri)
(vim.keymap.set :n :gr vim.lsp.buf.references
                {:desc "Go to references" :noremap true :silent true})

(vim.keymap.set :n :gD vim.lsp.buf.declaration
                {:desc "Go to declaration" :noremap true :silent true})

(vim.keymap.set :n :gd vim.lsp.buf.definition
                {:desc "Go to definition" :noremap true :silent true})
