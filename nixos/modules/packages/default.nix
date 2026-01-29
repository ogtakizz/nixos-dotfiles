{ inputs, config, pkgs, ... }:

{
  imports = [
    ./librewolf.nix
    ./profile-manager.nix
  ];  

  environment.systemPackages = with pkgs; [
    vesktop
    mesa
    mesa-demos
    swww
    wireguard-tools
    protonvpn-gui
    openvpn
    mpv
    kitty
    onlyoffice-desktopeditors
    pywal16
	  imagemagick
	  unzip
	  zip
	  p7zip
	  unrar
	  nwg-look	
	  bibata-cursors
	  wget
	  gnome-tweaks
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
	  slurp
	  grim
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
  
  fonts = {
    packages = with pkgs; [
	    noto-fonts
	    noto-fonts-cjk-sans
	    noto-fonts-color-emoji
	    fira-code
	    fira-code-symbols
	    material-symbols
	    nerd-fonts.jetbrains-mono
	    liberation_ttf
	    papirus-icon-theme
	    adwaita-icon-theme
    ];

  fontconfig = {
     defaultFonts = {
	    monospace = ["JetBrainsMono Nerd Font"];
	    sansSerif = ["JetBrainsMono Nerd Font"];
	    serif = ["JetBrainsMono Nerd Font"];
      };
    };
  };	
}
