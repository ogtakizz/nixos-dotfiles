{
  description = "My favourite NixOS flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixpkgs-stable = {
      url = "github:nixos/nixpkgs/nixos-25.11";
    };
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";    
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    millennium = {
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    };
    rusic = {
      url = "github:temidaradev/rusic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

    outputs = { self, nixpkgs, home-manager, dms, nixpkgs-stable, rusic, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      extraSpecialArgs = { inherit system inputs; };  
      specialArgs = { inherit system inputs; };   
      pkgsStable = import nixpkgs-stable {
        inherit system inputs;
        config.allowUnfree = true;  
      };
    in 
    {
      nixosConfigurations = {
        myNixos = lib.nixosSystem {
          specialArgs = {
            inherit system inputs;
            inherit pkgsStable;
          };
      modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager = {
              extraSpecialArgs = { inherit system inputs; };
              useGlobalPkgs = true;
              useUserPackages = true;
            };
          }
          {
            nixpkgs.overlays = [
              (final: prev: {
                electron = inputs.nixpkgs-stable.legacyPackages.${system}.electron;
               })             
            ];
          }
        ];
      };
    };
  };
}
