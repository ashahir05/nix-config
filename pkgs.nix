{ inputs, outputs, lib, config, pkgs, localPackages, ... }: {
  home.packages = with pkgs; [
    google-chrome
    zoom-us
    neovide
    bottles
    gamemode
    localPackages.pollymc
  ];
}
