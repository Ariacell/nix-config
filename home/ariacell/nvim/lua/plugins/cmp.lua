local cmp = require("cmp")

cmp.setup({
  sources = cmp.config.sources({
    { name = "cmp_ai" },
    { name = "nvim_lsp" },
    { name = "buffer" },
  }),
})
