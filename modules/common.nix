{ pkgs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  nix = {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  system.copySystemConfiguration = true;
  system.stateVersion = "22.05";

}
