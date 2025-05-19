{
  description = "C++ development environment with Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShells.default = pkgs.mkShell {
          name = "cpp-dev-shell";

          buildInputs = [
            pkgs.clang
            pkgs.cmake
            pkgs.gdb
            pkgs.lldb
            pkgs.cmake
            pkgs.pkg-config
            pkgs.gcc
          ];

          shellHook = ''
            echo "Welcome to the C++ development environment!"
            export CC=clang
            export CXX=clang++
          '';
        };
      });
}