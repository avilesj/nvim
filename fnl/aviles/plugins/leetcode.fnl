{1 :kawre/leetcode.nvim
 :build ":TSUpdate html"
 :cmd :Leet
 :dependencies [:nvim-telescope/telescope.nvim
                :nvim-lua/plenary.nvim
                :MunifTanjim/nui.nvim
                :nvim-treesitter/nvim-treesitter
                :rcarriga/nvim-notify
                :nvim-tree/nvim-web-devicons]
 :keys [{1 :<leader>lcl 2 (fn [] (vim.cmd :Leet)) :desc "Launch Leet"}
        {1 :<leader>lct 2 (fn [] (vim.cmd "Leet test")) :desc "Run test"}
        {1 :<leader>lcm 2 (fn [] (vim.cmd "Leet menu")) :desc :Menu}
        {1 :<leader>lcr 2 (fn [] (vim.cmd "Leet reset")) :desc :Reset}
        {1 :<leader>lcs 2 (fn [] (vim.cmd "Leet submit")) :desc :Submit}]
 :lazy true
 :opts {:hooks {:enter [(fn [] (vim.cmd "Copilot disable"))]}
        :injector {:golang {:before "package main"}}
        :lang :golang}}

