(set vim.g.have_nerd_font true)

(set vim.opt.number true)

(set vim.opt.relativenumber true)

(set vim.opt.mouse :a)

(set vim.opt.showmode false)

(set vim.opt.clipboard :unnamedplus)

(set vim.opt.breakindent true)

(set vim.opt.undofile true)

(set vim.opt.ignorecase true)

(set vim.opt.smartcase true)

(set vim.opt.signcolumn :yes)

(set vim.opt.updatetime 250)

(set vim.opt.timeoutlen 300)

(set vim.opt.splitright true)

(set vim.opt.splitbelow true)

(set vim.opt.list true)

(set vim.opt.listchars {:nbsp "␣" :tab "» " :trail "·"})

(set vim.opt.inccommand :split)

(set vim.opt.cursorline true)

(set vim.opt.scrolloff 10)

(vim.filetype.add {:extension {:templ :templ}})

(local theme :kanagawa-dragon)

(vim.cmd (.. "colorscheme " theme))

