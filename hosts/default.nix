{ pkgs }:
{
  proto = nixpkgs.lib.nixosSystem {
    pkgs = packages.x86_64-linux;
    specialArgs = { inherit inputs; };
    modules = [./proto.nix];
  };
}
