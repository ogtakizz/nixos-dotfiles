{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  home.username = "garcia";
  home.homeDirectory = "/home/garcia";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
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
    # EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
