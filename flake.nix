{
  description = "38+B flake configuration database";
  
  inputs = {
    nixpkgs.url = "nixpkgs/release-22.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = inputs:
  let 
    system = "x86_64-linux";
    pkgs = 
      import nixpkgs {
          inherit system;
          config.allowUnfree = true;
      };
  in
  {
    homeConfigurations = (
      import ./homes {
        inherit inputs system;
      }
    );

    nixosConfigurations = (
      import ./hosts {
        inherit inputs system;
      }
    );
  };

}
