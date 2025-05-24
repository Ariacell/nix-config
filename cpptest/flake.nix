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
        llvm = pkgs.llvmPackages_latest;
        lib = nixpkgs.lib;
      in {
        devShells.default = pkgs.mkShell {
          name = "cpp-dev-shell";

          buildInputs = with pkgs; [
            # pkgs.clang
            # pkgs.gdb
            # pkgs.lldb
            cmake
            # pkgs.pkg-config
            # pkgs.gcc
            llvm.lldb
            llvm.libllvm
            llvm.libcxx
            # llvm.clang
            clang-tools
          ];

          #          CPATH = builtins.concatStringsSep ":" [
          #      (lib.makeSearchPathOutput "dev" "include" [ llvm.libcxx ])
          #      (lib.makeSearchPath "resource-root/include" [ llvm.clang ])
          #    ];

          shellHook = ''
            echo "Welcome to the C++ development environment!"
            export CC=clang
            export CXX=clang++
          '';
        };
      });
}
