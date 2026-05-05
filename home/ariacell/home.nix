{ config, pkgs, ... }:

{
imports = [
    ./nvim
    ./zsh
  ];
    home.username = "ariacell";
    home.homeDirectory = "/home/ariacell";

    home.stateVersion = "25.11";
  services.ollama = {
      enable = true;
      acceleration = "cuda"; # or "rocm" / "none"
    };
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


  home.sessionVariables = {
    _PR_AI_DISABLE=1; # Disable any potential ai features from pay-respects package across the board
  };

  home.packages = with pkgs; [
    #cli tools
    wget
    git
    htop
    neofetch
    oh-my-zsh
    curl
    fd
    # thefuck - This is no longer maintained it seems, trying pay-respects instead
    pay-respects
    tldr
    zoxide # cd standin with some help
    fzf
    tmux
    eza # ls alternative

    # Nix formatting
    nixfmt-rfc-style
   
    # devenv things
    devbox

    # c compiler for various baseline lua init and other toolchains
    gcc

    #python
    uv
    ];
}
