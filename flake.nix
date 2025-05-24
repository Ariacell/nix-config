{
  description = "Simple NixOS config with Home Manager and Neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        packages.default = pkgs.hello;
      }) // {
        nixosConfigurations = {
          my-host = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/my-host/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ariacell = import ./home/ariacell/home.nix;
            }
          ];
        };
          wsl2 = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [             
              nixos-wsl.nixosModules.wsl
              ./hosts/wsl2/configuration.nix
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.ariacell = import ./home/ariacell/home.nix;
              }
            ];
            specialArgs = {
             inherit nixos-wsl;
            };
          };
      };
};
}
