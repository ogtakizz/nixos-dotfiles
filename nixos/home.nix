{ inputs, config, pkgs, ... }:

{
  imports = [
     ./modules/zsh.nix
    ./modules/nvchad/nvchad.nix
  ];

  nixpkgs.config.allowUnfree = true;

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
    userName = "ogtakizz";
    userEmail = "91156885+ogtakizz@users.noreply.github.com";
    extraConfig = {
       init.defaultBranch = "main";
       credential.helper = "${pkgs.gh}/bin/gh auth git-helper";
    };
  }; 

  home.packages = with pkgs; [
	matugen
  discord
	heroic
	lutris
	btop
	fastfetch
	scrcpy
	vscodium
	ani-cli
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
	

  ];

  home.file = {

  };

  home.sessionVariables = {
    EDITOR = "nvim";
    QT_QPA_PLATFORMTHEME = "gtk2";
    QT_STYLE_OVERRIDE = "adwaita-dark";
    NIXOS_OZONE_WL = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
