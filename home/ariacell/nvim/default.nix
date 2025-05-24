{ config, pkgs, ... }:
{
    programs.neovim = {
    enable = true;
    defaultEditor = true;

	viAlias = true;
	vimAlias = true;
	vimdiffAlias = true;

    extraPackages = with pkgs; [ tree-sitter gcc ];

    withNodeJs = true; # Required for nvim-treesitter parser installation
  };

  xdg.configFile."nvim/init.lua".source = ./init.lua;
  xdg.configFile."nvim/lua/config/options.lua".source = ./lua/config/options.lua;
  xdg.configFile."nvim/lua/plugins.lua".source = ./lua/plugins.lua;
  xdg.configFile."nvim/lua/config/treesitter.lua".source = ./lua/config/treesitter.lua;
  xdg.configFile."nvim/lua/config/telescope.lua".source = ./lua/config/telescope.lua; 
}
