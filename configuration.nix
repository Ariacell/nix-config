# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, inputs, ... }:

let
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
    sha256 = "156hc11bb6xiypj65q6gzkhw1gw31dwv6dfh6rnv20hgig1sbfld";
};
in
{
  imports = [
    ./hardware-configuration.nix
    ./aria-user.nix
    (import "${home-manager}/nixos")
  ];

  wsl.enable = true;
  wsl.defaultUser = "aria";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?


  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "aria" = import ./home.nix;
    };
  };
  #home-manager = {
  #  #specialArgs = { inherit inputs; };
  #  aria = import ./home.nix;
  #};
  #home-manager.users.aria = { pkgs, ... }: {
  #  home.packages = [ pkgs.atool pkgs.vim pkgs.httpie ];
  #  programs.bash.enable = true;
  #  programs.home-manager.enable = true;
  #  # The state version is required and should stay at the version you
  #  # originally installed.
  #  home.stateVersion = "24.11";
  #};

}
