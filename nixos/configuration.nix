# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/boot.nix
      ./modules/packages
      ./modules/programs
      ./modules/drivers.nix
      ./modules/network.nix     
      ./modules/users
      ./modules/hyprland.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  # Home Manager
  home-manager = {
     	extraSpecialArgs = {inherit inputs; };
	users = {
    	   garcia = ./home.nix;
     };
   };

  fileSystems."/mnt/jogos_windows" = {
  device = "/dev/disk/by-uuid/455110F54AEDA354";
  fsType = "ntfs-3g";
  options = [
      "rw" 
      "uid=1000" 
      "gid=100" 
      "umask=000"
      "exec" 
      "nofail" 
    ];
  };

  boot.supportedFilesystems = ["ntfs"];

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable ZRAM
  zramSwap.enable = true;

  services.dbus.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.firefox.enable = true;
  
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

  nix.gc ={
     automatic = true;
     dates = "weekly";
     options = "--delete-older-than 7d";
  };
  
  nix.settings.auto-optimise-store = true;

  system.stateVersion = "25.11";

}
