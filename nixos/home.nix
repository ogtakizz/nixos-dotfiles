{ inputs, config, pkgs, ... }:

{
  imports = [
     ./modules/zsh
    ./modules/nvchad
    inputs.spicetify-nix.homeManagerModules.default
    ./modules/spicetify
  ];

  home.username = "garcia";
  home.homeDirectory = "/home/garcia";
  home.stateVersion = "25.05";

  qt = {
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  programs.gh = {
    enable = true;
    settings = {
     git_protocol = "https";
    };
   };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "ogtakizz";
        email = "91156885+ogtakizz@users.noreply.github.com";
      };
      init.defaultBranch = "main";
      credential.helper = "${pkgs.gh}/bin/gh auth git-helper";
    };
  }; 

  home.packages = with pkgs; [
	pipes-rs
  gallery-dl
  matugen
  discord
	heroic
	lutris
	btop
	fastfetch
  bottles
	scrcpy
	vscodium
	ani-cli
  waydroid
	jetbrains.idea
	qbittorrent
  kdePackages.qtstyleplugin-kvantum
  libsForQt5.qtstyleplugins
	libreoffice-fresh
	cava
	tty-clock
	vlc
	gedit
	hydralauncher
	gamescope
	haguichi
  osu-lazer
  ];

  home.file = {

  };

  home.sessionVariables = {
    EDITOR = "nvim";
    QT_QPA_PLATFORMTHEME = "gtk2";
    QT_STYLE_OVERRIDE = "kvantum-dark";
    NIXOS_OZONE_WL = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
