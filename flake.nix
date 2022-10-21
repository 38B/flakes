{
  description = "38+B flake configuration database";
  
  inputs = {
    
    nixpkgs.url = "nixpkgs/release-22.05";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    deploy-rs.url = "github:serokell/deploy-rs";
    deploy-rs.inputs.nixpkgs.follows = "nixpkgs";
  
  };
  
  outputs = inputs @ { self, nixpkgs, deploy-rs, home-manager, ... }:
  let 
    system = "x86_64-linux";
    inherit nixpkgs lib;
    specialArgs = { inherit inputs; };
    buildConfig = modules: { inherit modules system specialArgs; };
    buildSystem = modules: lib.nixosSystem (buildConfig modules);
    deployNixos = s: deploy-rs.lib.${s.pkgs.system}.activate.nixos s;
    deployHomeManager = sys: s: deploy-rs.lib.${sys}.activate.home-manager s;
  in
  {
    homeConfigurations = (
      import ./homes; 
    );

    nixosConfigurations = (
      import ./hosts;
    );
  };

}
