{ inputs, config, pkgs, ... }:

{
  imports = [
    ./librewolf.nix
    ./profile-manager.nix
    ./fonts.nix
    ./pkgs-stable.nix
    ./pkgs-unstable.nix
  ];  
  
}
