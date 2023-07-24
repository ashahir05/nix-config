{
  description = "Ahmed's Nix Config";

  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    zsh-autosuggestions = {
      url = "github:zsh-users/zsh-autosuggestions";
      flake = false;
    };
    zsh-syntax-highlighting = {
      url = "github:zsh-users/zsh-syntax-highlighting";
      flake = false;
    };
    
    paperwm-src = {
      url = "github:paperwm/PaperWM";
      flake = false;
    };
    
    glfw-src = {
      url = "github:glfw/glfw";
      flake = false;
    };
    
    pollymc-src = {
      url = "github:fn2006/PollyMC";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;  
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
      ];
    in
    rec {    
      packages = forAllSystems (system:
        let lib = nixpkgs.lib; pkgs = import nixpkgs { inherit system; };
        in import ./packages { inherit pkgs lib overlays; localPkgs = packages.${system}; }
      );
      overlays = forAllSystems (system:
        let lib = nixpkgs.lib; pkgs = import nixpkgs { inherit system; };
        in import ./overlays { inherit pkgs lib inputs; }
      );
        
      homeManagerModules = import ./modules;

      homeConfigurations = {
        "ashahir05@ashahir-LP" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; localPkgs = packages.x86_64-linux; };
          modules = [
            ./configuration.nix
          ];
        };
        "ashahir05@ashahir-PC" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; localPkgs = packages.x86_64-linux; };
          modules = [
            ./configuration.nix
          ];
        };
      };
    };
}
