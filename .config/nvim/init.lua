require("catppuccin").setup {
  default_integrations = false,
  flavour = "mocha",
  integrations = {
    treesitter = true,
    mini = {
      enabled = true,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
  },
}
require("mini.completion").setup()
require("mini.icons").setup()
require("mini.statusline").setup()
require("nvim-treesitter.configs").setup {
  auto_install = false,
  sync_install = false,
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",

    "bash",
    "css",
    "dart",
    "html",
    "javascript",
    "json",
    "python",
    "toml",
    "yaml",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- vim.lsp.enable("dartls")

vim.cmd.colorscheme "catppuccin"

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
