# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
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
