{
  description = "My first flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    lanzaboote.url = "github:nix-community/lanzaboote";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, lanzaboote, ... }:
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true;};
    in {
      nixosConfigurations = {
        nixy = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix 
            lanzaboote.nixosModules.lanzaboote
            ./modules/system/secureboot.nix       
          ];
        };
      };
      homeConfigurations = {
        chompou = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
    };
}
