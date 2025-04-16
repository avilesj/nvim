-- [nfnl] Compiled from fnl/config.fnl by https://github.com/Olical/nfnl, do not edit.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = false
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.showmode = false
local function _1_()
  vim.opt.clipboard = "unnamedplus"
  return nil
end
vim.schedule(_1_)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = {nbsp = "\226\144\163", tab = "\194\187 ", trail = "\194\183"}
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {desc = "Open diagnostic [Q]uickfix list"})
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {desc = "Exit terminal mode"})
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", {desc = "Move focus to the left window"})
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", {desc = "Move focus to the right window"})
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", {desc = "Move focus to the lower window"})
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", {desc = "Move focus to the upper window"})
local function _2_()
  return vim.highlight.on_yank()
end
vim.api.nvim_create_autocmd("TextYankPost", {callback = _2_, desc = "Highlight when yanking (copying) text", group = vim.api.nvim_create_augroup("kickstart-highlight-yank", {clear = true})})
local lazypath = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
  if (vim.v.shell_error ~= 0) then
    error(("Error cloning lazy.nvim:\n" .. out))
  else
  end
else
end
vim.opt.rtp:prepend(lazypath)
local function _5_()
  local lint = require("lint")
  lint.linters_by_ft = {fennel = {"fennel"}, markdown = {"markdownlint"}}
  local lint_augroup = vim.api.nvim_create_augroup("lint", {clear = true})
  local function _6_()
    if vim.opt_local.modifiable:get() then
      return lint.try_lint()
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "InsertLeave"}, {callback = _6_, group = lint_augroup})
end
local function _8_()
  require("telescope").setup({extensions = {["ui-select"] = {require("telescope.themes").get_dropdown()}}})
  pcall(require("telescope").load_extension, "fzf")
  pcall(require("telescope").load_extension, "ui-select")
  local builtin = require("telescope.builtin")
  vim.keymap.set("n", "<leader>sh", builtin.help_tags, {desc = "[S]earch [H]elp"})
  vim.keymap.set("n", "<leader>sk", builtin.keymaps, {desc = "[S]earch [K]eymaps"})
  vim.keymap.set("n", "<leader>sf", builtin.find_files, {desc = "[S]earch [F]iles"})
  vim.keymap.set("n", "<leader>ss", builtin.builtin, {desc = "[S]earch [S]elect Telescope"})
  vim.keymap.set("n", "<leader>sw", builtin.grep_string, {desc = "[S]earch current [W]ord"})
  vim.keymap.set("n", "<leader>sg", builtin.live_grep, {desc = "[S]earch by [G]rep"})
  vim.keymap.set("n", "<leader>sd", builtin.diagnostics, {desc = "[S]earch [D]iagnostics"})
  vim.keymap.set("n", "<leader>sr", builtin.resume, {desc = "[S]earch [R]esume"})
  vim.keymap.set("n", "<leader>s.", builtin.oldfiles, {desc = "[S]earch Recent Files (\".\" for repeat)"})
  vim.keymap.set("n", "<leader><leader>", builtin.buffers, {desc = "[ ] Find existing buffers"})
  local function _9_()
    return builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({winblend = 10, previewer = false}))
  end
  vim.keymap.set("n", "<leader>/", _9_, {desc = "[/] Fuzzily search in current buffer"})
  local function _10_()
    return builtin.live_grep({grep_open_files = true, prompt_title = "Live Grep in Open Files"})
  end
  vim.keymap.set("n", "<leader>s/", _10_, {desc = "[S]earch [/] in Open Files"})
  local function _11_()
    return builtin.find_files({cwd = vim.fn.stdpath("config")})
  end
  return vim.keymap.set("n", "<leader>sn", _11_, {desc = "[S]earch [N]eovim files"})
end
local function _12_()
  return (vim.fn.executable("make") == 1)
end
local function _13_()
  return require("conform").format({async = true, lsp_format = "fallback"})
end
local function _14_(bufnr)
  local disable_filetypes = {c = true, cpp = true}
  if disable_filetypes[vim.bo[bufnr].filetype] then
    return nil
  else
    return {lsp_format = "fallback", timeout_ms = 500}
  end
end
local function _16_()
  if ((vim.fn.has("win32") == 1) or (vim.fn.executable("make") == 0)) then
    return 
  else
  end
  return "make install_jsregexp"
end
local function _18_()
  require("tokyonight").setup({styles = {comments = {italic = false}}})
  return vim.cmd.colorscheme("tokyonight-night")
end
local function _19_()
  require("mini.ai").setup({n_lines = 500})
  require("mini.surround").setup()
  local statusline = require("mini.statusline")
  statusline.setup({use_icons = vim.g.have_nerd_font})
  statusline.section_location = function()
    return "%2l:%-2v"
  end
  return statusline.section_location
end
require("lazy").setup({"tpope/vim-sleuth", {"lewis6991/gitsigns.nvim", opts = {signs = {add = {text = "+"}, change = {text = "~"}, changedelete = {text = "~"}, delete = {text = "_"}, topdelete = {text = "\226\128\190"}}}}, {"mfussenegger/nvim-lint", config = _5_, event = {"BufReadPre", "BufNewFile"}}, {"folke/which-key.nvim", event = "VimEnter", opts = {delay = 0, icons = {keys = ((vim.g.have_nerd_font and {}) or {BS = "<BS> ", C = "<C-\226\128\166> ", CR = "<CR> ", D = "<D-\226\128\166> ", Down = "<Down> ", Esc = "<Esc> ", F1 = "<F1>", F10 = "<F10>", F11 = "<F11>", F12 = "<F12>", F2 = "<F2>", F3 = "<F3>", F4 = "<F4>", F5 = "<F5>", F6 = "<F6>", F7 = "<F7>", F8 = "<F8>", F9 = "<F9>", Left = "<Left> ", M = "<M-\226\128\166> ", NL = "<NL> ", Right = "<Right> ", S = "<S-\226\128\166> ", ScrollWheelDown = "<ScrollWheelDown> ", ScrollWheelUp = "<ScrollWheelUp> ", Space = "<Space> ", Tab = "<Tab> ", Up = "<Up> "}), mappings = vim.g.have_nerd_font}, spec = {{"<leader>s", group = "[S]earch"}, {"<leader>t", group = "[T]oggle"}, {"<leader>h", group = "Git [H]unk", mode = {"n", "v"}}}}}, {"nvim-telescope/telescope.nvim", config = _8_, dependencies = {"nvim-lua/plenary.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = _12_}, {"nvim-telescope/telescope-ui-select.nvim"}, {"nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font}}, event = "VimEnter"}, {"Olical/nfnl", ft = "fennel", version = "1.1.0"}, {"folke/lazydev.nvim", ft = "lua", opts = {library = {{path = "${3rd}/luv/library", words = {"vim%.uv"}}}}}, {"stevearc/conform.nvim", cmd = {"ConformInfo"}, event = {"BufWritePre"}, keys = {{"<leader>f", _13_, desc = "[F]ormat buffer", mode = ""}}, opts = {format_on_save = _14_, formatters_by_ft = {lua = {"stylua"}, fennel = {"fnlfmt"}}, notify_on_error = false}}, {"saghen/blink.cmp", dependencies = {{"L3MON4D3/LuaSnip", build = _16_(), dependencies = {}, opts = {}, version = "2.*"}, "folke/lazydev.nvim"}, event = "VimEnter", opts = {appearance = {nerd_font_variant = "mono"}, completion = {documentation = {auto_show_delay_ms = 500, auto_show = false}}, fuzzy = {implementation = "lua"}, keymap = {preset = "default"}, signature = {enabled = true}, snippets = {preset = "luasnip"}, sources = {default = {"lsp", "path", "snippets", "lazydev"}, providers = {lazydev = {module = "lazydev.integrations.blink", score_offset = 100}}}}, version = "1.*"}, {"folke/tokyonight.nvim", config = _18_, priority = 1000}, {"folke/todo-comments.nvim", dependencies = {"nvim-lua/plenary.nvim"}, event = "VimEnter", opts = {signs = false}}, {"echasnovski/mini.nvim", config = _19_}, {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", main = "nvim-treesitter.configs", opts = {auto_install = true, ensure_installed = {"bash", "c", "diff", "html", "lua", "luadoc", "markdown", "markdown_inline", "query", "vim", "vimdoc"}, highlight = {additional_vim_regex_highlighting = {"ruby"}, enable = true}, indent = {disable = {"ruby"}, enable = true}}}}, {ui = {icons = ((vim.g.have_nerd_font and {}) or {cmd = "\226\140\152", config = "\240\159\155\160", event = "\240\159\147\133", ft = "\240\159\147\130", init = "\226\154\153", keys = "\240\159\151\157", lazy = "\240\159\146\164 ", plugin = "\240\159\148\140", require = "\240\159\140\153", runtime = "\240\159\146\187", source = "\240\159\147\132", start = "\240\159\154\128", task = "\240\159\147\140"})}})
local function load_langs(languages)
  for k, v in ipairs(languages) do
    require(("lang" .. "." .. v))
  end
  return nil
end
return load_langs({"fennel"})
