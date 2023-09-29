{ inputs, outputs, lib, config, pkgs, localPkgs, ... }: {
  home.packages = with pkgs; [
    google-chrome
    zoom-us
    neovide
    bottles
  ];

  programs.steam = {
    enable = true;
  };
}
