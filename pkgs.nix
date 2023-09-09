{ inputs, outputs, lib, config, pkgs, localPkgs, ... }: {
  home.packages = with pkgs; [
    google-chrome
    zoom-us
    anytype
    neovide
    bottles
    kicad
  ];
}
