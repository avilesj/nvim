[{1 :zbirenbaum/copilot.lua
  :build ":Copilot auth"
  :cmd :Copilot
  :event :InsertEnter
  :opts {:filetypes {:help true :markdown true} :suggestion {:enabled false}}}
 {1 :zbirenbaum/copilot-cmp
  :config (fn []
            ((. (require :copilot_cmp) :setup)))
  :dependencies :copilot.lua}
 [:AndreM222/copilot-lualine]]

