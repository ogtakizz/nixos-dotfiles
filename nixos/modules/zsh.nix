{ pkgs, ... }:

{
  programs.zsh = {
    	enable = true;
    	autosuggestions.enable = true;
    	syntax.HighLighting.enable = true;
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
	   src = pkgs.fetchFromGithub {
	     owner = "mafredri";
	     repo = "zsh-async";
	     rev = "v1.8.6"
	     sha256 = "sha256-7p9m6S8Ert+Y9MOfP7/Jk5U9K3NIno0R4qH+Y9M9m7E=";
	     };
	}
	{
	   name = "Pure";
	   src = pkgs.fetchFromGithub {
		owner = "sindresorhus";
		repo = "pure";
		rev = "1.23.0";
		sha256 = "sha256-+mH6EnHAnSvc0Bss8978vdLop3UThf7T5fH9H8/jP30=";
	   };
	}
      ];

        promptinit = ''
	   autoload -U promptinit; promptinit
	   prompt pure	
	'';   

        shellAliases = {
      		nixedithome = "nvim ~/mysystem/nixos/home.nix";
      		nixrebuild = "cd ~/mysystem && sudo nixos-rebuild switch --flake .#myNixos";
      		nixedit = "nvim ~/mysystem/nixos/configuration.nix";
    	};
   };
}
