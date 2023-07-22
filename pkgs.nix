{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./tools.nix
  ];

  home.packages = with pkgs; [
    google-chrome
    zoom-us
    neovide
    bottles
    gamemode
    pollymc
  ];
}
