;; PURPOSE: Auto closes markup tags. Specially HTML, JSX and HEEX
{1 :windwp/nvim-ts-autotag
 :opts (fn [_ _]
         ((. (require "nvim-ts-autotag") :setup) {:opts {:enable_close true
                                                         :enable_rename true
                                                         :enable_close_on_slash false}}))}
