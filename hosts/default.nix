{config, pkgs, inputs, lib, ... }:
{
  proto = buildSystem {
    modules = [
      ./proto.nix 
      ../hw/cloud-vps-intel.nix
    ];
  };
}
