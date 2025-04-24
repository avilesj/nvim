{1 "zbirenbaum/copilot.lua"
 :cmd "Copilot"
 :config (fn []
           ((. (require :copilot) :setup) {:suggestion {:enabled false}
                                           :panel {:enabled false}}))}
