{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  home.username = "garcia";
  home.homeDirectory = "/home/garcia";

  home.stateVersion = "25.05"; 

  programs.git = {
    enable = true;
    userName = "ogtakizz";
    userEmail = "91156885+ogtakizz@users.noreply.github.com";
    extraConfig = {
       init.defaultBranch = "main";
    };
  }; 

  home.packages = with pkgs; [
	discord
	heroic
	lutris
	alacritty
	btop
	fastfetch
	scrcpy
	vscodium
	ani-cli
	jetbrains.idea
	qbittorrent
	libreoffice-fresh
	pipx
  ];

  home.file = {

  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
