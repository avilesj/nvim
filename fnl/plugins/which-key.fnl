;; PURPOSE: Previews keybinds
{1 :folke/which-key.nvim
 :event :VimEnter
 :opts {:delay 0
        :icons {:keys (or (and vim.g.have_nerd_font {})
                          {:BS "<BS> "
                           :C "<C-…> "
                           :CR "<CR> "
                           :D "<D-…> "
                           :Down "<Down> "
                           :Esc "<Esc> "
                           :F1 :<F1>
                           :F10 :<F10>
                           :F11 :<F11>
                           :F12 :<F12>
                           :F2 :<F2>
                           :F3 :<F3>
                           :F4 :<F4>
                           :F5 :<F5>
                           :F6 :<F6>
                           :F7 :<F7>
                           :F8 :<F8>
                           :F9 :<F9>
                           :Left "<Left> "
                           :M "<M-…> "
                           :NL "<NL> "
                           :Right "<Right> "
                           :S "<S-…> "
                           :ScrollWheelDown "<ScrollWheelDown> "
                           :ScrollWheelUp "<ScrollWheelUp> "
                           :Space "<Space> "
                           :Tab "<Tab> "
                           :Up "<Up> "})
                :mappings vim.g.have_nerd_font}
        :spec [{1 :<leader>s :group "Search"}
               {1 :<leader>u :group "UI"}
               {1 :<leader>b :group "Buffer"}
               {1 :<leader>w :group "Window"}
               {1 :<leader>c :group "Code"}
               {1 :<leader>t :group "Tree explorer"}]}}
