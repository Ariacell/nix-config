
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua", "nix", "bash", "json", "yaml", "python", "markdown"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
})
