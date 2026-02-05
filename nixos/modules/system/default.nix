{ pkgs, ...}:

{
  imports = [
    ./boot.nix
    ./drivers.nix
    ./network.nix
    #./disks.nix
    ./hyprland.nix
  ];
  
  programs.nix-ld.enable = true;

  nix.settings.download-buffer-size = 250000000;
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  
  zramSwap.enable = true;
  
  nixpkgs.config.allowUnfree = true;
  
  services.dbus.enable = true;
  
  security.rtkit.enable = true;
  
  services.upower.enable = true;
  
  programs.gamemode = {
    enable = true;
    enableRenice = true;
  };  
  
  hardware.graphics.enable32Bit = true;
}
