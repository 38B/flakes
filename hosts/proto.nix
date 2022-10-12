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

  fileSystems."/".device = "/dev/disk/by-label/slash";
  swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];

  networking.useDHCP = true;

  time.timeZone = "America/New_York";                                                                                                                                  
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    curl wget htop git
  ];

  nix = {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  users.users = {
    blob = {
      initialPassword = "correcthorsebatterystaple";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      extraGroups = [ "wheel" ];
    };
  };

  system.copySystemConfiguration = true;
  system.stateVersion = "22.05";
}
