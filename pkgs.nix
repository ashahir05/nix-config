{ inputs, outputs, lib, config, pkgs, localPkgs, ... }: {
  home.packages = with pkgs; [
    google-chrome
    zoom-us
    neovide
    bottles
    kicad
    jdk
    libGL
    glfw
    openal
    libpulseaudio
    flite
    xorg.libXxf86vm
  ];
}
