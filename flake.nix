{ 
 inputs = {
  #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable/nixos-24.11";
  nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
 };

 outputs = { self, nixpkgs, nixos-wsl, ...}@inputs:
  let
   system = "x86_64-linux";
   pkgs = nixpkgs.legacyPackages.${system};
  in
  {
   nixosConfigurations.default = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};
    modules = [
      nixos-wsl.nixosModules.default
          {
            system.stateVersion = "24.11";
            wsl.enable = true;
          }
     ./configuration.nix
    ];
   };
  };

}
