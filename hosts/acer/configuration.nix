{ config, pkgs, ... }:

{
  imports = [ ../../modules/common.nix ];

  networking.hostName = "acerLaptop";
  system.stateVersion = "25.11";

  # Define the user
  users.users.ariacell = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
    password = "";
  };

  programs.zsh.enable = true;

}
