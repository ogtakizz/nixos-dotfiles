{ inputs, config, pkgs, ... }:

{
  imports = [
    ./librewolf.nix
    ./profile-manager.nix
    ./fonts.nix
    ./pkgs-stable.nix
    ./pkgs-unstable.nix
  ];  
  
 environment.systemPackages = with pkgs; [
    rbw
    libmtp
    mtpfs
    nautilus
    bitwarden-desktop
    mesa
    mesa-demos
    swww
    wireguard-tools
    protonvpn-gui
    mpv
    kitty
    pywal
	  imagemagickBig
	  nwg-look	
	  bibata-cursors
	  wget
	  git
	  flatpak
	  protontricks
	  gparted
	  bluez
	  bluez-tools
	  logmein-hamachi
	  python3
    go
	  pipx
    glib
    gtk3
    gobject-introspection
  ]
}
