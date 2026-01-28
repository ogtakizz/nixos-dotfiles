{
  description = "My favourite NixOS flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
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
  };

    outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      extraSpecialArgs = { inherit system inputs; };  
      specialArgs = { inherit system inputs; };       
    in 
    {
      nixosConfigurations = {
        myNixos = lib.nixosSystem {
          specialArgs = {
            inherit system inputs;          
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
        ];
      };
    };
  };
}
