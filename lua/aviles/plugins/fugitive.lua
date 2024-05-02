-- [nfnl] Compiled from fnl/aviles/plugins/fugitive.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.cmd.Git()
  return vim.cmd("only")
end
local function _2_()
  return vim.cmd.Git("pull")
end
local function _3_()
  return vim.cmd.Git("push")
end
local function _4_()
  return vim.cmd.Git("fetch")
end
local function _5_()
  return (require("telescope.builtin")).git_commits()
end
local function _6_()
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  do end (cursor_position)[2] = 0
  vim.api.nvim_win_set_cursor(0, cursor_position)
  local hash = vim.fn.expand("<cword>")
  return vim.cmd.Git(string.format("revert %s", hash))
end
local function _7_()
  return vim.cmd.Git("log --oneline --format=\"%h %s\"")
end
local function _8_()
  return vim.cmd.Git("log")
end
local function _9_()
  local query = vim.fn.input("Git grep search: ")
  return vim.cmd.Ggrep(query)
end
local function _10_()
  local branch_name = vim.fn.input("New branch name: ")
  if (string.len(branch_name) == 0) then
    vim.cmd.echo({args = {"Invalid branch name"}})
    return 
  else
  end
  return vim.cmd.Git({args = {("checkout -b " .. branch_name)}})
end
local function _12_()
  do end (require("telescope.builtin")).git_branches()
  return vim.cmd.Git()
end
local function _13_()
  return vim.cmd.Git("add .")
end
local function _14_()
  return vim.cmd.Git("blame")
end
local function _15_()
  local stash_message = vim.fn.input("Stash message: ")
  if (stash_message == "") then
    stash_message = "No message"
  else
  end
  return vim.cmd.Git(string.format("stash push -m \"%s\"", stash_message))
end
local function _17_()
  do end (require("telescope.builtin")).git_stash()
  return vim.cmd.Git()
end
return {{"tpope/vim-fugitive", keys = {{"<leader>gg", _1_, desc = "Git"}, {"<leader>gp", _2_, desc = "pull"}, {"<leader>gP", _3_, desc = "Push"}, {"<leader>gf", _4_, desc = "Fetch"}, {"<leader>gcc", _5_, desc = "Checkout at commit"}, {"<leader>gcr", _6_, desc = "Revert commit"}, {"<leader>gll", _7_, desc = "Log"}, {"<leader>gld", _8_, desc = "Log - default"}, {"<leader>gls", _9_, desc = "Search"}, {"<leader>gbn", _10_, desc = "New branch"}, {"<leader>gbc", _12_, desc = "Checkout"}, {"<leader>gaa", _13_, desc = "Add all"}, {"<leader>gB", _14_, desc = "Blame"}, {"<leader>gsP", _15_, desc = "Stash push"}, {"<leader>gsp", _17_, desc = "Stash pop"}}, name = "fugitive"}}
