{ config, pkgs, ... }:
{



    programs.neovim = {
    enable = true;
    defaultEditor = true;

	viAlias = true;
	vimAlias = true;
	vimdiffAlias = true;

    withNodeJs = true; # Required for nvim-treesitter parser installation
  

  extraPackages = with pkgs; [

      # Pull in additional system packages that we want for nvim QoL
      fd # usually installed by my personal user home if using home manager, but just in case
      ripgrep
      tree-sitter

      # Language server packages (executables)
      pyright
      lua-language-server
      
      # Deliberately not installing any c compilers in the home setup, prioritising shells
      # clang
      # gcc
    ];


  };

  xdg.configFile."nvim/init.lua".source = ./init.lua;
  xdg.configFile."nvim/lua/plugins.lua".source = ./lua/plugins.lua;
  xdg.configFile."nvim/lua/plugins/ai.lua".source = ./lua/plugins/ai.lua;
  xdg.configFile."nvim/lua/plugins/cmp.lua".source = ./lua/plugins/cmp.lua;
  xdg.configFile."nvim/lua/lspsettings.lua".source = ./lua/lspsettings.lua;
  xdg.configFile."nvim/lua/config/options.lua".source = ./lua/config/options.lua;
  xdg.configFile."nvim/lua/config/treesitter.lua".source = ./lua/config/treesitter.lua;
  xdg.configFile."nvim/lua/config/telescope.lua".source = ./lua/config/telescope.lua; 
  xdg.configFile."nvim/lua/config/keymaps.lua".source = ./lua/config/keymaps.lua; 

}
