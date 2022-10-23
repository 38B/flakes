{
  description = "38+B flake configuration database";
  
  inputs = {
    
    nixpkgs.url = "nixpkgs/release-22.05";

    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
 
  };
  
  outputs = inputs@{ self, nixpkgs, utils, home-manager, ... }:
  let
    pkgs = self.pkgs.x86_64-linux.nixpkgs;
  in
  utils.lib.mkFlake {
    inherit self inputs;
    supportedSystems = [ "x86_64-linux" ];
    channelsConfig.allowUnfree = true;
    hostDefaults.modules = [
        home-manager.nixosModules.home-manager
        ./modules/common.nix
    ];

    hosts."proto".system = "x86_64-linux";
    hosts."proto".modules = [
      ./hosts/proto.nix
    ];
    
    # overlay = import ./overlays;

  };
}
