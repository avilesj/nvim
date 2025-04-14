{:fennel-path "./?.fnl;./?/init.fnl;src/?.fnl;src/?/init.fnl"
 :macro-path "./?.fnl;./?/init-macros.fnl;./?/init.fnl;src/?.fnl;src/?/init-macros.fnl;src/?/init.fnl"
 :lua-version "lua5.4"
 :libraries {:nvim true}
 :extra-globals ""
 :lints {:unused-definition true
         :unknown-module-field true
         :unnecessary-method true
         :unnecessary-tset true
         :unnecessary-do true
         :redundant-do true
         :match-should-case true
         :bad-unpack true
         :var-never-set true
         :op-with-no-arguments true
         :multival-in-middle-of-call true
         :no-decreasing-comparison false}
}
