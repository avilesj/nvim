-- [nfnl] Compiled from fnl/aviles/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local function _2_(event)
    local function map(keys, func, desc)
      return vim.keymap.set("n", keys, func, {buffer = event.buf, desc = ("LSP: " .. desc)})
    end
    map("gd", (require("telescope.builtin")).lsp_definitions, "[G]oto [D]efinition")
    map("gr", (require("telescope.builtin")).lsp_references, "[G]oto [R]eferences")
    map("gI", (require("telescope.builtin")).lsp_implementations, "[G]oto [I]mplementation")
    map("<leader>D", (require("telescope.builtin")).lsp_type_definitions, "Type [D]efinition")
    map("<leader>ds", (require("telescope.builtin")).lsp_document_symbols, "[D]ocument [S]ymbols")
    map("<leader>ws", (require("telescope.builtin")).lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    map("K", vim.lsp.buf.hover, "Hover Documentation")
    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if (client and client.server_capabilities.documentHighlightProvider) then
      vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {buffer = event.buf, callback = vim.lsp.buf.document_highlight})
      vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {buffer = event.buf, callback = vim.lsp.buf.clear_references})
    else
    end
    if ((client and client.server_capabilities.inlayHintProvider) and vim.lsp.inlay_hint) then
      local function _4_()
        return vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
      end
      return map("<leader>th", _4_, "[T]oggle Inlay [H]ints")
    else
      return nil
    end
  end
  vim.api.nvim_create_autocmd("LspAttach", {callback = _2_, group = vim.api.nvim_create_augroup("kickstart-lsp-attach", {clear = true})})
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend("force", capabilities, (require("cmp_nvim_lsp")).default_capabilities())
  local servers
  local function _6_()
    return vim.lsp.buf.code_action({apply = true, context = {diagnostics = {}, only = {"source.organizeImports.ts"}}})
  end
  local function _7_()
    return vim.lsp.buf.code_action({apply = true, context = {diagnostics = {}, only = {"source.removeUnused.ts"}}})
  end
  local function _8_(filename)
    local util = require("lspconfig.util")
    return (util.find_package_json_ancestor(filename) or util.find_git_ancestor())
  end
  servers = {fennel_ls = {filetypes = {"fennel"}, settings = {["fennel-ls"] = {["extra-globals"] = "vim"}}}, gopls = {}, html = {}, htmx = {}, lua_ls = {settings = {Lua = {completion = {callSnippet = "Replace"}}}}, tailwindcss = {}, templ = {}, tsserver = {keys = {{"<leader>co", _6_, desc = "Organize Imports"}, {"<leader>cR", _7_, desc = "Remove Unused Imports"}}, root_dir = _8_, settings = {completions = {completeFunctionCalls = true}}}}
  do end (require("mason")).setup()
  local ensure_installed = vim.tbl_keys((servers or {}))
  vim.list_extend(ensure_installed, {"stylua"})
  do end (require("mason-tool-installer")).setup({ensure_installed = ensure_installed})
  local function _9_(server_name)
    local server = (servers[server_name] or {})
    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, (server.capabilities or {}))
    return (require("lspconfig"))[server_name].setup(server)
  end
  return (require("mason-lspconfig")).setup({handlers = {_9_}})
end
return {{"neovim/nvim-lspconfig", config = _1_, dependencies = {{"williamboman/mason.nvim", config = true}, "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim", {"j-hui/fidget.nvim", opts = {}}, {"folke/neodev.nvim", opts = {}}}}}
