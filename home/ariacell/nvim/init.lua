require("config.options")
require("plugins")

local lspconfig = require("lspconfig")

lspconfig.pyright.setup {}
lspconfig.lua_ls.setup{}
lspconfig.clangd.setup({
   cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
   -- cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose', "-compile-commands-dir=build"},
   init_options = {
     fallbackFlags = { '-std=c++17' },
   },
  -- root_dir = function(fname)
	--				return require("lspconfig.util").root_pattern(
	--					"Makefile",
	--					"configure.ac",
	--					"configure.in",
	--					"config.h.in",
	--					"build.ninja"
	--				)(fname) or require("lspconfig.util").root_pattern(
	--					"compile_commands.json",
	--					"compile_flags.txt"
	--				)(fname) or require("lspconfig.util").find_git_ancestor(fname)
	--			end,
	--			cmd = {
	--				"clangd",
	--				"--background-index",
	--				"--clang-tidy",
	--				"--function-arg-placeholders",
	--				"--fallback-style=llvm",
   --       "--compile-commands-dir=.",
		--			"--header-insertion=iwyu",
		--			-- "--query-driver=/usr/lib/llvm-13/bin/clang++-15",
		--			"--all-scopes-completion",
		--			"--completion-style=detailed",
		--		},
		--		init_options = {
		--			usePlaceholders = true,
		--			completeUnimported = true,
		--			clangdFileStatus = true,
		--		},
})

-- still not sure how to get this to work, tried to follow advice here: https://discourse.nixos.org/t/clang-clang-and-clangd-cant-find-headers-even-with-compile-commands-json/54657/9
lspconfig.opts = {
  opts = {
    servers = {
      clangd = {
        mason = false,
      },
    },
  },
}


