{ inputs, pkgs, lib, ... }:

{
  imports = [
    inputs.silentSDDM.nixosModules.default
  ];
  
  programs.silentSDDM = {
    enable = true;
    theme = "ken";
  };
  
  services.displayManager.sddm = {
    enable = true;
    package = lib.mkForce pkgs.kdePackages.sddm;
  };
}
