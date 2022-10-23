{
  description = "38+B flake configuration database";
  
  inputs = {
    
    nixpkgs.url = "nixpkgs/release-22.05";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
 
  };
  
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  rec {
    packages = nixpkgs.lib.genAttrs [ "x86_64-linux" ] (system:
      import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      }
    );
  };
 
  homeConfigurations = (
      import ./homes 
  );

  nixosConfigurations = (
      import ./hosts
  );
}
