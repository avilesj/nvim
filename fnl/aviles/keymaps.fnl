(set vim.opt.hlsearch true)

(local map vim.keymap.set)

(map :n :<Esc> :<cmd>nohlsearch<CR>)

(map :n :<leader>cd vim.diagnostic.open_float {:desc "Line Diagnostics"})

(map :n "[d" vim.diagnostic.goto_prev
     {:desc "Go to previous [D]iagnostic message"})

(map :n "]d" vim.diagnostic.goto_next {:desc "Go to next [D]iagnostic message"})

(map :t :<Esc><Esc> "<C-\\><C-n>" {:desc "Exit terminal mode"})

(map :n :<C-h> :<C-w><C-h> {:desc "Move focus to the left window"})

(map :n :<C-l> :<C-w><C-l> {:desc "Move focus to the right window"})

(map :n :<C-j> :<C-w><C-j> {:desc "Move focus to the lower window"})

(map :n :<C-k> :<C-w><C-k> {:desc "Move focus to the upper window"})

(map :n :<S-h> :<cmd>bprevious<cr> {:desc "Prev Buffer"})

(map :n :<S-l> :<cmd>bnext<cr> {:desc "Next Buffer"})

(map :n "[b" :<cmd>bprevious<cr> {:desc "Prev Buffer"})

(map :n "]b" :<cmd>bnext<cr> {:desc "Next Buffer"})

(map :n :<leader>bb "<cmd>e #<cr>" {:desc "Switch to Other Buffer"})

(map :n :<leader><tab> "<cmd>e #<cr>" {:desc "Switch to Other Buffer"})

(map :n :<leader>byp
     (fn []
       (let [current-file (vim.fn.expand "%:p")
             relative-path (vim.fn.fnamemodify current-file ":.")]
         (vim.fn.setreg "+" relative-path)
         (vim.api.nvim_out_write (.. "Relative path copied to clipboard: "
                                     relative-path "\n"))))
     {:desc "Copy path"})

(map :n :<leader>byP
     (fn []
       (let [current-file (vim.fn.expand "%:p")]
         (vim.fn.setreg "+" current-file)
         (vim.api.nvim_out_write (.. "Relative path copied to clipboard: "
                                     current-file "\n"))))
     {:desc "Relative path"})

(map :n :<leader>byf
     (fn []
       (let [current-file (vim.fn.expand "%:p")
             file-name (vim.fn.fnamemodify current-file ":t")]
         (vim.fn.setreg "+" file-name)
         (vim.api.nvim_out_write (.. "File name copied to clipboard: "
                                     file-name "\n"))))
     {:desc "Copy full path"})

(map :n :<leader>la :<cmd>Lazy<cr> {:desc :Lazy})

(map :n :<leader>ww :<C-W>p {:desc "Other Window" :remap true})

(map :n :<leader>wd :<C-W>c {:desc "Delete Window" :remap true})

(map :n :<leader>wm (fn [] (vim.cmd.only))
     {:desc "Maximize Window" :remap true})

(map :n :<leader>w- :<C-W>s {:desc "Split Window Below" :remap true})

(map :n :<leader>w| :<C-W>v {:desc "Split Window Right" :remap true})

(map :n :<leader>- :<C-W>s {:desc "Split Window Below" :remap true})

(map :n :<leader>| :<C-W>v {:desc "Split Window Right" :remap true})

(map :n :<C-h> :<C-w>h {:desc "Go to Left Window" :remap true})

(map :n :<C-j> :<C-w>j {:desc "Go to Lower Window" :remap true})

(map :n :<C-k> :<C-w>k {:desc "Go to Upper Window" :remap true})

(map :n :<C-l> :<C-w>l {:desc "Go to Right Window" :remap true})

(map :n :<C-Up> "<cmd>resize +2<cr>" {:desc "Increase Window Height"})

(map :n :<C-Down> "<cmd>resize -2<cr>" {:desc "Decrease Window Height"})

(map :n :<C-Left> "<cmd>vertical resize -2<cr>" {:desc "Decrease Window Width"})

(map :n :<C-Right> "<cmd>vertical resize +2<cr>"
     {:desc "Increase Window Width"})

(map :n :<leader>uw "<cmd>set wrap!<cr>" {:desc "Toggle Word Wrap"})

