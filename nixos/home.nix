{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  home.username = "garcia";
  home.homeDirectory = "/home/garcia";

  programs.zsh = {
    	enable = true;
    	autosuggestion.enable = true;
    	syntaxHighlighting.enable = true;
   	oh-my-zsh = {
    		enable = true;
		plugins = [
		  "git"
		  "sudo"
		  "colored-man-pages"
		  "extract"
		];
		 theme = "";	 
    	};

	plugins = [
	{
	   name = "zsh-async";
	   src = pkgs.fetchFromGitHub {
	     owner = "mafredri";
	     repo = "zsh-async";
	     rev = "v1.8.6";
	     sha256 = "sha256-Js/9vGGAEqcPmQSsumzLfkfwljaFWHJ9sMWOgWDi0NI=";
	     };
	}
	{
	   name = "Pure";
	   src = pkgs.fetchFromGitHub {
		owner = "sindresorhus";
		repo = "pure";
		rev = "v1.26.0";
		sha256 = "sha256-AZSxP2g6BWoxyiSQH7yzbbbfGcwD8jgnXPPfcYwJUL0=";
	   };
	}
      ];

        initContent = "
	   autoload -U promptinit; promptinit
	   prompt pure	
	";   

        shellAliases = {
      		nixedithome = "nvim ~/mysystem/nixos/home.nix";
      		nixrebuild = "cd ~/mysystem && sudo nixos-rebuild switch --flake .#myNixos";
      		nixedit = "nvim ~/mysystem/nixos/configuration.nix";
    	};
   };


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
