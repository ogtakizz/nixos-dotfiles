{ inputs, config, pkgs, ... }:

{
  imports = [
     ./modules/zsh
    ./modules/nvchad
    inputs.spicetify-nix.homeManagerModules.default
    ./modules/spicetify
    ./modules/system/wireplumber.nix
    ./modules/home-manager/createDirs.nix
    ./modules/home-manager/servicesHome.nix
  ];

  home.username = "garcia";
  home.homeDirectory = "/home/garcia";
  home.stateVersion = "25.05";

  home.pointerCursor = {
    gtk.enable = true;
    #x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  qt = {
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  home.packages = with pkgs; [
	inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-lazer-bin
  pipes-rs
  gallery-dl
  gnupg
  pinentry-tty
  matugen
  discord
	btop
	fastfetch
	vscodium
	ani-cli
	jetbrains.idea
	qbittorrent
  wlr-randr
  kdePackages.qtstyleplugin-kvantum
  libsForQt5.qtstyleplugins
	cava
	tty-clock
	vlc
	gedit
	hydralauncher
	gamescope
  brave
  pcsx2
  ppsspp
  skyemu
  ryubing
  appimage-run
  cemu
  wl-clicker
  ];

  home.file = {

  };

  home.sessionVariables = {
    EDITOR = "nvim";
    QT_QPA_PLATFORMTHEME = "gtk2";
    QT_STYLE_OVERRIDE = "kvantum-dark";
    NIXOS_OZONE_WL = "1";
    GCM_CREDENTIAL_STORE = "cache";
    GIT_ASKPASS = "";
    SSH_ASKPASS = "";
    MOZ_ENABLE_WAYLAND = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
