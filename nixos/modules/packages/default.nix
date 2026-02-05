{ inputs, config, pkgs, ... }:

{
  imports = [
    ./librewolf.nix
    ./profile-manager.nix
    ./fonts.nix
  ];  

  environment.systemPackages = with pkgs; [
    antigravity
    mesa
    mesa-demos
    swww
    wireguard-tools
    protonvpn-gui
    mpv
    kitty
    onlyoffice-desktopeditors
    pywal
	  imagemagickBig
	  unzip
	  zip
	  p7zip
	  unrar
	  nwg-look	
	  bibata-cursors
	  wget
	  git
	  flatpak
	  gnome-software
	  protontricks
	  easyeffects
	  gparted
	  ntfs3g
	  edk2-uefi-shell
	  bluez
	  bluez-tools
	  logmein-hamachi
	  kdePackages.okular
	  python3
    go
	  kdePackages.dolphin
	  pipx
    kdePackages.syntax-highlighting
    glib
    gtk3
    gobject-introspection
  ];
}
