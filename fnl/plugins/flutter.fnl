{1 :akinsho/flutter-tools.nvim
:lazy false
:dependencies [:nvim-lua/plenary.nvim
                :stevearc/dressing.nvim] ; optional for vim.ui.select
:opts {
; :flutter_path (.. (os.getenv "HOME") "/.asdf/shims/flutter")
:flutter_lookup_cmd "asdf where flutter"
}

}
