{ inputs, ... }:

{
  imports = [ inputs.aerothemeplasma-nix.nixosModules.aerothemeplasma-nix ];

  boot.plymouth.enable = true;
  services.displayManager.defaultSession = "aerothemeplasmax11";

  programs.aeroshell = {
    enable = true;
    fonts.segoe.enable = true;
    polkit.enable = true;
    sessions = {
      wayland.enable = false;
    };
    aerothemeplasma = {
      enable = true;
      sddm.enable = false;
      plymouth.enable = true;
    };
  };
}
