{ config, pkgs, inputs, ... }:

{
  imports =
     [
     inputs.dms.nixosModules.dank-material-shell
     ./hardware-configuration.nix
      ./modules/packages
      ./modules/services
      ./modules/users
      ./modules/system
      ./modules/garbage-collector
      ./modules/zsh/zsh.nix
      ./modules/sddm
      ./modules/virt-manager
      ./modules/home-manager
      ./modules/printer
      ./modules/rust/shell.nix
    ];

  system.stateVersion = "25.11";

}
