;; PURPOSE: GH Copilot completion -- integrates with blink-cmp
{1 "zbirenbaum/copilot.lua"
 :cmd "Copilot"
 :config (fn []
           ((. (require :copilot) :setup) {:suggestion {:enabled false}
                                           :panel {:enabled false}}))}
