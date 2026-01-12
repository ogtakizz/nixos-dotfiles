{ inputs, config, pkgs, ... }:

{
  imports = [
     ./modules/zsh.nix
    ./modules/nvchad/nvchad.nix
     inputs.nix4nvchad.homeManagerModule
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "garcia";
  home.homeDirectory = "/home/garcia";
  home.stateVersion = "25.05";

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
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
