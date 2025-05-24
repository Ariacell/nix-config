{ config, pkgs, ... }:

{
  home.username = "ariacell";
  home.homeDirectory = "/home/ariacell";

  home.stateVersion = "24.11";

    programs = {
        # Enable Home Manager to manage your home directory.
    home-manager.enable = true;

    # direnv
    direnv.enable = true;

        git = {
      enable = true;
      userName = "ariacell";
      userEmail = "ariacell@protonmail.com";

      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    };



 programs.neovim = {
    enable = true;
    defaultEditor = true;

	viAlias = true;
	vimAlias = true;
	vimdiffAlias = true;

    extraPackages = with pkgs; [ tree-sitter gcc ];

    withNodeJs = true; # Required for nvim-treesitter parser installation
  };

  xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;
  xdg.configFile."nvim/lua/config/options.lua".source = ./nvim/lua/config/options.lua;
  xdg.configFile."nvim/lua/plugins.lua".source = ./nvim/lua/plugins.lua;
  xdg.configFile."nvim/lua/config/treesitter.lua".source = ./nvim/lua/config/treesitter.lua;
  xdg.configFile."nvim/lua/config/telescope.lua".source = ./nvim/lua/config/telescope.lua;

   programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      dotDir = ".config/zsh";

      shellAliases = {
        lg = "lazygit";
        v = "nvim";
        c = "clear";
        cat = "bat --theme='Catppuccin Mocha'";
        fk = "fuck";
        ls = "eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions";
        cd = "z";
        s = "web_search duckduckgo"; 
        };
      oh-my-zsh = {
        enable = true;
        extraConfig = builtins.readFile ./extraConfig.zsh;
        # Additional oh-my-zsh plugins
        plugins = ["git" "web-search" "copyfile" "copybuffer" "fzf" "thefuck" ];
      };
    plugins = [
        # powerlevel10k
        {
            name = "powerlevel10k";
            src = pkgs.zsh-powerlevel10k;
            file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        # Autocompletions
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.7.1";
            hash = "sha256-vpTyYq9ZgfgdDsWzjxVAE7FZH4MALMNZIFyEOBLm5Qo=";
          };
        }
        # Completion scroll
        {
          name = "zsh-completions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-completions";
            rev = "0.35.0";
            hash = "sha256-GFHlZjIHUWwyeVoCpszgn4AmLPSSE8UVNfRmisnhkpg=";
          };
        }
        # Highlight commands in terminal
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "0.8.0";
            hash = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
          };
        }
      ];
      initExtra = ''        ;
                [[ ! -f ~/.config/home-manager/.p10k.zsh ]] || source ~/.config/home-manager/.p10k.zsh
      '';
    };


  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "ls -alF";
      gst = "git status";
      gcm = "git commit -m";
  };

    interactiveShellInit = ''
      starship init fish | source
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = ''
        $directory$git_branch$git_status$cmd_duration$line_break$character
      '';
      character = {
        success_symbol = "[❯](bold cyan)";
        error_symbol = "[❯](bold red)";
      };
      git_branch = {
        style = "purple";
      };
      git_status = {
        style = "yellow";
      };
      cmd_duration = {
        min_time = 500;
        style = "bold green";
      };
    };
  };

  home.packages = with pkgs; [
    #cli tools
    git
    htop
    neofetch
    oh-my-zsh
    curl
    thefuck
    tldr
    zoxide # cd standin with some help
    fzf
    tmux
    eza # ls alternative

    # Nix formatting
    nixpkgs-fmt
    nixpkgs-review
   
    # devenv things
    devbox

    #python
    uv

    ];
}
