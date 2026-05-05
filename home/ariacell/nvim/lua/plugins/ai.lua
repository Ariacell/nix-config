return {
  {
    "tzachar/cmp-ai",
    dependencies = "hrsh7th/nvim-cmp",
    config = function()
      require("cmp_ai.config").setup({
        max_lines = 1000,
        provider = "Ollama",
        provider_options = {
          model = "codellama:7b",
          prompt = function(prefix, suffix)
            return prefix .. "<FILL>" .. suffix
          end,
        },
        notify = true,
        notify_callback = function(msg)
          vim.notify(msg)
        end,
        run_on_every_keystroke = false,
      })
    end,
  },
}
