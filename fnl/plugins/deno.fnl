[
 {1 :neovim/nvim-lspconfig
 :opts {:servers {:denols {:setup {:settings {:deno {:enable true
 :suggest {:autoImports true
 :completeFunctionCalls true
 :imports {:autoDiscover true
 :hosts {"https://crux.land" true
 "https://deno.land" true
 "https://x.nest.land" true}}
 :names true
 :paths true}}
 :root_dir ((. (require :lspconfig.util)
               :root_pattern) :deno.json
            :deno.jsonc)}}}}}}]

