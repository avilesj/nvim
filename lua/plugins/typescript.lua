-- [nfnl] Compiled from fnl/plugins/typescript.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local dap = require("dap")
  for _, language in ipairs({"typescript", "javascript"}) do
    local function _2_()
      return require("dap.utils").pick_process({filter = "--inspect"})
    end
    dap.configurations[language] = {{cwd = "${workspaceFolder}", name = "Auto attach to NodeJS process", processId = _2_, request = "attach", type = "pwa-node"}, {cwd = "${workspaceFolder}", name = "Attach to NodeJS process", processId = require("dap.utils").pick_process, request = "attach", type = "pwa-node"}, {cwd = "${workspaceFolder}", name = "Launch file", program = "${file}", request = "launch", type = "pwa-node"}}
  end
  return nil
end
return {{"neovim/nvim-lspconfig", opts = {servers = {tsserver = {root_dir = require("lspconfig.util").root_pattern("package.json"), single_file_support = false}}}}, {"mfussenegger/nvim-dap", opts = _1_}}
