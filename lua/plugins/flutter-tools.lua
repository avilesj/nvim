-- [nfnl] Compiled from fnl/plugins/flutter-tools.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local wk = require("which-key")
  local map = vim.keymap.set
  map("n", "<localleader>r", "<cmd>FlutterRun<cr>", {desc = "Flutter Run"})
  map("n", "<localleader>R", "<cmd>FlutterRestart<cr>", {desc = "Flutter Restart"})
  map("n", "<localleader>q", "<cmd>FlutterQuit<cr>", {desc = "Flutter Quit"})
  map("n", "<localleader>d", "<cmd>FlutterDevices<cr>", {desc = "Flutter Devices"})
  map("n", "<localleader>e", "<cmd>FlutterEmulators<cr>", {desc = "Flutter Emulators"})
  map("n", "<localleader>o", "<cmd>FlutterOutlineToggle<cr>", {desc = "Flutter Outline Toggle"})
  map("n", "<localleader>t", "<cmd>FlutterDevTools<cr>", {desc = "Flutter DevTools"})
  map("n", "<localleader>a", "<cmd>FlutterLspReferences<cr>", {desc = "Flutter LSP References"})
  map("n", "<localleader>s", "<cmd>FlutterSuper<cr>", {desc = "Go to Super"})
  map("n", "<localleader>T", "<cmd>FlutterTest<cr>", {desc = "Run Flutter Tests"})
  map("n", "<localleader>w", "<cmd>FlutterTestWatch<cr>", {desc = "Watch Flutter Tests"})
  map("n", "<localleader>p", "<cmd>FlutterPubGet<cr>", {desc = "Flutter Pub Get"})
  map("n", "<localleader>u", "<cmd>FlutterPubUpgrade<cr>", {desc = "Flutter Pub Upgrade"})
  return wk.add("f", {name = "Flutter", r = {"<cmd>FlutterRun<cr>", "Run"}, R = {"<cmd>FlutterRestart<cr>", "Restart"}, q = {"<cmd>FlutterQuit<cr>", "Quit"}, d = {"<cmd>FlutterDevices<cr>", "Devices"}, e = {"<cmd>FlutterEmulators<cr>", "Emulators"}, o = {"<cmd>FlutterOutlineToggle<cr>", "Outline"}, t = {"<cmd>FlutterDevTools<cr>", "DevTools"}, a = {"<cmd>FlutterLspReferences<cr>", "References"}, s = {"<cmd>FlutterSuper<cr>", "Super"}, T = {"<cmd>FlutterTest<cr>", "Test"}, w = {"<cmd>FlutterTestWatch<cr>", "Test Watch"}, p = {"<cmd>FlutterPubGet<cr>", "Pub Get"}, u = {"<cmd>FlutterPubUpgrade<cr>", "Pub Upgrade"}}, {prefix = "<localleader>"})
end
return {"akinsho/flutter-tools.nvim", dependencies = {"nvim-lua/plenary.nvim", "stevearc/dressing.nvim"}, opts = {flutter_lookup_cmd = "mise where flutter"}, init = _1_, lazy = false}
