{ inputs, lib, config, pkgs, ... }: {
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors), use something like:
    # inputs.nix-colors.homeManagerModule

    # Feel free to split up your configuration and import pieces of it here.
  ];

  home = {
    username = "blob";
    homeDirectory = "/home/blob";
  };
  
  programs.home-manager.enable = true;
  programs.git.enable = true;
  home.packages = with pkgs; [ tmux ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.05";
}
