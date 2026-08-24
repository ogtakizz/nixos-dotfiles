{ inputs, config, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./pkgs-stable.nix
    ./pkgs-unstable.nix
    ./flatpak.nix
  ];  
  
}
