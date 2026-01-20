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
      inputs.home-manager.nixosModules.home-manager
    ];

  # Home Manager
  home-manager = {
     	extraSpecialArgs = {inherit inputs; };
	users = {
    	   garcia = ./home.nix;
     };
   };

  nix.settings.download-buffer-size = 250000000;

  # Enable ZRAM
  zramSwap.enable = true;

  services.dbus.enable = true;


  #programs.zsh.enable = true;
  #users.defaultUserShell = pkgs.zsh;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;



  system.stateVersion = "25.11";

}
