{ pkgs, ...}:

{
  imports = [
    ./boot.nix
    ./drivers.nix
    ./network.nix
    ./disks.nix
    ./hyprland.nix
  ];
}
