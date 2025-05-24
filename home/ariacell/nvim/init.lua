require("config.options")
require("plugins")

require 'lspconfig'.pyright.setup {}
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.clangd.setup({
  -- cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
  -- init_options = {
  --   fallbackFlags = { '-std=c++17' },
  -- },
  root_dir = function(fname)
					return require("lspconfig.util").root_pattern(
						"Makefile",
						"configure.ac",
						"configure.in",
						"config.h.in",
						"build.ninja"
					)(fname) or require("lspconfig.util").root_pattern(
						"compile_commands.json",
						"compile_flags.txt"
					)(fname) or require("lspconfig.util").find_git_ancestor(fname)
				end,
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--function-arg-placeholders",
					"--fallback-style=llvm",
					"--header-insertion=iwyu",
					-- "--query-driver=/usr/lib/llvm-13/bin/clang++-15",
					"--all-scopes-completion",
					"--completion-style=detailed",
				},
				init_options = {
					usePlaceholders = true,
					completeUnimported = true,
					clangdFileStatus = true,
				},
})

