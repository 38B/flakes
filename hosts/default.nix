{ inputs, system, ... }:
let
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;
in
{
  proto = nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      ./proto.nix 
      ../hw/cloud-vps-intel.nix
    ];
  };
}
