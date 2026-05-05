{ config, pkgs, lib,... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    
    # Nonfree EULAs for various CUDA libraries required for ollama hardware acceleration
    "libcublas"
    "cuda_cccl"
    "cuda_cudart"
             "cuda_nvcc"
  ];
}
