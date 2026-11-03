require("catppuccin").setup {
  auto_integrations = true,
  flavour = "mocha",
}
require("mini.completion").setup()
require("mini.statusline").setup()

vim.cmd.colorscheme "catppuccin-nvim"

vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.wrap = false
