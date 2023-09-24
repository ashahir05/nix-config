{ inputs, outputs, lib, config, pkgs, localPkgs, ... }: {
  home.packages = with pkgs; [
    google-chrome
    zoom-us
    neovide
    bottles
    kicad
    jdk
    libGL
    libGL.dev
    glfw
  ];
}
