# Edit this configuration file to define what should be installed on                                                                                                     
# your system.  Help is available in the configuration.nix(5) man page                                                                                                   
# and in the NixOS manual (accessible by running ‘nixos-help’).                                                                                                          
                                                                                                                                                                         
{ config, pkgs, ... }:                                                                                                                                                   
                                                                                                                                                                         
{                                                                                                                                                                        

  networking.hostName = "proto";
                                                                                                                                                                         
  boot.loader.grub.enable = true;                                                                                                                                        
  boot.loader.grub.version = 2;                                                                                                                                          
  boot.loader.grub.device = "/dev/vda";
  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];

  networking.useDHCP = lib.mkDefault true;

  time.timeZone = "America/New_York";                                                                                                                                  
  i18n.defaultLocale = "en_US.UTF-8";

  system.copySystemConfiguration = true;
  system.stateVersion = "22.05";
}
