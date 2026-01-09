{ pkgs, ... }:

{
  
   environment.systemPackages = with pkgs; [
	chafa
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
	gedit
	vlc
	protontricks
	easyeffects
	gparted
	ntfs3g
	edk2-uefi-shell
	bluez
	bluez-tools
	logmein-hamachi
	haguichi
	slurp
	grim
	kdePackages.okular
	python3
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
