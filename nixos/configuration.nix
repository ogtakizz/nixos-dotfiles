{ config, pkgs, inputs, ... }:

{
  imports =
     [
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
    ];

  system.stateVersion = "25.11";

}
