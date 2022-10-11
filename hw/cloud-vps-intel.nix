{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  virtualisation.hypervGuest.enable = false;
}
