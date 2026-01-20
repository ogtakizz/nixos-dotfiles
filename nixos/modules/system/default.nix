{ pkgs, ...}:

{
  imports = [
    ./boot.nix
    ./drivers.nix
    ./network.nix
    ./disks.nix
    ./hyprland.nix
  ];
  
  nix.settings.download-buffer-size = 250000000;
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  zramSwap.enable = true;
  nixpkgs.config.allowUnfree = true;
  services.dbus.enable = true;
}
