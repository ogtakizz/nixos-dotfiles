{ config, pkgs, ... }:

{ 
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
      		edithome = "nvim /home/garcia/mysystem/nixos/home.nix";
      		rebuild = "cd /home/garcia/mysystem && sudo nixos-rebuild switch --flake .#myNixos";
      		config = "nvim /home/garcia/mysystem/nixos/configuration.nix";
		      update = "cd /home/garcia/mysystem && sudo nix flake update && rebuild";
		      nixpkgs = "nvim /home/garcia/mysystem/nixos/modules/packages/default.nix";
          v = "nvim";
    	};
   };
}
