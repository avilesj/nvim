(local core {})

(fn core.filter [list value]
  ;; Returns a list without the 'value' element
  (icollect [_ v (ipairs list)]
    (if (not= v value) v)))

(fn core.te []
  (print "test"))

core
