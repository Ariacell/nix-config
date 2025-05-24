{ config, pkgs, ... }:

{
  imports = [ ../../modules/common.nix ];

  networking.hostName = "wsl2";
  system.stateVersion = "24.11";
  wsl.enable = true;
  wsl.defaultUser = "ariacell";

  # Define the user
  users.users.ariacell = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
    password = "";
  };

  programs.zsh.enable = true;

  # Disable services that are not relevant in WSL
  services.openssh.enable = false;
  networking.networkmanager.enable = false;
  systemd.services.NetworkManager.enable = false;
}
