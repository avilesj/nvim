(local core {})

(fn core.filter [list value]
  ;; Returns a list without the 'value' element
  (icollect [_ v (ipairs list)]
    (if (not= v value) v)))

(fn core.require-list [modules prefix]
  ;; Requires a list of modules
  ;; Optionally pass a prefix that will be applied to each module
  (each [_ v (ipairs modules)]
    (if (not= nil prefix)
        (require (.. prefix v))
        (require v))))

core
