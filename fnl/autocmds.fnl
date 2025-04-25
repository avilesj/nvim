;; add something here :)

(vim.api.nvim_create_augroup "flutter" {})
(vim.api.nvim_create_autocmd ["BufEnter" "BufWinEnter"]
                             {:group "flutter"
                              :once true
                              :pattern ["*.dart"]
                              :callback (fn []
                                          (local wk (require :which-key))
                                          (let [map vim.keymap.set] ; Basic development commands
                                            (map :n :<localleader>r
                                                 :<cmd>FlutterRun<cr>
                                                 {:desc "Flutter Run"})
                                            (map :n :<localleader>R
                                                 :<cmd>FlutterRestart<cr>
                                                 {:desc "Flutter Restart"})
                                            (map :n :<localleader>q
                                                 :<cmd>FlutterQuit<cr>
                                                 {:desc "Flutter Quit"})
                                            ; (map :n :<localleader>r :<cmd>FlutterReload<cr> {:desc "Flutter Hot Reload"})
                                            ; Device management
                                            (map :n :<localleader>d
                                                 :<cmd>FlutterDevices<cr>
                                                 {:desc "Flutter Devices"})
                                            (map :n :<localleader>e
                                                 :<cmd>FlutterEmulators<cr>
                                                 {:desc "Flutter Emulators"})
                                            ; Development tools
                                            (map :n :<localleader>o
                                                 :<cmd>FlutterOutlineToggle<cr>
                                                 {:desc "Flutter Outline Toggle"})
                                            (map :n :<localleader>t
                                                 :<cmd>FlutterDevTools<cr>
                                                 {:desc "Flutter DevTools"})
                                            ; LSP-like features
                                            (map :n :<localleader>a
                                                 :<cmd>FlutterLspReferences<cr>
                                                 {:desc "Flutter LSP References"})
                                            (map :n :<localleader>s
                                                 :<cmd>FlutterSuper<cr>
                                                 {:desc "Go to Super"})
                                            ; Testing
                                            (map :n :<localleader>T
                                                 :<cmd>FlutterTest<cr>
                                                 {:desc "Run Flutter Tests"})
                                            (map :n :<localleader>w
                                                 :<cmd>FlutterTestWatch<cr>
                                                 {:desc "Watch Flutter Tests"})
                                            ; Pub commands
                                            (map :n :<localleader>p
                                                 :<cmd>FlutterPubGet<cr>
                                                 {:desc "Flutter Pub Get"})
                                            (map :n :<localleader>u
                                                 :<cmd>FlutterPubUpgrade<cr>
                                                 {:desc "Flutter Pub Upgrade"})
                                            ; Which-key registration
                                            (wk.add :f
                                                    {:name "Flutter"
                                                     :r ["<cmd>FlutterRun<cr>"
                                                         "Run"]
                                                     :R ["<cmd>FlutterRestart<cr>"
                                                         "Restart"]
                                                     :q ["<cmd>FlutterQuit<cr>"
                                                         "Quit"]
                                                     :d ["<cmd>FlutterDevices<cr>"
                                                         "Devices"]
                                                     :e ["<cmd>FlutterEmulators<cr>"
                                                         "Emulators"]
                                                     :o ["<cmd>FlutterOutlineToggle<cr>"
                                                         "Outline"]
                                                     :t ["<cmd>FlutterDevTools<cr>"
                                                         "DevTools"]
                                                     :a ["<cmd>FlutterLspReferences<cr>"
                                                         "References"]
                                                     :s ["<cmd>FlutterSuper<cr>"
                                                         "Super"]
                                                     :T ["<cmd>FlutterTest<cr>"
                                                         "Test"]
                                                     :w ["<cmd>FlutterTestWatch<cr>"
                                                         "Test Watch"]
                                                     :p ["<cmd>FlutterPubGet<cr>"
                                                         "Pub Get"]
                                                     :u ["<cmd>FlutterPubUpgrade<cr>"
                                                         "Pub Upgrade"]}
                                                    {:prefix :<localleader>})))})
