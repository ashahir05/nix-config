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
    libpulseaudio
    openal
    flite
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXext
    xorg.libX11
    xorg.libXxf86vm
  ];
}
