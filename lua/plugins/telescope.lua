-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  require("telescope").setup({extensions = {["ui-select"] = {require("telescope.themes").get_dropdown()}}})
  pcall(require("telescope").load_extension, "fzf")
  pcall(require("telescope").load_extension, "ui-select")
  local builtin = require("telescope.builtin")
  vim.keymap.set("n", "<leader>sh", builtin.help_tags, {desc = "Search Help"})
  vim.keymap.set("n", "<leader>sk", builtin.keymaps, {desc = "Search Keymaps"})
  vim.keymap.set("n", "<leader><leader>", builtin.find_files, {desc = "Search Files"})
  vim.keymap.set("n", "<leader>ss", builtin.builtin, {desc = "Search Select Telescope"})
  vim.keymap.set("n", "<leader>cs", builtin.lsp_document_symbols, {desc = "Search Select Telescope"})
  vim.keymap.set("n", "<leader>sw", builtin.grep_string, {desc = "Search current Word"})
  vim.keymap.set("n", "<leader>/", builtin.live_grep, {desc = "Search by grep"})
  vim.keymap.set("n", "<leader>sd", builtin.diagnostics, {desc = "Search Diagnostics"})
  vim.keymap.set("n", "<leader>sr", builtin.resume, {desc = "Search Resume"})
  vim.keymap.set("n", "<leader>s.", builtin.oldfiles, {desc = "Search Recent Files (\".\" for repeat)"})
  vim.keymap.set("n", "<leader>,", builtin.buffers, {desc = "Find existing buffers"})
  vim.keymap.set("n", "gr", builtin.lsp_references, {desc = "LSP References"})
  vim.keymap.set("n", "gd", builtin.lsp_definitions, {desc = "LSP Definitions"})
  local function _2_()
    return builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({previewer = true, layout_strategy = "horizontal", layout_config = {width = 0.9, height = 0.9}, winblend = 10}))
  end
  vim.keymap.set("n", "<leader>sb", _2_, {desc = "Fuzzily search in current buffer"})
  local function _3_()
    return builtin.live_grep({grep_open_files = true, prompt_title = "Live Grep in Open Files"})
  end
  vim.keymap.set("n", "<leader>s/", _3_, {desc = "[S]earch [/] in Open Files"})
  local function _4_()
    return builtin.find_files({cwd = vim.fn.stdpath("config")})
  end
  return vim.keymap.set("n", "<leader>sn", _4_, {desc = "[S]earch [N]eovim files"})
end
local function _5_()
  return (vim.fn.executable("make") == 1)
end
return {"nvim-telescope/telescope.nvim", config = _1_, dependencies = {"nvim-lua/plenary.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = _5_}, {"nvim-telescope/telescope-ui-select.nvim"}, {"nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font}}, event = "VimEnter"}
