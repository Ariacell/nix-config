{config, pkgs, ...}:
{
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

}
