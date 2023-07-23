{ inputs, outputs, lib, config, pkgs, lpkgs, ... }: {
  home.packages = with pkgs; [
    google-chrome
    zoom-us
    neovide
    bottles
    gamemode
    lpkgs.pollymc
  ];
}
