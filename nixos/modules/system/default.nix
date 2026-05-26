{ pkgs, ...}:

{
  imports = [
    ./boot.nix
    ./drivers.nix
    ./network.nix
    #./disks.nix
    ./hyprland.nix
    ./portals.nix
  ];
  
  programs.nix-ld.enable = true;

  fonts.fontDir.enable = true;

  nix.settings = {
    auto-optimise-store = true;
    download-buffer-size = 250000000;
    experimental-features = [ 
      "nix-command" 
      "flakes"
    ];
    max-jobs = 2;
    substituters = [
      "https://cache.nixos.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };
 
  nixpkgs.config.allowUnfree = true;

  zramSwap.enable = true;
  
  services.dbus.enable = true;
  
  security.rtkit.enable = true;
  
  services.upower.enable = true;
  
  programs.gamemode = {
    enable = true;
    enableRenice = true;
  };  
  
  hardware.graphics.enable32Bit = true;
}
