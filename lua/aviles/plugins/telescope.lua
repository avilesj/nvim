-- [nfnl] Compiled from fnl/aviles/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  do end (require("telescope")).setup({extensions = {["ui-select"] = {(require("telescope.themes")).get_dropdown()}}})
  pcall((require("telescope")).load_extension, "fzf")
  pcall((require("telescope")).load_extension, "ui-select")
  local builtin = require("telescope.builtin")
  vim.keymap.set("n", "<leader>sh", builtin.help_tags, {desc = "[S]earch [H]elp"})
  vim.keymap.set("n", "<leader>sk", builtin.keymaps, {desc = "[S]earch [K]eymaps"})
  vim.keymap.set("n", "<leader>sf", builtin.find_files, {desc = "[S]earch [F]iles"})
  vim.keymap.set("n", "<leader>ss", builtin.builtin, {desc = "[S]earch [S]elect Telescope"})
  vim.keymap.set("n", "<leader>sw", builtin.grep_string, {desc = "[S]earch current [W]ord"})
  vim.keymap.set("n", "<leader>s/", builtin.live_grep, {desc = "[S]earch by [/]Grep"})
  vim.keymap.set("n", "<leader>/", builtin.live_grep, {desc = "Search by [/]Grep"})
  vim.keymap.set("n", "<leader>sd", builtin.diagnostics, {desc = "[S]earch [D]iagnostics"})
  vim.keymap.set("n", "<leader>sr", builtin.resume, {desc = "[S]earch [R]esume"})
  vim.keymap.set("n", "<leader>s.", builtin.oldfiles, {desc = "[S]earch Recent Files (\".\" for repeat)"})
  vim.keymap.set("n", "<leader>,", builtin.buffers, {desc = "[,] Find existing buffers"})
  local function _2_()
    local status = pcall(builtin.git_files)
    if not status then
      return builtin.find_files()
    else
      return nil
    end
  end
  vim.keymap.set("n", "<leader><leader>", _2_, {desc = "[ ] Find git files"})
  local function _4_()
    return builtin.current_buffer_fuzzy_find()
  end
  vim.keymap.set("n", "<leader>sb", _4_, {desc = "Fuzzily [s]earch in current [b]uffer"})
  local function _5_()
    return builtin.live_grep({grep_open_files = true, prompt_title = "Live Grep in Open Files"})
  end
  vim.keymap.set("n", "<leader>s/", _5_, {desc = "[S]earch [/] in Open Files"})
  local function _6_()
    return builtin.find_files({cwd = vim.fn.stdpath("config")})
  end
  return vim.keymap.set("n", "<leader>sn", _6_, {desc = "[S]earch [N]eovim files"})
end
local function _7_()
  return (vim.fn.executable("make") == 1)
end
return {{"nvim-telescope/telescope.nvim", branch = "0.1.x", config = _1_, dependencies = {"nvim-lua/plenary.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = _7_}, {"nvim-telescope/telescope-ui-select.nvim"}, {"nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font}}, event = "VimEnter"}}
